package com.example.megacitycab.dao;

import com.example.megacitycab.models.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private Connection conn;

    public BookingDAO() throws SQLException {
        this.conn = DatabaseConnection.getConnection();
    }

    public boolean insertBooking(Booking booking) {
        String sql = "INSERT INTO booking (customer_name, address, telephone_number, pickup_location, duration, order_datetime, driver_name, car_model) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, booking.getCustomerName());
            stmt.setString(2, booking.getAddress());
            stmt.setString(3, booking.getTelephoneNumber());
            stmt.setString(4, booking.getPickupLocation());
            stmt.setString(5, booking.getDuration());

            // Convert LocalDateTime to Timestamp for database storage
            if (booking.getOrderDatetime() != null) {
                stmt.setTimestamp(6, Timestamp.valueOf(booking.getOrderDatetime()));
            } else {
                stmt.setTimestamp(6, null);
            }

            stmt.setString(7, booking.getDriverName());
            stmt.setString(8, booking.getCarModel());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Fetch all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking ORDER BY order_datetime DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("order_id"),   // Primary key (Auto Increment)
                        rs.getString("customer_name"),
                        rs.getString("address"),
                        rs.getString("telephone_number"),
                        rs.getString("pickup_location"),
                        rs.getString("duration"),
                        rs.getTimestamp("order_datetime") != null ? rs.getTimestamp("order_datetime").toLocalDateTime() : null,
                        rs.getString("driver_name"),
                        rs.getString("car_model")
                );
                bookings.add(booking);
            }
            System.out.println("Total Bookings Retrieved: " + bookings.size());  // Debugging line
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }


    // Delete a booking
    public boolean deleteBooking(int orderId) {
        String sql = "DELETE FROM booking WHERE order_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}


