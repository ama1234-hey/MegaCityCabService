package com.example.megacitycab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardDAO {

    // Get total number of bookings
    public int getTotalBookings() {
        String sql = "SELECT COUNT(*) FROM booking";
        return getCount(sql);
    }

    // Get total number of available cars
    public int getAvailableCars() {
        String sql = "SELECT COUNT(*) FROM car WHERE status = 'Available'";
        return getCount(sql);
    }

    // Get total number of active drivers
    public int getActiveDrivers() {
        String sql = "SELECT COUNT(*) FROM driver WHERE status = 'Active'";
        return getCount(sql);
    }

    // Get total number of registered customers
    public int getTotalCustomers() {
        String sql = "SELECT COUNT(*) FROM customer";
        return getCount(sql);
    }

    // Helper method to execute count queries
    private int getCount(String sql) {
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Return 0 if an error occurs
    }
}
