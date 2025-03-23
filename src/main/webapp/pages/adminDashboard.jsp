<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #59d044;
            --secondary-color: #036e29;
            --accent-color: #277c0b;
            --success-color: #49bf84;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Inter', sans-serif;
        }

        .sidebar {
            width: 280px;
            height: 100vh;
            background: linear-gradient(180deg, var(--primary-color), var(--secondary-color));
            position: fixed;
            box-shadow: 3px 0 20px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 1.5rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.8) !important;
            padding: 0.8rem 1.5rem !important;
            margin: 0.25rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .nav-link.active {
            background: rgba(255, 255, 255, 0.15);
            font-weight: 500;
        }

        .main-content {
            margin-left: 280px;
            padding: 2rem;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .stat-card i {
            font-size: 2rem;
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .table {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .table thead {
            background: var(--primary-color);
            color: white;
        }

        .status-badge {
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
        }

        .badge-completed { background: #e3f2fd; color: #1976d2; }
        .badge-ongoing { background: #fff3e0; color: #ef6c00; }
        .badge-pending { background: #fbe9e7; color: #d32f2f; }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="sidebar-header">
        <h3 class="text-white mb-0">🚕 MegaCity Cab</h3>
        <p class="text-muted mb-0 small">Admin Dashboard</p>
    </div>
    <nav class="nav flex-column mt-4">
        <a class="nav-link active" href="adminDashboard.jsp">
            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
        </a>
        <a class="nav-link" href="manageCar.jsp">
            <i class="fas fa-car me-2"></i>Manage Cars
        </a>
        <a class="nav-link" href="manageDrivers.jsp">
            <i class="fas fa-user-friends me-2"></i>Manage Drivers
        </a>
        <a class="nav-link" href="bookingDetails.jsp">
            <i class="fas fa-chart-bar me-2"></i>Reports
        </a>
        <a class="nav-link" href="registeredCustomers.jsp">
            <i class="fas fa-chart-bar me-2"></i>Registered Customers
        </a>
        <a class="nav-link" href="../index.jsp">
            <i class="fas fa-sign-out-alt me-2"></i>Logout
        </a>
    </nav>
</div>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0">Dashboard Overview</h1>
        <div class="text-muted">Today: <%= new java.util.Date().toLocaleString() %></div>
    </div>

    <%
        Integer totalBookings = (Integer) request.getAttribute("totalBookings");
        Integer availableCars = (Integer) request.getAttribute("availableCars");
        Integer activeDrivers = (Integer) request.getAttribute("activeDrivers");
        Integer registeredUsers = (Integer) request.getAttribute("registeredUsers");
    %>

    <div class="row g-4 mb-4">
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="card stat-card h-100 p-3">
                <div class="card-body">
                    <i class="fas fa-calendar-check"></i>
                    <h2 class="mt-3"><%= totalBookings != null ? totalBookings : 0 %></h2>
                    <p class="text-muted mb-0">Total Bookings</p>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="card stat-card h-100 p-3">
                <div class="card-body">
                    <i class="fas fa-car"></i>
                    <h2 class="mt-3"><%= availableCars != null ? availableCars : 0 %></h2>
                    <p class="text-muted mb-0">Available Cars</p>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="card stat-card h-100 p-3">
                <div class="card-body">
                    <i class="fas fa-users"></i>
                    <h2 class="mt-3"><%= activeDrivers != null ? activeDrivers : 0 %></h2>
                    <p class="text-muted mb-0">Active Drivers</p>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="card stat-card h-100 p-3">
                <div class="card-body">
                    <i class="fas fa-user-plus"></i>
                    <h2 class="mt-3"><%= registeredUsers != null ? registeredUsers : 0 %></h2>
                    <p class="text-muted mb-0">Registered Users</p>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-white border-0">
            <h5 class="mb-0">Recent Bookings</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer</th>
                        <th>Driver</th>
                        <th>Vehicle</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>#MC-2456</td>
                        <td>John Doe</td>
                        <td>Mike Smith</td>
                        <td>Toyota Prius</td>
                        <td><span class="status-badge badge-completed">Completed</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>#MC-2457</td>
                        <td>Sarah Lee</td>
                        <td>David Brown</td>
                        <td>Honda Accord</td>
                        <td><span class="status-badge badge-ongoing">Ongoing</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>#MC-2458</td>
                        <td>Mark Wilson</td>
                        <td>Robert Green</td>
                        <td>Ford Focus</td>
                        <td><span class="status-badge badge-pending">Pending</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>#MC-2456</td>
                        <td>John Doe</td>
                        <td>Mike Smith</td>
                        <td>Toyota Prius</td>
                        <td><span class="status-badge badge-completed">Completed</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>#MC-2457</td>
                        <td>Sarah Lee</td>
                        <td>David Brown</td>
                        <td>Honda Accord</td>
                        <td><span class="status-badge badge-ongoing">Ongoing</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>#MC-2456</td>
                        <td>John Doe</td>
                        <td>Mike Smith</td>
                        <td>Toyota Prius</td>
                        <td><span class="status-badge badge-completed">Completed</span></td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>