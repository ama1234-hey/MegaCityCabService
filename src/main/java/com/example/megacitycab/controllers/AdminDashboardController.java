package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.DashboardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminDashboardController")
public class AdminDashboardController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DashboardDAO dashboardDAO = new DashboardDAO();

        // Get actual numbers from the database
        int totalBookings = dashboardDAO.getTotalBookings();
        int availableCars = dashboardDAO.getAvailableCars();
        int activeDrivers = dashboardDAO.getActiveDrivers();
        int registeredUsers = dashboardDAO.getTotalCustomers();

        // Set attributes for JSP
        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("availableCars", availableCars);
        request.setAttribute("activeDrivers", activeDrivers);
        request.setAttribute("registeredUsers", registeredUsers);

        // Forward to dashboard.jsp
        request.getRequestDispatcher(request.getContextPath() + "/pages/adminDashboard.jsp").forward(request, response);
    }
}
