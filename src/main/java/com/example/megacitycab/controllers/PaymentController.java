package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.PaymentDAO;
import com.example.megacitycab.models.Payment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        String name = request.getParameter("name");
        String contactNumber = request.getParameter("contactNumber");

        // Create Payment object
        Payment payment = new Payment(cardNumber, expiryDate, cvv, name, contactNumber);

        // Save payment to database
        PaymentDAO paymentDAO = null;
        try {
            paymentDAO = new PaymentDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (paymentDAO.insertPayment(payment)) {
            response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/pages/paymentError.jsp");
        }
    }
}