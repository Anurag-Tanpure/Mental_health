<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindfulMe - Mood Tracking</title>
       <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/front.css' />">
       <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mood.css' />">
    <script src="<c:url value='/resources/js/mood.js' />"></script>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mood.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Dancing+Script:wght@600&family=Playfair+Display:ital,wght@1,500&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- Reuse the same header from front.html -->
        <header>
            <nav class="main-nav">
                <div class="logo">
                    <span class="logo-icon">🌿</span>
                    <span class="logo-text">MindfulMe</span>
                </div>
                <ul class="nav-links">
                    <li><a href="front.html">Home</a></li>
                    <li><a href="#" class="active">Mood Tracker</a></li>
                    <li><a href="#">Journal</a></li>
                    <li><a href="#" class="dashboard-link">
                        <span class="icon">👤</span>
                        Dashboard
                    </a></li>
                </ul>
                <button class="login-btn">Login</button>
            </nav>
        </header>

        <main>
            <div class="glass-card mood-tracker">
                <div class="welcome-message">How are you feeling today?</div>
                
                <!-- Quick Mood Selector -->
                <div class="quick-mood-selector">
                    <span>😢</span>
                    <input type="range" class="mood-slider" min="1" max="5" value="3">
                    <span>😊</span>
                </div>

                <!-- Mood Input Methods -->
                <div class="mood-input-container">
                    <!-- Emoji Selection -->
                    <div class="mood-section emoji-section">
                        <h3>Select Your Mood</h3>
                        <div class="emoji-grid">
                            <button class="emoji-btn" data-mood="5" data-emotion="happy">😊 <span>Happy</span></button>
                            <button class="emoji-btn" data-mood="4" data-emotion="calm">😌 <span>Calm</span></button>
                            <button class="emoji-btn" data-mood="3" data-emotion="neutral">😐 <span>Neutral</span></button>
                            <button class="emoji-btn" data-mood="2" data-emotion="sad">😢 <span>Sad</span></button>
                            <button class="emoji-btn" data-mood="1" data-emotion="anxious">😰 <span>Anxious</span></button>
                        </div>
                    </div>

                    <!-- Mood Tags -->
                    <div class="mood-tags">
                        <span class="mood-tag">#Grateful</span>
                        <span class="mood-tag">#Peaceful</span>
                        <span class="mood-tag">#Motivated</span>
                        <span class="mood-tag">#Energetic</span>
                        <span class="mood-tag">#Relaxed</span>
                    </div>

                    <!-- Text Input -->
                    <div class="mood-section text-section">
                        <h3>Express Your Feelings</h3>
                        <div class="text-input-container">
                            <textarea 
                                placeholder="How are you feeling? Share your thoughts..."
                                class="mood-textarea"
                            ></textarea>
                        </div>
                    </div>

                    <!-- Voice Input -->
                    <div class="mood-section voice-section">
                        <h3>Voice Your Emotions</h3>
                        <button class="voice-btn">
                            <i class="fas fa-microphone"></i>
                            <span>Hold to Speak</span>
                        </button>
                        <div class="voice-feedback">
                            <span class="voice-text">Click and hold to start recording...</span>
                            <div class="voice-waves">
                                <span></span><span></span><span></span><span></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Instant Feedback Section -->
                <div class="feedback-section">
                    <div class="mood-analysis">
                        <h3>Your Mood Analysis</h3>
                        <div class="mood-meter">
                            <div class="mood-level" style="width: 0%"></div>
                        </div>
                        <p class="mood-description">Select a mood or share your thoughts to see analysis</p>
                    </div>
                    
                    <div class="suggestions">
                        <h3>Personalized Suggestions</h3>
                        <div class="suggestion-cards">
                            <!-- Suggestions will be added dynamically -->
                        </div>
                    </div>
                </div>

                <!-- Save Button -->
                <button class="save-mood-btn primary-btn">
                    <i class="fas fa-heart"></i>
                    Save My Mood
                </button>
            </div>

            <!-- Quote Clouds -->
            <div class="quote-clouds">
                <div class="quote-bubble" style="animation-delay: 0s">
                    <p>"Every day is a new beginning. Take a deep breath, smile, and start again."</p>
                </div>
                <div class="quote-bubble" style="animation-delay: 2s">
                    <p>"Your emotions are valid. Embrace them, understand them, learn from them."</p>
                </div>
                <div class="quote-bubble" style="animation-delay: 4s">
                    <p>"Small steps forward are still progress. Be proud of how far you've come."</p>
                </div>
            </div>
        </main>
    </div>

    <script src="mood.js"></script>
</body>
</html>
