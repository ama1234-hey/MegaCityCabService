<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Mega City Cab</title>

    <!-- Bootstrap & MUI -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Custom Styles -->
    <style>
        body {
            background: url('<%= request.getContextPath() %>/assets/images/login.jpg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(5px);
        }
        .register-container {
            max-width: 500px;
            background: rgb(173, 232, 175);
            padding: 50px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }
        .register-container:hover {
            transform: translateY(-5px);
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-register {
            background: linear-gradient(to right, #036e29, #59d044);
            border: none;
            color: white;
            transition: all 0.3s ease-in-out;
        }
        .btn-register:hover {
            transform: scale(1.05);
            box-shadow: 0px 4px 10px rgb(89, 208, 68);
        }
    </style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center vh-90">
    <div class="register-container">
        <h3 class="text-center mb-4">Customer Registration</h3>

        <!-- Registration Form -->
        <form id="registerForm" action="${pageContext.request.contextPath}/CustomerController" method="post">
            <div class="mb-3">
                <label>Full Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Phone Number</label>
                <input type="text" name="phone" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>NIC (National ID)</label>
                <input type="text" name="nic" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-register w-100 mt-3">Register</button>
            <p class="text-center mt-3">
                Already have an account? <a href="login.jsp">Login Here</a>
            </p>
        </form>
    </div>
</div>

<!-- JavaScript Validation -->
<script>
    $("#registerForm").submit(function () {
        let name = $("input[name='name']").val();
        let email = $("input[name='email']").val();
        let phone = $("input[name='phone']").val();
        let nic = $("input[name='nic']").val();
        let password = $("input[name='password']").val();

        if (name.length < 3) {
            alert("Name must be at least 3 characters long.");
            return false;
        }
        if (phone.length < 10 || isNaN(phone)) {
            alert("Enter a valid phone number.");
            return false;
        }
        if (nic.length !== 10 && nic.length !== 12) {
            alert("NIC should be 10 or 12 characters long.");
            return false;
        }
        if (password.length < 6) {
            alert("Password must be at least 6 characters.");
            return false;
        }

        return true;
    });
</script>
</body>
</html>
