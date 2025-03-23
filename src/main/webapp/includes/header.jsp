<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <style>
        .nav-container {
            background: transparent;
            position: fixed;
            top: 0;
            font-size: 20px;
            color: #e3f2fd;
            width: 100%;
            height: 100px;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .nav-item {
            color: #ffffff; /* White color */
        }

        /* Add slight shadow on scroll */
        .nav-container.scrolled {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand .logo {
            height: 90px;
            transition: all 0.3s ease;
        }

        .nav-link {
            color: #ffffff !important;
            font-weight: 500;
            padding: 0.8rem 1.2rem !important;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-link:hover {
            color: #2563eb !important;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: #2563eb;
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        .menu-button {
            border: none;
            outline: none;
        }

        .navi-login {
            background: #2563eb;
            color: white !important;
            border-radius: 5px;
            margin-left: 1rem;
            padding: 0.5rem 1.5rem !important;
        }

        .navi-login:hover {
            background: #1d4ed8;
            color: white !important;
        }

        @media (max-width: 991px) {
            .navbar-collapse {
                background: rgba(255, 255, 255, 0.95);
                padding: 1rem;
                margin-top: 1rem;
                backdrop-filter: blur(10px);
            }
        }
    </style>
</head>
<body>

<header class="nav-container">
    <nav class="navbar navbar-expand-lg navbar-light bg-transparent">
        <div class="container">
            <!-- Mobile Menu Button -->
            <button class="navbar-toggler d-lg-none" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav">
                <span class="material-icons">menu</span>
            </button>

            <!-- Logo -->
            <a class="navbar-brand" href="/">
                <img src="<%= request.getContextPath() %>/assets/images/logo.png" class="logo" alt="Mega City Cab">
            </a>

            <!-- Desktop Menu -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/login.jsp">List Your Vehicle</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/register.jsp">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/services.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/help.jsp">Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/aboutUs.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/contactUs.jsp">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navi-login" href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>