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

        /* Big Banner Section */
        .big-banner {
            background: url('<%= request.getContextPath() %>/assets/images/banner.jpg') no-repeat center center;
            background-size: cover;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
        }
        .big-banner .content {
            background: rgba(0, 0, 0, 0.6);
            padding: 40px;
            border-radius: 10px;
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        /* Car Swiper Section */
        .car-swiper-container {
            width: 90%;
            margin: auto;
            padding: 50px 0;
        }
        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            transition: transform 0.3s ease-in-out;
        }
        .swiper-slide:hover {
            transform: scale(1.05);
        }
        .car-box {
            background: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }
        .car-box img {
            width: 100%;
            border-radius: 10px;
            height: 250px;
            object-fit: cover;
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
                <img src="<%= request.getContextPath() %>/assets/images/s2.jpg" alt="Affordable Rates">
                <h3>💰 Affordable Rates</h3>
                <p>Get the best rates for your rides.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="<%= request.getContextPath() %>/assets/images/s3.jpg" alt="Clean & Safe">
                <h3>✅ Clean & Safe</h3>
                <p>Our cars are well-maintained and sanitized.</p>
            </div>
        </div>
    </div>
</section>

<!-- Big Banner Section -->
<section class="big-banner">
    <div class="content">
        <h2>Ride in Comfort & Style</h2>
        <p>Experience the best car rental services with Mega City Cab.</p>
        <button class="btn btn-primary btn-lg">Book Now</button>
    </div>
</section>

<!-- Car Swiper Section -->
<section class="car-swiper-container">
    <h2 class="text-center mb-4">Our Featured Cars</h2>
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/c1.jpg" alt="Car 1">
                    <h4>Toyota Prius</h4>
                    <p>Hybrid | Automatic | 2023</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/6761424758ead.jpeg" alt="Car 2">
                    <h4>Honda Civic</h4>
                    <p>Petrol | Manual | 2022</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/678b06953c708.jpeg" alt="Car 3">
                    <h4>Mercedes-Benz</h4>
                    <p>Luxury | Automatic | 2023</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/67594cf199fdd.jpeg" alt="Car 3">
                    <h4>Mercedes-Benz</h4>
                    <p>Luxury | Automatic | 2023</p>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="car-box">
                    <img src="<%= request.getContextPath() %>/assets/images/cars/6789753aa211e.jpeg" alt="Car 3">
                    <h4>Mercedes-Benz</h4>
                    <p>Luxury | Automatic | 2023</p>
                </div>
            </div>
        </div>
        <!-- Add Pagination & Navigation -->
        <div class="swiper-pagination"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
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

<!-- Footer -->
<jsp:include page="/includes/footer.jsp" />

<!-- Scripts -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
<script>
    // Initialize Swiper
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        spaceBetween: 20,
        loop: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        breakpoints: {
            768: { slidesPerView: 2 },
            480: { slidesPerView: 1 },
        }
    });
</script>

</body>
</html>
