<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #2c3e50;
            color: white;
            position: fixed;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #34495e;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .dashboard-cards {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        .card {
            flex: 1;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2 class="text-center">Admin Panel</h2>
    <a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="#"><i class="fas fa-car"></i> Manage Cars</a>
    <a href="#"><i class="fas fa-user"></i> Manage Drivers</a>
    <a href="#"><i class="fas fa-users"></i> Manage Customers</a>
    <a href="#"><i class="fas fa-file-invoice"></i> Reports</a>
    <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>
<div class="content">
    <h1 class="mb-4">Dashboard</h1>
    <div class="dashboard-cards">
        <div class="card">
            <h3>500</h3>
            <p>Total Bookings</p>
        </div>
        <div class="card">
            <h3>120</h3>
            <p>Available Cars</p>
        </div>
        <div class="card">
            <h3>85</h3>
            <p>Active Drivers</p>
        </div>
        <div class="card">
            <h3>1020</h3>
            <p>Registered Users</p>
        </div>
    </div>
    <h2 class="mb-3">Recent Bookings</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Customer</th>
            <th>Driver</th>
            <th>Car Model</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>John Doe</td>
            <td>Mike Smith</td>
            <td>Toyota Prius</td>
            <td>Completed</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Sarah Lee</td>
            <td>David Brown</td>
            <td>Honda Accord</td>
            <td>Ongoing</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Mark Wilson</td>
            <td>Robert Green</td>
            <td>Ford Focus</td>
            <td>Pending</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
