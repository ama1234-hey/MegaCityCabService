package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.CustomerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteCustomerController")
public class DeleteCustomerController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customer_id"));

        CustomerDAO customerDAO = null;
        try {
            customerDAO = new CustomerDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (customerDAO.deleteCustomer(customerId)) {
            response.sendRedirect(request.getContextPath() + "/pages/registeredCustomers.jsp?delete=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
        }
    }
}