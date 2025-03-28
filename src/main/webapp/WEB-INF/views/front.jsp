<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MindfulMe - Your Mental Wellness Companion</title>

<!-- Link CSS from the correct location 
    -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/front.css' />">


<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Dancing+Script:wght@600&family=Playfair+Display:ital,wght@1,500&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- Floating shapes -->
		<div class="floating-shapes">
			<div class="shape"></div>
			<div class="shape"></div>
			<div class="shape"></div>
			<div class="shape"></div>
			<div class="shape"></div>
		</div>

		<!-- Header Navigation -->
		<header>
			<nav class="main-nav">
				<div class="logo">MindfulMe</div>
				<ul class="nav-links">
					<li><a href="#home" class="active">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
					<li><a href="#dashboard" class="dashboard-link"> <span
							class="icon">👤</span> Dashboard
					</a></li>
				</ul>
				<button class="login-btn" onclick="window.location.href='<c:url value="/log" />'">Login</button>
				<div class="menu-toggle">
					<span></span> <span></span> <span></span>
				</div>
			</nav>
		</header>

		<!-- Main Content -->
		<main>
			<div class="glass-card">
				<div class="welcome-message">Welcome to Your Safe Space</div>
				<h1>Your Journey to Mental Wellness Starts Here</h1>
				<p>Track your mood, receive personalized care suggestions, and
					join a supportive community.</p>

				<div class="buttons">
					<button class="primary-btn pulse"
						onclick="window.location.href='<c:url value="/mood" />'">
						Track My Mood</button>
					</button>
					<button class="secondary-btn" 	onclick="window.location.href='<c:url value="/therepist" />'">AI Therapist</button>
				</div>

				<div class="features">
					<div class="feature-card">
						<div class="feature-icon">🎯</div>
						<h3>Mood Tracking</h3>
						<p>Log and visualize your emotional journey</p>
					</div>
					<div class="feature-card">
						<div class="feature-icon">🤖</div>
						<h3>AI Support</h3>
						<p>24/7 compassionate AI companion</p>
					</div>
					<div class="feature-card">
						<div class="feature-icon">🤝</div>
						<h3>Community</h3>
						<p>Connect with understanding peers</p>
					</div>
				</div>

				<div class="quotes-section">
					<div class="quote-card active">
						<p class="quote">"Your mental health is a priority. Your
							happiness is essential. Your self-care is a necessity."</p>
					</div>
					<div class="quote-card">
						<p class="quote">"You are stronger than you know, braver than
							you believe, and more capable than you can imagine."</p>
					</div>
					<div class="quote-card">
						<p class="quote">"Small steps every day lead to big changes
							over time. You've got this!"</p>
					</div>
					<div class="quote-dots"></div>
				</div>
			</div>
		</main>

		<!-- Floating Cloud Quote -->
		<div class="cloud-container">
			<div class="cloud">
				<div class="cloud-quote">Click for daily inspiration</div>
				<div class="cloud-content">
					<p>"Every day is a new beginning. Take a deep breath and start
						again."</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Link JavaScript from the correct location -->
	<script src="${pageContext.request.contextPath}/frontend/js/front.js"></script>

</body>
</html>
