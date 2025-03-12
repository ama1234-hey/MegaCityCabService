<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>

    <!-- MUI & Swiper.js -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mui/material@5.0.0/dist/material.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <style>
        /* Fixed Background Image */
        .main-banner {
            background: url('<%= request.getContextPath() %>/assets/images/b.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            font-size: 2rem;
            position: relative;
        }


        /* Dark Overlay */

        .banner-text {
            position: relative;
            z-index: 2;
        }

        /* Services Section */
        .service-box {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            padding: 20px;
            border-radius: 12px;
            background: white;
            box-shadow: 0 4px 10px rgba(242, 242, 242, 0.8);
            text-align: center;
        }
        .service-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }
        .service-box img {
            width: 300px;
            height: 400px;
            margin-bottom: 15px;
        }

        /* Car Swiper */
        .swiper-container {
            width: 100%;
            padding: 20px 0;
        }
        .car-box {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .car-box img {
            width: 50%; /* Make images responsive */
            height: 260px;
            object-fit: cover;
            border-radius: 10px;
        }
        .car-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        /* Swiper Navigation Arrows */
        .swiper-button-next,
        .swiper-button-prev {
            color: #ff5e62; /* Change arrow color */
            font-size: 24px;
        }



        /* Google Map */
        #map {
            width: 100%;
            height: 400px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Header -->
<jsp:include page="/includes/header.jsp" />

<!-- Main Banner Section -->
<div class="main-banner">
    <div class="banner-text">
        <h1>Welcome to Mega City Cab</h1>
        <p>Book your ride with us and experience comfort!</p>
    </div>
</div>

<!-- Services Section -->
<section class="container py-5">
    <h2 class="text-center mb-4">Our Services</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/s1.jpg" alt="24/7 Service">
                <h3>🚖 24/7 Service</h3>
                <p>We provide cab services around the clock!</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/s1.jpg" alt="Affordable Rates">
                <h3>💰 Affordable Rates</h3>
                <p>Get the best rates for your rides.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/s1.jpg" alt="Clean & Safe">
                <h3>✅ Clean & Safe</h3>
                <p>Our cars are well-maintained and sanitized.</p>
            </div>
        </div>
    </div>
</section>

<!-- Car Swiper Section -->
<section class="container py-5">
    <h2 class="text-center mb-4">Rent a Car</h2>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <!-- Car 1 -->
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/img.png" alt="Car Model 1">
                    <h4>Model A</h4>
                    <p>Price: $50/day</p>
                    <p>Mileage: 15 km/l</p>
                </div>
            </div>
            <!-- Car 2 -->
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/img_1.png" alt="Car Model 2">
                    <h4>Model B</h4>
                    <p>Price: $60/day</p>
                    <p>Mileage: 18 km/l</p>
                </div>
            </div>
            <!-- Car 3 -->
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/img_1.png" alt="Car Model 3">
                    <h4>Model C</h4>
                    <p>Price: $70/day</p>
                    <p>Mileage: 20 km/l</p>
                </div>
            </div>
            <!-- Car 4 -->
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/img_1.png" alt="Car Model 4">
                    <h4>Model D</h4>
                    <p>Price: $55/day</p>
                    <p>Mileage: 17 km/l</p>
                </div>
            </div>
            <!-- Car 5 -->
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/img_1.png" alt="Car Model 5">
                    <h4>Model E</h4>
                    <p>Price: $65/day</p>
                    <p>Mileage: 16 km/l</p>
                </div>
            </div>
        </div>
        <!-- Navigation Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <!-- Pagination Dots -->
        <div class="swiper-pagination"></div>
    </div>
</section>


<!-- Google Map Section -->
<section class="container py-5">
    <h2 class="text-center mb-4">Our Location</h2>
    <div id="map"></div>
</section>

<!-- Footer -->
<jsp:include page="/includes/footer.jsp" />

<!-- Scripts -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
<script>
    // Initialize Swiper
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


</body>
</html>
