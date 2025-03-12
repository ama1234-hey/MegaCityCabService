package com.example.megacitycab.controllers;

import com.example.megacitycab.dao.CarDAO;
import com.example.megacitycab.models.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
@WebServlet("/CarController")
public class CarController extends HttpServlet {
    private final CarDAO carDAO = new CarDAO(); // Using Factory Pattern

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                // Retrieve form data
                String model = request.getParameter("model");
                String brand = request.getParameter("brand");
                String licensePlate = request.getParameter("license");
                double price = Double.parseDouble(request.getParameter("price"));
                String status = request.getParameter("status");

                // Handle image upload
                Part imagePart = request.getPart("image");
                String imagePath = handleImageUpload(imagePart, request);

                Car car = new Car(model, brand, licensePlate, price, status, imagePath);
                carDAO.addCar(car);
            } else if ("update".equals(action)) {
                int carID = Integer.parseInt(request.getParameter("carID"));
                String model = request.getParameter("model");
                String brand = request.getParameter("brand");
                String licensePlate = request.getParameter("license");
                double price = Double.parseDouble(request.getParameter("price"));
                String status = request.getParameter("status");

                // Get existing car to retain current image if new one isn't uploaded
                Car existingCar = carDAO.getCarById(carID);
                String imagePath = existingCar.getImage();

                // Check if a new image is uploaded
                Part imagePart = request.getPart("image");
                if (imagePart != null && imagePart.getSize() > 0) {
                    imagePath = handleImageUpload(imagePart, request);
                }

                Car car = new Car(carID, model, brand, licensePlate, price, status, imagePath);
                carDAO.updateCar(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/pages/manageCar.jsp");
    }

    // Helper method to handle image upload and return the saved path
    private String handleImageUpload(Part imagePart, HttpServletRequest request) throws IOException {
        if (imagePart == null || imagePart.getSubmittedFileName().isEmpty()) {
            return null; // No image uploaded
        }

        // Define the directory where images will be saved
        String uploadPath = getServletContext().getRealPath("/assets/images/cars");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create directory if it doesn't exist
        }

        // Generate a unique filename to prevent overwriting
        String fileName = UUID.randomUUID().toString() + "-" + imagePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;

        // Save the file
        imagePart.write(filePath);

        // Return the relative path for database storage
        return "/assets/images/cars/" + fileName;
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