package com.example.megacitycab.dao;

import com.example.megacitycab.models.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    // ✅ Add Driver
    public boolean addDriver(Driver driver) {
        String sql = "INSERT INTO Driver (Name, LicenseNumber, PhoneNumber, Email, Availability) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getLicenseNumber());
            stmt.setString(3, driver.getPhoneNumber());
            stmt.setString(4, driver.getEmail());
            stmt.setBoolean(5, driver.isAvailable());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Update Driver
    public boolean updateDriver(Driver driver) {
        String sql = "UPDATE Driver SET Name = ?, LicenseNumber = ?, PhoneNumber = ?, Email = ? WHERE DriverID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getLicenseNumber());
            stmt.setString(3, driver.getPhoneNumber());
            stmt.setString(4, driver.getEmail());
            stmt.setInt(5, driver.getDriverID());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Delete Driver
    public boolean deleteDriver(int id) {
        String sql = "DELETE FROM Driver WHERE DriverID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Get All Drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM Driver";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                drivers.add(new Driver(
                        rs.getInt("DriverID"),
                        rs.getString("Name"),
                        rs.getString("LicenseNumber"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getBoolean("Availability")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // ✅ Get Driver by ID
    public Driver getDriverById(int id) {
        String sql = "SELECT * FROM Driver WHERE DriverID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Driver(
                            rs.getInt("DriverID"),
                            rs.getString("Name"),
                            rs.getString("LicenseNumber"),
                            rs.getString("PhoneNumber"),
                            rs.getString("Email"),
                            rs.getBoolean("Availability")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
