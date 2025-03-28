<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindfulMe - Register</title>
    
     <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/auth.css' />">
       <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/front.css' />">
   
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

        <div class="auth-container">
            <div class="glass-card auth-card">
                <div class="logo">
                    <span class="logo-icon">🌿</span>
                    <span class="logo-text">MindfulMe</span>
                </div>
                
                <h2>Create Account</h2>
                <p class="subtitle">Start your mindfulness journey today</p>

                <form class="auth-form">
                    <div class="form-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" required>
                    </div>

                    <div class="form-group">
                        <label for="age">Age</label>
                        <input type="number" id="age" required min="13" max="120">
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" required>
                        <span class="password-toggle">👁️</span>
                    </div>

                    <button type="submit" class="auth-btn">Create Account</button>
                </form>

                <p class="switch-auth">
                    Already have an account? 
                    <a href="login.html">Login</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html> 