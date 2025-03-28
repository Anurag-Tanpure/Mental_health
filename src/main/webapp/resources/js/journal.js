document.addEventListener('DOMContentLoaded', () => {
    const moodInput = document.querySelector('.mood-input');
    const wordCounter = document.querySelector('.word-counter .current');
    const saveButton = document.querySelector('.save-entry-btn');
    const entriesList = document.querySelector('.entries-list');
    const inputFeedback = document.querySelector('.input-feedback');

    // Word counter
    moodInput.addEventListener('input', () => {
        const words = moodInput.value.trim().split(/\s+/);
        const wordCount = moodInput.value.trim() === '' ? 0 : words.length;
        wordCounter.textContent = wordCount;

        // Update feedback and styling based on word count
        if (wordCount > 8) {
            inputFeedback.textContent = 'Please keep it to 8 words or less';
            inputFeedback.style.color = '#ff4b4b';
        } else {
            inputFeedback.textContent = 'Keep it simple and honest';
            inputFeedback.style.color = 'var(--text-color)';
        }
    });

    // Save entry
    saveButton.addEventListener('click', () => {
        const words = moodInput.value.trim().split(/\s+/);
        if (words.length > 8) {
            alert('Please limit your entry to 8 words');
            return;
        }

        if (moodInput.value.trim() === '') {
            alert('Please enter your thoughts');
            return;
        }

        // Create new entry
        const entry = document.createElement('div');
        entry.className = 'entry-item';
        entry.innerHTML = `
            <span class="entry-text">${moodInput.value}</span>
            <span class="entry-time">${new Date().toLocaleTimeString()}</span>
        `;

        // Add to list
        entriesList.insertBefore(entry, entriesList.firstChild);

        // Clear input
        moodInput.value = '';
        wordCounter.textContent = '0';

        // Save animation
        saveButton.classList.add('saved');
        setTimeout(() => saveButton.classList.remove('saved'), 1000);
    });
}); 