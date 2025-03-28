<%@ page import="com.example.megacitycab.dao.BookingDAO, com.example.megacitycab.models.Booking, java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --primary-color: #6366f1;
            --danger-color: #dc3545;
            --card-bg: #2c2c2c;
            --text-color: #ffffff;
            --hover-color: #3b3b3b;
        }

        body {
            background: #1a1a1a;
            font-family: 'Inter', sans-serif;
            padding: 2rem 0;
            color: var(--text-color);
        }

        .booking-card {
            background: var(--card-bg);
            border-radius: 16px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), #4f46e5);
            color: white;
            padding: 1.2rem;
            border-bottom: 0;
        }

        .detail-group {
            padding: 1.5rem;
            border-bottom: 1px solid #444;
        }

        .detail-group:last-child {
            border-bottom: 0;
        }

        .detail-label {
            color: #a0aec0;
            font-size: 0.9rem;
            margin-bottom: 0.3rem;
        }

        .detail-value {
            color: var(--text-color);
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .delete-btn {
            background: var(--danger-color);
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: background 0.2s ease;
        }

        .delete-btn:hover {
            background: #c82333;
        }

        .animate__animated {
            animation-duration: 0.5s;
        }
    </style>
</head>
<body>
<!-- Header -->

<div class="container">
    <div class="mb-4 text-center animate__animated animate__fadeIn">
        <h2 class="fw-bold mb-3">📋 Current Bookings</h2>
        <p class="text-muted">Manage all customer reservations</p>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <%
            BookingDAO bookingDAO = null;
            try {
                bookingDAO = new BookingDAO();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            List<Booking> bookings = bookingDAO.getAllBookings();

            for (Booking booking : bookings) {
        %>
        <div class="col">
            <div class="booking-card animate__animated animate__fadeInUp">
                <div class="card-header">
                    <h5 class="mb-0">Booking #<%= booking.getOrderId() %></h5>
                    <small><%= booking.getOrderDatetime() %></small>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-user me-2"></i>Customer</div>
                    <div class="detail-value"><%= booking.getCustomerName() %></div>

                    <div class="detail-label"><i class="fas fa-phone me-2"></i>Contact</div>
                    <div class="detail-value"><%= booking.getTelephoneNumber() %></div>

                    <div class="detail-label"><i class="fas fa-map-marker-alt me-2"></i>Address</div>
                    <div class="detail-value"><%= booking.getAddress() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-route me-2"></i>Trip Details</div>
                    <div class="row">
                        <div class="col-6">
                            <div class="detail-label">Pickup</div>
                            <div class="detail-value"><%= booking.getPickupLocation() %></div>
                        </div>
                        <div class="col-6">
                            <div class="detail-label">Duration (First 200Km Free)</div>
                            <div class="detail-value"><%= booking.getDuration() %> Km</div>
                        </div>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-car me-2"></i>Vehicle Details</div>
                    <div class="row">
                        <div class="col-6">
                            <div class="detail-label">Driver</div>
                            <div class="detail-value"><%= booking.getDriverName() %></div>
                        </div>
                        <div class="col-6">
                            <div class="detail-label">Model</div>
                            <div class="detail-value"><%= booking.getCarModel() %></div>
                        </div>
                    </div>
                </div>

                <div class="detail-group text-end p-3">
                    <form method="post" action="DeleteBookingController">
                        <input type="hidden" name="order_id" value="<%= booking.getOrderId() %>">
                        <button type="submit" class="delete-btn">
                            <i class="fas fa-trash me-1"></i>
                            Delete Booking
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>