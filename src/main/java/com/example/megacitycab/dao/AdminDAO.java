package com.example.megacitycab.dao;

import com.example.megacitycab.models.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
    public Admin login(String username, String password) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE Username = ? AND Password = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                admin = new Admin(
                        rs.getInt("AdminID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
    public static boolean adminEmailExists(String email) {
        String query = "SELECT * FROM admin WHERE Email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            return rs.next(); // Returns true if email exists
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
