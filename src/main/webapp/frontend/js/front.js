document.addEventListener('DOMContentLoaded', () => {
    // Smooth scroll for navigation
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Add hover animations to feature cards
    const featureCards = document.querySelectorAll('.feature-card');
    featureCards.forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-5px)';
        });
        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0)';
        });
    });

    // Quotes rotation
    const quotes = document.querySelectorAll('.quote-card');
    const dotsContainer = document.querySelector('.quote-dots');
    let currentQuote = 0;

    // Create dots
    quotes.forEach((_, index) => {
        const dot = document.createElement('div');
        dot.classList.add('dot');
        if (index === 0) dot.classList.add('active');
        dot.addEventListener('click', () => showQuote(index));
        dotsContainer.appendChild(dot);
    });

    // Smooth reveal animation for features
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll('.feature-card').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        observer.observe(card);
    });

    // Button click effect
    const buttons = document.querySelectorAll('button');
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            const x = e.clientX - e.target.offsetLeft;
            const y = e.clientY - e.target.offsetTop;
            
            const ripple = document.createElement('span');
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;
            
            this.appendChild(ripple);
            setTimeout(() => ripple.remove(), 600);
        });
    });

    // Enhanced quote rotation with fade effect
    function showQuote(index) {
        quotes.forEach(quote => {
            quote.style.transform = 'translateY(20px)';
            quote.classList.remove('active');
        });
        
        setTimeout(() => {
            quotes[index].classList.add('active');
        }, 300);
        
        const dots = document.querySelectorAll('.dot');
        dots.forEach(dot => dot.classList.remove('active'));
        dots[index].classList.add('active');
        currentQuote = index;
    }

    // Auto rotate quotes
    setInterval(() => {
        currentQuote = (currentQuote + 1) % quotes.length;
        showQuote(currentQuote);
    }, 5000);

    // Add parallax effect to glass card
    document.addEventListener('mousemove', (e) => {
        const glassCard = document.querySelector('.glass-card');
        const mouseX = e.clientX / window.innerWidth - 0.5;
        const mouseY = e.clientY / window.innerHeight - 0.5;
        
        if (window.innerWidth > 768) {
            glassCard.style.transform = `
                perspective(1000px)
                rotateY(${mouseX * 5}deg)
                rotateX(${-mouseY * 5}deg)
            `;
        }
    });

    // Interactive background shapes
    document.addEventListener('mousemove', (e) => {
        const shapes = document.querySelectorAll('.shape');
        const mouseX = e.clientX / window.innerWidth;
        const mouseY = e.clientY / window.innerHeight;

        shapes.forEach((shape, index) => {
            const offsetX = (mouseX - 0.5) * (index + 1) * 20;
            const offsetY = (mouseY - 0.5) * (index + 1) * 20;
            
            shape.style.transform = `translate(${offsetX}px, ${offsetY}px)`;
        });
    });

    // Smooth scroll effect for the whole page
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Add loading animations for elements
    const animateElements = () => {
        const elements = document.querySelectorAll('.feature-card, .glass-card, .quote-card');
        elements.forEach((element, index) => {
            setTimeout(() => {
                element.style.opacity = '1';
                element.style.transform = 'translateY(0)';
            }, index * 200);
        });
    };

    // Initialize animations
    animateElements();

    // Add subtle parallax effect to shapes on scroll
    window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const shapes = document.querySelectorAll('.shape');
        
        shapes.forEach((shape, index) => {
            const speed = (index + 1) * 0.2;
            shape.style.transform = `translateY(${scrolled * speed}px)`;
        });
    });

    // Cloud quote rotation
    const quotes = [
        "Every day is a new beginning. Take a deep breath and start again.",
        "You are stronger than you know, braver than you believe.",
        "Your peace is more important than your productivity.",
        "Small steps lead to big changes.",
        "Be proud of how far you've come.",
    ];

    const cloud = document.querySelector('.cloud');
    const cloudContent = document.querySelector('.cloud-content p');
    let currentQuoteIndex = 0;

    function rotateQuote() {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
        cloudContent.style.opacity = '0';
        
        setTimeout(() => {
            cloudContent.textContent = quotes[currentQuoteIndex];
            cloudContent.style.opacity = '1';
        }, 300);
    }

    // Change quote on click
    cloud.addEventListener('click', () => {
        rotateQuote();
        
        // Add click animation
        cloud.style.transform = 'scale(0.95) translateY(0)';
        setTimeout(() => {
            cloud.style.transform = '';
        }, 150);
    });

    // Add subtle movement on mousemove
    document.addEventListener('mousemove', (e) => {
        if (window.innerWidth <= 768) return; // Disable on mobile
        
        const mouseX = e.clientX / window.innerWidth - 0.5;
        const mouseY = e.clientY / window.innerHeight - 0.5;
        
        cloud.style.transform = `
            translate(
                ${mouseX * -20}px,
                ${mouseY * -20}px
            )
            rotate(${mouseX * 5}deg)
        `;
    });

    // Automatic quote rotation every 10 seconds
    setInterval(rotateQuote, 10000);

    // Mobile menu toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');

    menuToggle.addEventListener('click', () => {
        menuToggle.classList.toggle('active');
        navLinks.classList.toggle('active');
    });

    // Close mobile menu when clicking outside
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.main-nav')) {
            menuToggle.classList.remove('active');
            navLinks.classList.remove('active');
        }
    });

    // Active link highlighting
    const navItems = document.querySelectorAll('.nav-links a');
    navItems.forEach(item => {
        item.addEventListener('click', () => {
            navItems.forEach(i => i.classList.remove('active'));
            item.classList.add('active');
            
            // Close mobile menu after click
            menuToggle.classList.remove('active');
            navLinks.classList.remove('active');
        });
    });
});
