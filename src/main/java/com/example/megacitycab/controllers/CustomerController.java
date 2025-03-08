package com.example.megacitycab.controllers;



import com.example.megacitycab.dao.CustomerDAO;
import com.example.megacitycab.models.Customer;
import com.example.megacitycab.utils.PasswordHasher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDAO customerDAO;

    public void init() {
        customerDAO = new CustomerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (action) {
            case "register":
                registerCustomer(request, response);
                break;
            case "login":
                loginCustomer(request, response);
                break;
            case "logout":
                logoutCustomer(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    private void registerCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nic = request.getParameter("nic");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        // Hash the password for security
        String hashedPassword = PasswordHasher.hashPassword(password);

        Customer customer = new Customer(nic, name, email, phoneNumber, hashedPassword);

        if (customerDAO.registerCustomer(customer)) {
            response.sendRedirect("login.jsp?message=Registration successful, please login.");
        } else {
            response.sendRedirect("register.jsp?error=Registration failed. Try again.");
        }
    }

    private void loginCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerDAO.getCustomerByEmail(email);

        if (customer != null && PasswordHasher.checkPassword(password, customer.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid email or password.");
        }
    }

    private void logoutCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp?message=Logged out successfully.");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
