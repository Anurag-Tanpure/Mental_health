document.addEventListener('DOMContentLoaded', () => {
    const emojiButtons = document.querySelectorAll('.emoji-btn');
    const moodTextarea = document.querySelector('.mood-textarea');
    const voiceBtn = document.querySelector('.voice-btn');
    const moodLevel = document.querySelector('.mood-level');
    const moodDescription = document.querySelector('.mood-description');
    const suggestionCards = document.querySelector('.suggestion-cards');
    const saveButton = document.querySelector('.save-mood-btn');

    // Emoji Selection
    emojiButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove selected class from all buttons
            emojiButtons.forEach(b => b.classList.remove('selected'));
            // Add selected class to clicked button
            btn.classList.add('selected');
            
            // Update mood meter
            const moodValue = parseInt(btn.dataset.mood);
            const moodPercentage = (moodValue / 5) * 100;
            moodLevel.style.width = `${moodPercentage}%`;

            // Update mood description
            updateMoodDescription(btn.dataset.emotion);

            // Show suggestions
            showSuggestions(btn.dataset.emotion);
        });
    });

    // Text Analysis
    let textTimeout;
    moodTextarea.addEventListener('input', () => {
        clearTimeout(textTimeout);
        textTimeout = setTimeout(() => {
            analyzeMoodFromText(moodTextarea.value);
        }, 500);
    });

    // Voice Recording
    let isRecording = false;
    voiceBtn.addEventListener('mousedown', startRecording);
    voiceBtn.addEventListener('mouseup', stopRecording);
    voiceBtn.addEventListener('mouseleave', stopRecording);

    function startRecording() {
        isRecording = true;
        voiceBtn.classList.add('recording');
        // Add recording logic here
    }

    function stopRecording() {
        if (isRecording) {
            isRecording = false;
            voiceBtn.classList.remove('recording');
            // Add stop recording logic here
        }
    }

    // Helper Functions
    function updateMoodDescription(emotion) {
        const descriptions = {
            happy: "You're feeling great today! Keep spreading the positivity!",
            calm: "You're in a peaceful state of mind. Perfect for meditation!",
            neutral: "You're feeling balanced today. A good time for reflection.",
            sad: "It's okay to feel down sometimes. Remember, this too shall pass.",
            anxious: "Take deep breaths. You're stronger than you think!"
        };
        moodDescription.textContent = descriptions[emotion] || "How are you feeling?";
    }

    function showSuggestions(emotion) {
        const suggestions = {
            happy: [
                { icon: "🌟", text: "Share your joy with others" },
                { icon: "🎵", text: "Create a happy playlist" }
            ],
            calm: [
                { icon: "🧘‍♀️", text: "Try a meditation session" },
                { icon: "📖", text: "Read a relaxing book" }
            ],
            neutral: [
                { icon: "🎯", text: "Set a small goal for today" },
                { icon: "🚶‍♂️", text: "Take a refreshing walk" }
            ],
            sad: [
                { icon: "☎️", text: "Talk to a loved one" },
                { icon: "🎨", text: "Express through art" }
            ],
            anxious: [
                { icon: "🫁", text: "Try deep breathing exercises" },
                { icon: "📝", text: "Write down your thoughts" }
            ]
        };

        suggestionCards.innerHTML = suggestions[emotion]
            .map(suggestion => `
                <div class="suggestion-card">
                    <span class="suggestion-icon">${suggestion.icon}</span>
                    <p>${suggestion.text}</p>
                </div>
            `).join('');
    }

    function analyzeMoodFromText(text) {
        // Simple mood analysis based on keywords
        const keywords = {
            happy: ['happy', 'joy', 'excited', 'great'],
            sad: ['sad', 'down', 'upset', 'unhappy'],
            anxious: ['anxious', 'worried', 'nervous', 'stress'],
            calm: ['calm', 'peaceful', 'relaxed', 'serene']
        };

        // Add your mood analysis logic here
        // This is a simplified version
        for (let mood in keywords) {
            if (keywords[mood].some(word => text.toLowerCase().includes(word))) {
                updateMoodDescription(mood);
                showSuggestions(mood);
                return;
            }
        }
    }

    // Save Mood
    saveButton.addEventListener('click', () => {
        // Add save animation
        saveButton.classList.add('saved');
        setTimeout(() => saveButton.classList.remove('saved'), 1000);
        
        // Add your save logic here
    });
}); 