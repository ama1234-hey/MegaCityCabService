package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.DriverDAO;
import com.example.megacitycab.models.Driver;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DriverController")
public class DriverController extends HttpServlet {
    private DriverDAO driverDAO = new DriverDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Driver driver = new Driver(0,
                    request.getParameter("name"),
                    request.getParameter("license"),
                    request.getParameter("phone"),
                    request.getParameter("email"),
                    true
            );
            driverDAO.addDriver(driver);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("driverID"));
            Driver driver = new Driver(id,
                    request.getParameter("name"),
                    request.getParameter("license"),
                    request.getParameter("phone"),
                    request.getParameter("email"),
                    true
            );
            driverDAO.updateDriver(driver);
        }

        response.sendRedirect(request.getContextPath() + "/pages/manageDrivers.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            driverDAO.deleteDriver(id);
        }

        response.sendRedirect(request.getContextPath() + "/pages/manageDrivers.jsp");
    }
}
