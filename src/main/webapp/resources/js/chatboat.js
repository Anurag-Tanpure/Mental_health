document.addEventListener('DOMContentLoaded', () => {
    const chatMessages = document.getElementById('chatMessages');
    const userInput = document.getElementById('userInput');
    const sendButton = document.getElementById('sendMessage');
    const typingIndicator = document.querySelector('.typing-indicator');
    const clearButton = document.querySelector('.clear-chat');

    // Auto-resize textarea
    userInput.addEventListener('input', () => {
        userInput.style.height = 'auto';
        userInput.style.height = userInput.scrollHeight + 'px';
    });

    // Send message on Enter (Shift+Enter for new line)
    userInput.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' && !e.shiftKey) 
	    {
            e.preventDefault();
            sendMessage();
        }
    });

    // Send button click
    sendButton.addEventListener('click', sendMessage);

    // Clear chat
    clearButton.addEventListener('click', () => {
        const confirmed = confirm('Are you sure you want to clear the chat?');
        if (confirmed) {
            chatMessages.innerHTML = '';
            addAIMessage("Chat cleared. How can I help you?");
        }
    });

    function sendMessage() {
        const message = userInput.value.trim();
        if (!message) return;

        // Add user message
        addUserMessage(message);
        userInput.value = '';
        userInput.style.height = 'auto';

        // Show typing indicator
        typingIndicator.classList.add('active');

        // Send to backend
        sendToBackend(message);
    }

    function addUserMessage(message) {
        const messageElement = createMessageElement('user-message', message);
        chatMessages.appendChild(messageElement);
        scrollToBottom();
    }

    function addAIMessage(message) {
        const messageElement = createMessageElement('ai-message', message);
        chatMessages.appendChild(messageElement);
        scrollToBottom();
    }

    function createMessageElement(className, message) {
        const div = document.createElement('div');
        div.className = `message ${className}`;
        div.innerHTML = `
            <div class="message-content">${message}</div>
            <div class="message-time">${getCurrentTime()}</div>
        `;
        return div;
    }

    function getCurrentTime() {
        return new Date().toLocaleTimeString([], { 
            hour: '2-digit', 
            minute: '2-digit' 
        });
    }

    function scrollToBottom() {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    async function sendToBackend(message) {
        try {
            const response = await fetch('/api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ message })
            });

            const data = await response.json();
            
            // Hide typing indicator
            typingIndicator.classList.remove('active');

            // Add AI response
            addAIMessage(data.response);

        } catch (error) {
            console.error('Error:', error);
            typingIndicator.classList.remove('active');
            addAIMessage("Sorry, I'm having trouble connecting. Please try again.");
        }
    }
}); 