package com.example.megacitycab.dao;

import com.example.megacitycab.models.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {

    /**
     * Logs in a customer by verifying email and password.
     * @param email The email of the customer.
     * @param password The password of the customer.
     * @return A Customer object if login is successful, otherwise null.
     */
    public Customer login(String email, String password) {
        Customer customer = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM customer WHERE Email = ? AND Password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("CustomerID"),
                        rs.getString("NIC"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    /**
     * Retrieves a customer by email.
     * @param email The email of the customer.
     * @return A Customer object if found, otherwise null.
     */
    public Customer getCustomerByEmail(String email) {
        Customer customer = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM customer WHERE Email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("CustomerID"),
                        rs.getString("NIC"),
                        rs.getString("Name"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    /**
     * Registers a new customer in the database.
     * @param customer The Customer object containing all details.
     * @return true if the customer was added successfully, otherwise false.
     */
    public boolean registerCustomer(Customer customer) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO customer (NIC, Name, Email, PhoneNumber, Password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, customer.getNic());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getEmail());
            stmt.setString(4, customer.getPhoneNumber());
            stmt.setString(5, customer.getPassword()); // Ensure password is hashed before storing

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Updates customer details.
     * @param customer The updated Customer object.
     * @return true if the update was successful, otherwise false.
     */
    public boolean updateCustomer(Customer customer) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE customer SET NIC = ?, Name = ?, PhoneNumber = ?, Password = ? WHERE Email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, customer.getNic());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getPhoneNumber());
            stmt.setString(4, customer.getPassword());
            stmt.setString(5, customer.getEmail());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Deletes a customer from the database.
     * @param email The email of the customer to delete.
     * @return true if deletion was successful, otherwise false.
     */
    public boolean deleteCustomer(String email) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM customer WHERE Email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Checks if a customer exists by email.
     * @param email The email to check.
     * @return true if the customer exists, otherwise false.
     */
    public boolean customerExists(String email) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM customer WHERE Email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
