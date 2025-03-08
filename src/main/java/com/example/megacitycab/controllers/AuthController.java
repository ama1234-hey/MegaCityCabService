package com.example.megacitycab.controllers;


import com.example.megacitycab.dao.AdminDAO;
import com.example.megacitycab.dao.CustomerDAO;
import com.example.megacitycab.models.Admin;
import com.example.megacitycab.models.Customer;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();
    private final CustomerDAO customerDAO = new CustomerDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userType = request.getParameter("userType"); // "admin" or "customer"
        String emailOrUsername = request.getParameter("email") != null ? request.getParameter("email") : request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        if ("admin".equals(userType)) {
            // Admin Login
            Admin admin = adminDAO.login(emailOrUsername, password);
            if (admin != null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("/MegaCityCab_war/pages/adminDashboard.jsp"); // Redirect to admin dashboard
            } else {
                session.setAttribute("error", "Invalid Admin Credentials!");
                response.sendRedirect("/MegaCityCab_war/pages/adminDashboard.jsp");
            }
        } else {
            // Customer Login
            Customer customer = customerDAO.login(emailOrUsername, password);
            if (customer != null) {
                session.setAttribute("customer", customer);
                response.sendRedirect("pages/adminDashboard.jsp"); // Redirect to customer home page
            } else {
                session.setAttribute("error", "Invalid Customer Credentials!");
                response.sendRedirect("/pages/login.jsp");
            }
        }
    }
}
