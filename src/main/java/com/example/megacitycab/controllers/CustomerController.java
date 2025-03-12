package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.UserDAO;
import com.example.megacitycab.models.User;
import com.example.megacitycab.dao.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");

        User customer = new User(0, nic, name, email, phone, password, "customer");

        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        UserDAO userDAO = new UserDAO(connection);

        if (userDAO.registerCustomer(customer)) {
            request.getSession().setAttribute("Success", "Registration Successful!");
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        } else {
            request.getSession().setAttribute("error", "Registration failed!");
            response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
        }
    }
}
