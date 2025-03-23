package com.example.megacitycab.dao;

import com.example.megacitycab.models.Payment;

import java.sql.*;
import java.time.LocalDateTime;

public class PaymentDAO {
    private Connection connection;

    public PaymentDAO() throws SQLException {
        this.connection = DatabaseConnection.getConnection();
    }

    // Insert a new payment
    public boolean insertPayment(Payment payment) {
        String sql = "INSERT INTO Payment (CardNumber, ExpiryDate, CVV, Name, ContactNumber, PaymentDate) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, payment.getCardNumber());
            stmt.setString(2, payment.getExpiryDate());
            stmt.setString(3, payment.getCvv());
            stmt.setString(4, payment.getName());
            stmt.setString(5, payment.getContactNumber());
            stmt.setTimestamp(6, Timestamp.valueOf(payment.getPaymentDate()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}