package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.CarDAO;
import com.example.megacitycab.models.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CarController")
public class CarController extends HttpServlet {
    private final CarDAO carDAO = new CarDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String licensePlate = request.getParameter("license");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            String image = request.getParameter("image"); // Image handling logic needed

            Car car = new Car(model, brand, licensePlate, price, status, image);
            carDAO.addCar(car);
        } else if ("update".equals(action)) {
            int carID = Integer.parseInt(request.getParameter("carID"));
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String licensePlate = request.getParameter("license");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            String image = request.getParameter("image"); // Image handling logic needed

            Car car = new Car(carID, model, brand, licensePlate, price, status, image);
            carDAO.updateCar(car);
        }

        response.sendRedirect(request.getContextPath() + "/pages/manageCar.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int carID = Integer.parseInt(request.getParameter("id"));
            carDAO.deleteCar(carID);
        }

        response.sendRedirect(request.getContextPath() + "/pages/manageCar.jsp");
    }
}
