package com.example.megacitycab.dao;

import com.example.megacitycab.models.User;
import java.sql.*;
import java.util.Random;

public class UserDAO {
    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    // ✅ FIXED Admin & Customer Login
    public User login(String identifier, String password, String userType) {
        String sql = userType.equals("admin") ?
                "SELECT * FROM Admin WHERE (Username = ? OR Email = ?) AND Password = ?" :
                "SELECT * FROM Customer WHERE Email = ? AND Password = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, identifier);
            if (userType.equals("admin")) {
                stmt.setString(2, identifier);
                stmt.setString(3, password);
            } else {
                stmt.setString(2, password);
            }

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                if (userType.equals("admin")) {
                    return new User(
                            rs.getInt("AdminID"),
                            rs.getString("Username"),
                            rs.getString("Email"),
                            rs.getString("Password"),
                            "admin"
                    );
                } else {
                    return new User(
                            rs.getInt("CustomerID"),
                            rs.getString("NIC"),
                            rs.getString("Name"),
                            rs.getString("Email"),
                            rs.getString("PhoneNumber"),
                            rs.getString("Password"),
                            "customer"
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public boolean registerCustomer(User customer) {
        String sql = "INSERT INTO Customer (NIC, Name, Email, PhoneNumber, Password) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, customer.getNic());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getEmail());
            stmt.setString(4, customer.getPhoneNumber());
            stmt.setString(5, customer.getPassword());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // ✅ Admin Forgot Password Function
    public String resetAdminPassword(String email) {
        String newPassword = generateRandomPassword();
        String sql = "UPDATE Admin SET Password = ? WHERE Email = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                sendEmail(email, "Your new password: " + newPassword);
                return newPassword;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Generate Random Password
    private String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder password = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < 8; i++) {
            password.append(chars.charAt(random.nextInt(chars.length())));
        }
        return password.toString();
    }

    // Simulate Sending Email (Replace with actual email service)
    private void sendEmail(String to, String message) {
        System.out.println("Sending email to: " + to);
        System.out.println("Message: " + message);
    }
}
