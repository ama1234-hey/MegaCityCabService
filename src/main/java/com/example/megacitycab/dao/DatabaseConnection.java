package com.example.megacitycab.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    private static Connection connection;

    // Private constructor to prevent instantiation
    private DatabaseConnection() { }

    public static Connection getConnection() throws SQLException {
        if (connection == null) {
            synchronized (DatabaseConnection.class) { // Thread-safety
                if (connection == null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(URL, USER, PASSWORD);
                    } catch (ClassNotFoundException e) {
                        throw new SQLException("Database Driver not found!", e);
                    }
                }
            }
        }
        return connection;
    }
}
