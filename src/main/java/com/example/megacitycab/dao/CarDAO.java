package com.example.megacitycab.dao;

import com.example.megacitycab.models.Car;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {

    // Add a new car
    public boolean addCar(Car car) {
        String sql = "INSERT INTO Car (Model, Brand, LicensePlate, PricePerDay, Status, Image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, car.getModel());
            stmt.setString(2, car.getBrand());
            stmt.setString(3, car.getLicensePlate());
            stmt.setDouble(4, car.getPricePerDay());
            stmt.setString(5, car.getStatus());
            stmt.setString(6, car.getImage());

            return stmt.executeUpdate() > 0; // Returns true if insert is successful

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all cars
    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Car";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Car car = new Car(
                        rs.getInt("CarID"),
                        rs.getString("Model"),
                        rs.getString("Brand"),
                        rs.getString("LicensePlate"),
                        rs.getDouble("PricePerDay"),
                        rs.getString("Status"),
                        rs.getString("Image")
                );
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    // Get a single car by ID
    public Car getCarById(int carID) {
        String sql = "SELECT * FROM Car WHERE CarID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, carID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Car(
                        rs.getInt("CarID"),
                        rs.getString("Model"),
                        rs.getString("Brand"),
                        rs.getString("LicensePlate"),
                        rs.getDouble("PricePerDay"),
                        rs.getString("Status"),
                        rs.getString("Image")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update a car
    public boolean updateCar(Car car) {
        String sql = "UPDATE Car SET Model = ?, Brand = ?, LicensePlate = ?, PricePerDay = ?, Status = ?, Image = ? WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, car.getModel());
            stmt.setString(2, car.getBrand());
            stmt.setString(3, car.getLicensePlate());
            stmt.setDouble(4, car.getPricePerDay());
            stmt.setString(5, car.getStatus());
            stmt.setString(6, car.getImage());
            stmt.setInt(7, car.getCarID());

            return stmt.executeUpdate() > 0; // Returns true if update is successful

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a car
    public boolean deleteCar(int carID) {
        String sql = "DELETE FROM Car WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, carID);
            return stmt.executeUpdate() > 0; // Returns true if deletion is successful

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
