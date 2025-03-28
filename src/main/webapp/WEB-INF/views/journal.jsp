<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindfulMe - Quick Journal</title>
           <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/journal.css' />">
       <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/front.css' />">
    <script src="<c:url value='/resources/js/journal.js' />"></script>
    
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Dancing+Script:wght@600&family=Playfair+Display:ital,wght@1,500&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- Floating shapes from front page -->
        <div class="floating-shapes">
            <div class="shape"></div>
            <div class="shape"></div>
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
                    <li><a href="front.html">Home</a></li>
                    <li><a href="moodtrack.html">Mood Tracker</a></li>
                    <li><a href="#" class="active">Quick Journal</a></li>
                    <li><a href="#" class="dashboard-link">
                        <span class="icon">👤</span>
                        Dashboard
                    </a></li>
                </ul>
                <button class="login-btn">Login</button>
            </nav>
        </header>

        <main>
            <div class="glass-card journal-card">
                <div class="welcome-message">Express Your Mood in 8 Words</div>
                
                <div class="journal-input-container">
                    <div class="word-counter">
                        <span class="current">0</span>/8 words
                    </div>
                    
                    <input type="text" 
                           class="mood-input" 
                           placeholder="How are you feeling right now?"
                           maxlength="50">
                    
                    <div class="input-feedback">
                        Keep it simple and honest
                    </div>
                </div>

                <button class="save-entry-btn">
                    <span class="btn-icon">💫</span>
                Send To AI Therapist
                </button>

                <div class="previous-entries">
                    <h3>Recent Expressions</h3>
                    <div class="entries-list">
                        <!-- Entries will be added here -->
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="journal.js"></script>
</body>
</html> 