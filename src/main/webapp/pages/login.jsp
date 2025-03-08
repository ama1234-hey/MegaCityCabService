<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Mega City Cab</title>

    <!-- Bootstrap & MUI (Material UI) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom Styles -->
    <style>
        /* Background with blur effect */
        body {
            background: url('<%= request.getContextPath() %>/assets/images/login.jpg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(5px);
        }
        .login-container {
            max-width: 450px;
            background: rgba(255, 255, 255, 0.9);
            padding: 90px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }
        .login-container:hover {
            transform: translateY(-5px);
        }
        .form-control {
            border-radius: 8px;
        }
        .switch-container {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }
        .switch-container label {
            font-weight: bold;
            cursor: pointer;
            padding: 8px 20px;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
        }
        .switch-container input {
            display: none;
        }
        .switch-container label.active {
            background-color: #007bff;
            color: white;
        }
        .forgot-password {
            display: none;
            margin-top: 25px;
        }
    </style>
</head>
<body>
<div class="d-flex justify-content-center align-items-center vh-100">
    <div class="login-container">
        <h3 class="text-center mb-3">Login</h3>

        <!-- User Type Switcher -->
        <div class="switch-container">
            <label id="customerSwitch" class="active">Customer</label>
            <label id="adminSwitch">Admin</label>
        </div>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath} /AuthController" method="post">
        <input type="hidden" id="userType" name="userType" value="customer">

            <!-- Customer Login -->
            <div id="customerLogin">
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3">Login</button>
                <br>
                <p class="text-center mt-3">
                    New user? <a href="register.jsp">Register Here</a>
                </p>
            </div>

            <!-- Admin Login -->
            <div id="adminLogin" style="display: none;">
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary w-100 mt-3">Login</button>



                <!-- Forgot Password -->
                <div class="forgot-password">
                    <hr>
                    <label>Forgot Password?</label>
                    <input type="email" id="adminEmail" name="adminEmail" class="form-control" placeholder="Enter Admin Email">
                    <button type="button" class="btn btn-warning w-100 mt-2">Submit</button>
                </div>
                <p class="text-center mt-3">
                    New Admin can register after login to the Admin panel.
                </p>
            </div>

            <%
                String error = (String) session.getAttribute("error");
                if (error != null) {
            %>
            <div class="alert alert-danger text-center"><%= error %></div>
            <%
                    session.removeAttribute("error"); // Clear the error message after displaying it
                }
            %>




        </form>

        <!-- Register Link -->

    </div>
</div>

<!-- Script to Handle Toggle -->
<script>
    $(document).ready(function () {
        $("#customerSwitch").click(function () {
            console.log("Switched to Customer");
            $("#customerSwitch").addClass("active");
            $("#adminSwitch").removeClass("active");
            $("#customerLogin").show();
            $("#adminLogin").hide();
            $("#userType").val("customer");
            $(".forgot-password").hide();
        });

        $("#adminSwitch").click(function () {
            console.log("Switched to Admin");
            $("#adminSwitch").addClass("active");
            $("#customerSwitch").removeClass("active");
            $("#customerLogin").hide();
            $("#adminLogin").show();
            $("#userType").val("admin");
            $(".forgot-password").show();
        });
    });

</script>
</body>
</html>
