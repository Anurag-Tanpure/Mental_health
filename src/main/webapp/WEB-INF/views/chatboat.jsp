<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindfulMe - AI Chat Assistant</title>
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/chatboat.css' />">
       <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/front.css' />">
       <script src="<c:url value='/resources/js/chatboat.js' />"></script>
    
       <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Dancing+Script:wght@600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- Floating shapes -->
        <div class="floating-shapes">
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
        </div>

        <!-- Header -->
        <header>
            <nav class="main-nav">
                <div class="logo">
                    <span class="logo-icon">🌿</span>
                    <span class="logo-text">MindfulMe</span>
                </div>
                <ul class="nav-links">
                    <li><a href="<c:url value='/home'/>">Home</a></li>
                    <li><a href="<c:url value='/mood'/>">Mood Tracker</a></li>
                    <li><a href="<c:url value='/journal'/>">Journal</a></li>
                    <li><a href="#" class="active">AI Chat</a></li>
                </ul>
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <button class="profile-btn">${sessionScope.user.username}</button>
                    </c:when>
                    <c:otherwise>
                        <button class="login-btn" onclick="window.location.href='<c:url value='/login'/>'">Login</button>
                    </c:otherwise>
                </c:choose>
            </nav>
        </header>

        <main>
            <div class="glass-card chat-container">
                <div class="chat-header">
                    <div class="ai-info">
                        <div class="ai-avatar">🤖</div>
                        <div class="ai-status">
                            <h3>MindfulMe AI</h3>
                            <span class="status">Online</span>
                        </div>
                    </div>
                    <div class="chat-actions">
                        <button class="clear-chat">Clear Chat</button>
                    </div>
                </div>

                <div class="chat-messages" id="chatMessages">
                    <c:if test="${empty chatHistory}">
                        <div class="message ai-message">
                            <div class="message-content">
                                Hello! I'm your MindfulMe AI assistant. How are you feeling today?
                            </div>
                            <div class="message-time">Now</div>
                        </div>
                    </c:if>
                    
                    <c:forEach items="${chatHistory}" var="chat">
                        <div class="message ${chat.isUser ? 'user-message' : 'ai-message'}">
                            <div class="message-content">
                                ${chat.message}
                            </div>
                            <div class="message-time">
                                ${chat.timestamp}
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <form class="chat-input-container" action="<c:url value='/chat/send'/>" method="POST" id="chatForm">
                    <div class="input-wrapper">
                        <textarea 
                            id="userInput" 
                            name="message"
                            placeholder="Type your message here..."
                            rows="1"
                            required
                        ></textarea>
                        <div class="input-actions">
                            <button type="button" class="emoji-btn">😊</button>
                            <button type="submit" class="send-btn" id="sendMessage">
                                <span class="send-icon">📤</span>
                            </button>
                        </div>
                    </div>
                    <div class="typing-indicator">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const chatForm = document.getElementById('chatForm');
            const userInput = document.getElementById('userInput');
            const chatMessages = document.getElementById('chatMessages');
            const typingIndicator = document.querySelector('.typing-indicator');
            const clearButton = document.querySelector('.clear-chat');

            // Auto-resize textarea
            userInput.addEventListener('input', () => {
                userInput.style.height = 'auto';
                userInput.style.height = userInput.scrollHeight + 'px';
            });

            // Form submission
            chatForm.addEventListener('submit', async (e) => {
                e.preventDefault();
                const message = userInput.value.trim();
                if (!message) return;

                // Show typing indicator
                typingIndicator.classList.add('active');

                try {
                    const formData = new FormData(chatForm);
                    const response = await fetch(chatForm.action, {
                        method: 'POST',
                        body: formData
                    });

                    if (response.ok) {
                        const data = await response.json();
                        // Update chat with both user message and AI response
                        updateChat(data);
                    } else {
                        throw new Error('Network response was not ok');
                    }
                } catch (error) {
                    console.error('Error:', error);
                    showError("Sorry, something went wrong. Please try again.");
                } finally {
                    typingIndicator.classList.remove('active');
                    userInput.value = '';
                    userInput.style.height = 'auto';
                }
            });

            // Clear chat
            clearButton.addEventListener('click', async () => {
                if (confirm('Are you sure you want to clear the chat?')) {
                    try {
                        const response = await fetch('<c:url value="/chat/clear"/>', {
                            method: 'POST'
                        });
                        if (response.ok) {
                            chatMessages.innerHTML = '';
                            showWelcomeMessage();
                        }
                    } catch (error) {
                        console.error('Error:', error);
                        showError("Failed to clear chat.");
                    }
                }
            });

            function updateChat(data) {
                const { userMessage, aiResponse, timestamp } = data;
                
                // Add messages to chat
                appendMessage('user-message', userMessage, timestamp);
                appendMessage('ai-message', aiResponse, timestamp);
                
                scrollToBottom();
            }

            function appendMessage(className, message, timestamp) {
                const div = document.createElement('div');
                div.className = `message ${className}`;
                div.innerHTML = `
                    <div class="message-content">${message}</div>
                    <div class="message-time">${timestamp}</div>
                `;
                chatMessages.appendChild(div);
            }

            function showWelcomeMessage() {
                appendMessage('ai-message', 
                    "Hello! I'm your MindfulMe AI assistant. How are you feeling today?", 
                    'Now'
                );
            }

            function showError(message) {
                appendMessage('ai-message', message, 'Now');
            }

            function scrollToBottom() {
                chatMessages.scrollTop = chatMessages.scrollHeight;
            }
        });
    </script>
</body>
</html> 