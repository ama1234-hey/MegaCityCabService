<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Mega City Cab</title>

    <!-- MUI, Bootstrap & AOS (Animation on Scroll) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mui/material@5.0.0/dist/material.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
        }

        .main-banner {
            background: url('<%= request.getContextPath() %>/assets/images/jo.jpg') no-repeat center center;
            background-size: cover;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
        }

        .main-banner h1 {
            font-size: 3rem;
            font-weight: bold;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .step-box {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .step-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .step-box img {
            width: 100%;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .step-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 10px;
        }

        .step-description {
            font-size: 1rem;
            color: #666;
        }

        .icon-circle {
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            padding: 10px;
            font-size: 1.5rem;
            display: inline-block;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<!-- Header -->
<jsp:include page="/includes/header2.jsp" />

<!-- Main Banner -->
<div class="main-banner">
    <div>
        <h1>Help & Support</h1>
        <p>Guidelines to Get Started with Mega City Cab</p>
    </div>
</div>

<!-- Help Content Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">How to Use Mega City Cab</h2>

    <!-- Step 1: Register -->
    <div class="step-box" data-aos="fade-up">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="<%= request.getContextPath() %>/assets/images/register-help.jpg" alt="Register">
            </div>
            <div class="col-md-6">
                <div class="icon-circle mb-3">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h3 class="step-title">Step 1: Register an Account</h3>
                <p class="step-description">To start using Mega City Cab services, click on the 'Register' button at the top-right corner and fill in your details. Ensure that you use a valid email address and a strong password.</p>
            </div>
        </div>
    </div>

    <!-- Step 2: Login -->
    <div class="step-box" data-aos="fade-up">
        <div class="row align-items-center">
            <div class="col-md-6 order-md-2">
                <img src="<%= request.getContextPath() %>/assets/images/login-help.jpg" alt="Login">
            </div>
            <div class="col-md-6 order-md-1">
                <div class="icon-circle mb-3">
                    <i class="fas fa-sign-in-alt"></i>
                </div>
                <h3 class="step-title">Step 2: Login to Your Account</h3>
                <p class="step-description">Click on the 'Login' button, enter your email and password, and access your account dashboard.</p>
            </div>
        </div>
    </div>

    <!-- Step 3: Book a Ride -->
    <div class="step-box" data-aos="fade-up">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="<%= request.getContextPath() %>/assets/images/book-ride.jpg" alt="Book a Ride">
            </div>
            <div class="col-md-6">
                <div class="icon-circle mb-3">
                    <i class="fas fa-taxi"></i>
                </div>
                <h3 class="step-title">Step 3: Book a Ride</h3>
                <p class="step-description">Click on the 'Book Now' button, choose your pickup and drop-off locations, select a car, and confirm your booking.</p>
            </div>
        </div>
    </div>

    <!-- Step 4: Payment -->
    <div class="step-box" data-aos="fade-up">
        <div class="row align-items-center">
            <div class="col-md-6 order-md-2">
                <img src="<%= request.getContextPath() %>/assets/images/payment-help.jpg" alt="Payment">
            </div>
            <div class="col-md-6 order-md-1">
                <div class="icon-circle mb-3">
                    <i class="fas fa-credit-card"></i>
                </div>
                <h3 class="step-title">Step 4: Make a Payment</h3>
                <p class="step-description">Pay for your ride using our secure online payment methods or choose to pay cash on delivery.</p>
            </div>
        </div>
    </div>

    <!-- Step 5: Support -->
    <div class="step-box" data-aos="fade-up">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="<%= request.getContextPath() %>/assets/images/support-help.jpg" alt="Support">
            </div>
            <div class="col-md-6">
                <div class="icon-circle mb-3">
                    <i class="fas fa-headset"></i>
                </div>
                <h3 class="step-title">Step 5: Get Support</h3>
                <p class="step-description">If you need any assistance, contact our support team via the 'Help' section or call our hotline.</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="/includes/footer.jsp" />

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init();
</script>

</body>
</html>
