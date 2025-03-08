<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material UI Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
        .navbar {
            background: rgba(0, 0, 0, 0.8);
            padding: 15px;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .navbar-nav {
            display: flex;
            align-items: center;
            gap: 25px;
        }
        .btn-primary, .btn-secondary {
            padding: 5px 20px;
            margin-left: 10px;
        }
        .mui-input {
            width: 100%;
            padding: 6px;
            border: none;
            border-radius: 15px;
            background: #f5f5f5;
            outline: none;
            transition: 0.3s;
        }
        .mui-input:focus {
            background: white;
            box-shadow: 0px 0px 5px #007bff;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                <li class="nav-item">
                    <input type="text" class="mui-input" placeholder="Search cars, drivers...">
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn btn-primary">Login</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pages/register.jsp" class="btn btn-secondary">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
