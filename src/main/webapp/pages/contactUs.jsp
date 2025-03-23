<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>
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
    <!-- SweetAlert2 for Alerts -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
        .contact-card {
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .contact-card:hover {
            transform: translateY(-10px);
        }
        .form-container {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .social-icons i {
            font-size: 24px;
            margin: 10px;
            color: #007bff;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        .social-icons i:hover {
            color: #0056b3;
            transform: scale(1.2);
        }
    </style>
</head>

<body>
<!-- Header -->
<jsp:include page="/includes/header2.jsp" />

<!-- Hero Section -->
<section class="hero-section text-light">
    <div class="container animate__animated animate__fadeIn">
        <h1 class="display-4 fw-bold">Contact Mega City Cab</h1>
        <p class="lead">Get in touch with us for bookings, inquiries, or support.</p>
    </div>
</section>

<!-- Contact Information -->
<section class="container my-5">
    <div class="row">
        <div class="col-md-4">
            <div class="contact-card bg-light p-4 text-center">
                <i class="fas fa-map-marker-alt fa-3x text-danger"></i>
                <h5 class="mt-3">Our Address</h5>
                <p>No. 25, Galle Road, Colombo 03, Sri Lanka</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="contact-card bg-light p-4 text-center">
                <i class="fas fa-phone fa-3x text-success"></i>
                <h5 class="mt-3">Call Us</h5>
                <p>+94 11 2345678</p>
                <p>+94 77 9876543</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="contact-card bg-light p-4 text-center">
                <i class="fas fa-envelope fa-3x text-primary"></i>
                <h5 class="mt-3">Email Us</h5>
                <p>info@megacitycab.lk</p>
                <p>support@megacitycab.lk</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Form -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Send Us a Message</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container animate__animated animate__fadeInUp">
                <form id="contactForm">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea class="form-control" id="message" rows="4" placeholder="Type your message here" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Google Map -->
<section class="container my-5">
    <h2 class="text-center fw-bold mb-4">Find Us Here</h2>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <iframe class="w-100" height="350"
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31716.059056856113!2d79.8578417938208!3d6.9219239929928825!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25960bf9c4573%3A0xe1090a899bf91c92!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2slk!4v1700000000000"
                    allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>
</section>

<!-- Social Media Links -->
<section class="text-center my-4">
    <h4>Follow Us</h4>
    <div class="social-icons">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-light text-center py-3">
    <p>&copy; 2025 Mega City Cab. All Rights Reserved. | Designed by Mega City Team</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("contactForm").addEventListener("submit", function(event) {
        event.preventDefault();
        Swal.fire("Thank You!", "Your message has been sent successfully!", "success");
    });
</script>

</body>
</html>
