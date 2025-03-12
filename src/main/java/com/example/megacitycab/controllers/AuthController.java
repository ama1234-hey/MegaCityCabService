package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.UserDAO;
import com.example.megacitycab.models.User;
import com.example.megacitycab.dao.DatabaseConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        UserDAO userDAO = new UserDAO(connection);

        if ("login".equals(action)) {
            String userType = request.getParameter("userType");
            String identifier = request.getParameter(userType.equals("admin") ? "username" : "email");
            String password = request.getParameter("password");

            User user = userDAO.login(identifier, password, userType);
            if (user != null) {package com.example.megacitycab.controllers;


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

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("<script>alert('Login successful! Redirecting to home page.'); window.location.href='" + request.getContextPath() + "/pages/home.jsp';</script>");
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("<script>alert('Invalid credentials! Please try again.'); window.history.back();</script>");
            }
        }

        // Admin Forgot Password
        else if ("adminForgotPassword".equals(action)) {
            String adminEmail = request.getParameter("adminEmail");
            String newPassword = userDAO.resetAdminPassword(adminEmail);
            if (newPassword != null) {
                request.getSession().setAttribute("success", "New password has been sent to your email.");
                response.sendRedirect("login.jsp");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Invalid credentials! Please try again.');");
                out.println("window.history.back();"); // Keep user on the login page
                out.println("</script>");
            }
        }
    }
}
