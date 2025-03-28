<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindfulMe - Login</title>        
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
                
                <h2>Welcome Back</h2>
                <p class="subtitle">Continue your mindfulness journey</p>

                <form class="auth-form">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" required>
                        <span class="password-toggle">👁️</span>
                    </div>

                    <button type="submit" class="auth-btn">Login</button>
                </form>

                <p class="switch-auth">
                    New to MindfulMe? 
                    <a href="register.html">Create Account</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html> 