<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- MUI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mui/material@5.11.0/dist/mui.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Animate.css for Animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- SweetAlert2 for Alerts -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Custom JavaScript -->
    <script src="assets/js/script.js" defer></script>
    <style>
        .hero-section {
            background-image: url('<%= request.getContextPath() %>/assets/images/banner.jpg');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            color: #fff;
            text-align: center;
        }
        .info-box {
            border-radius: 15px;
            transition: transform 0.3s ease;
        }
        .info-box:hover {
            transform: translateY(-10px);
        }
        .contact-card {
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>

<!-- Hero Section -->
<section class="hero-section text-light">
    <div class="container animate__animated animate__fadeIn">
        <h1 class="display-4 fw-bold">About Mega City Cab</h1>
        <p class="lead">Your Trusted Partner for Safe, Reliable, and Comfortable Rides Across Colombo, Sri Lanka.</p>
    </div>
</section>

<!-- Company Overview -->
<section class="container my-5">
    <div class="row">
        <div class="col-md-6">
            <img src="<%= request.getContextPath() %>/assets/images/company.jpg" class="img-fluid rounded shadow-lg" alt="Company Image">
        </div>
        <div class="col-md-6">
            <h2 class="fw-bold mb-3">Who We Are</h2>
            <p>Mega City Cab has been serving Colombo since 2010, offering premium transportation services for locals and tourists alike. With a fleet of over 200 vehicles ranging from budget cars to luxury sedans, we ensure a smooth and comfortable journey every time.</p>
            <p>Our drivers are professionally trained, background-checked, and dedicated to providing a safe and pleasant travel experience.</p>
        </div>
    </div>
</section>

<!-- Mission & Vision -->
<section class="container my-5 text-center">
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="info-box bg-light p-4 shadow-sm">
                <h3 class="fw-bold">Our Mission</h3>
                <p>To offer reliable, safe, and affordable transportation solutions while maintaining exceptional customer service standards.</p>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="info-box bg-light p-4 shadow-sm">
                <h3 class="fw-bold">Our Vision</h3>
                <p>To become Colombo's most trusted and preferred cab service provider by embracing technology and enhancing customer experiences.</p>
            </div>
        </div>
    </div>
</section>

<!-- Services -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Our Services</h2>
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="card border-0 shadow-sm p-3">
                <i class="fas fa-car fa-3x mb-3 text-primary"></i>
                <h5 class="fw-bold">City Rides</h5>
                <p>Comfortable rides within Colombo at affordable rates.</p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card border-0 shadow-sm p-3">
                <i class="fas fa-plane fa-3x mb-3 text-success"></i>
                <h5 class="fw-bold">Airport Transfers</h5>
                <p>Hassle-free airport pickups and drop-offs.</p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card border-0 shadow-sm p-3">
                <i class="fas fa-route fa-3x mb-3 text-danger"></i>
                <h5 class="fw-bold">Outstation Trips</h5>
                <p>Comfortable long-distance journeys across Sri Lanka.</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Information -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Contact Us</h2>
    <div class="row">
        <div class="col-md-6">
            <div class="contact-card bg-light p-4">
                <h5><i class="fas fa-map-marker-alt"></i> Our Address</h5>
                <p>No. 25, Galle Road, Colombo 03, Sri Lanka</p>
                <h5><i class="fas fa-phone"></i> Phone</h5>
                <p>+94 11 2345678</p>
                <h5><i class="fas fa-envelope"></i> Email</h5>
                <p>info@megacitycab.lk</p>
            </div>
        </div>
        <div class="col-md-6">
            <img src="<%= request.getContextPath() %>/assets/images/contact.jpg" class="img-fluid rounded shadow-lg" alt="Contact Us">
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-light text-center py-3">
    <p>&copy; 2025 Mega City Cab. All Rights Reserved. | Designed by Mega City Team</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- MUI JS -->
<script src="https://cdn.jsdelivr.net/npm/@mui/material@5.11.0/dist/mui.min.js"></script>
</body>
</html>
