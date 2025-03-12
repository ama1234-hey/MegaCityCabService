<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- MUI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mui/material@5.11.0/dist/mui.min.css">
    <!-- Animate.css for Animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .hero-section {
            background-image: url('<%= request.getContextPath() %>/assets/images/banner.jpg');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            color: #fff;
            text-align: center;
        }
        .service-card {
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            padding: 22px;
            background: #fff;
            text-align: center;
        }
        .service-card:hover {
            transform: translateY(-10px);
        }
        .service-icon {
            font-size: 50px;
            color: #007bff;
        }
        .cta-section {
            background: linear-gradient(to right, #007bff, #0056b3);
            color: white;
            padding: 50px 20px;
            text-align: center;
        }
    </style>
</head>

<body>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container animate__animated animate__fadeIn">
        <h1 class="display-4 fw-bold">Our Services</h1>
        <p class="lead">Experience comfort, safety, and reliability with Mega City Cab.</p>
    </div>
</section>

<!-- Services Section -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">What We Offer</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="service-card">
                <i class="fas fa-taxi service-icon"></i>
                <h5 class="mt-3">City Taxi Service</h5>
                <p>We provide affordable and comfortable taxi rides anywhere in Colombo and surrounding areas.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-card">
                <i class="fas fa-plane service-icon"></i>
                <h5 class="mt-3">Airport Transfers</h5>
                <p>Safe and timely airport transfers from Bandaranaike International Airport to your destination.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-card">
                <i class="fas fa-users service-icon"></i>
                <h5 class="mt-3">Corporate Cab Service</h5>
                <p>Premium chauffeur-driven cars for business meetings, events, and corporate clients.</p>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="service-card">
                <i class="fas fa-road service-icon"></i>
                <h5 class="mt-3">Outstation Trips</h5>
                <p>Comfortable and affordable long-distance travel across Sri Lanka.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-card">
                <i class="fas fa-car service-icon"></i>
                <h5 class="mt-3">Self-Drive Rentals</h5>
                <p>Rent a car and drive yourself for a flexible and personal travel experience.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-card">
                <i class="fas fa-hotel service-icon"></i>
                <h5 class="mt-3">Hotel Transfers</h5>
                <p>We provide convenient rides to and from hotels with luxurious service.</p>
            </div>
        </div>
    </div>
</section>

<!-- Why Choose Us -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Why Choose Mega City Cab?</h2>
    <div class="row text-center">
        <div class="col-md-4">
            <h4><i class="fas fa-check-circle text-success"></i> Safe & Secure</h4>
            <p>All our vehicles are well-maintained and drivers are professionally trained.</p>
        </div>
        <div class="col-md-4">
            <h4><i class="fas fa-clock text-warning"></i> 24/7 Availability</h4>
            <p>We are available around the clock for all your travel needs.</p>
        </div>
        <div class="col-md-4">
            <h4><i class="fas fa-credit-card text-primary"></i> Easy Payment</h4>
            <p>We accept multiple payment methods including cash, card, and online payments.</p>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section">
    <h2 class="fw-bold">Book Your Ride Now</h2>
    <p>Call us or book a ride online with just a few clicks.</p>
    <a href="login.jsp" class="btn btn-light btn-lg">Book Now</a>
</section>

<!-- Contact Information -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Get In Touch</h2>
    <div class="row text-center">
        <div class="col-md-4">
            <h5><i class="fas fa-map-marker-alt text-danger"></i> Our Address</h5>
            <p>No. 25, Galle Road, Colombo 03, Sri Lanka</p>
        </div>
        <div class="col-md-4">
            <h5><i class="fas fa-phone text-success"></i> Call Us</h5>
            <p>+94 11 2345678 | +94 77 9876543</p>
        </div>
        <div class="col-md-4">
            <h5><i class="fas fa-envelope text-primary"></i> Email Us</h5>
            <p>info@megacitycab.lk</p>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-light text-center py-3">
    <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
