<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.example.megacitycab.dao.CarDAO, com.example.megacitycab.models.Car" %>

<%
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background-color: #000000; /* Changed to pure black */
            color: #ffffff;
        }
        .card {
            background-color: #2c2c2c;
            border: 1px solid #444;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .table {
            color: #ffffff !important;
        }
        .modal-content {
            background-color: #2c2c2c;
            color: #ffffff;
        }
        .modal-header, .modal-footer {
            border-color: #444;
        }
        .btn-close {
            filter: invert(1);
        }
    </style>
</head>
<body>

<!-- Header -->


<div class="container mt-4">
    <h2 class="text-center mb-4 animate__animated animate__fadeIn">🚗 Manage Cars</h2>

    <!-- Add Car Button -->
    <button class="btn btn-primary mb-3 animate__animated animate__fadeIn" data-bs-toggle="modal" data-bs-target="#addCarModal">
        <i class="fas fa-plus"></i> Add Car
    </button>

    <!-- Cars Table -->
    <div class="table-responsive">
        <table id="carsTable" class="table table-striped table-dark">
            <thead>
            <tr>
                <th>ID</th>
                <th>Model</th>
                <th>Brand</th>
                <th>License Plate</th>
                <th>Price/Day</th>
                <th>Status</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Car car : carList) { %>
            <tr>
                <td><%= car.getCarID() %></td>
                <td><%= car.getModel() %></td>
                <td><%= car.getBrand() %></td>
                <td><%= car.getLicensePlate() %></td>
                <td>Rs.<%= car.getPricePerDay() %></td>
                <td><span class="badge bg-<%= car.getStatus().equals("Available") ? "success" : "warning" %>"><%= car.getStatus() %></span></td>
                <td>
                    <img src="<%= car.getImage() %>" alt="Car Image" width="80" class="img-thumbnail">
                </td>
                <td>
                    <button class="btn btn-warning btn-sm editBtn"
                            data-bs-toggle="modal"
                            data-bs-target="#editCarModal"
                            data-id="<%= car.getCarID() %>"
                            data-model="<%= car.getModel() %>"
                            data-brand="<%= car.getBrand() %>"
                            data-license="<%= car.getLicensePlate() %>"
                            data-price="<%= car.getPricePerDay() %>"
                            data-status="<%= car.getStatus() %>"
                            data-image="<%= car.getImage() %>">
                        <i class="fas fa-edit"></i> Edit
                    </button>
                    <a href="<%= request.getContextPath() %>/CarController?action=delete&id=<%= car.getCarID() %>"
                       class="btn btn-danger btn-sm">
                        <i class="fas fa-trash"></i> Delete
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Car Modal -->
<div class="modal fade" id="addCarModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Car</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="<%= request.getContextPath() %>/CarController" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label class="form-label">Model</label>
                        <input type="text" name="model" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">License Plate</label>
                        <input type="text" name="license" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Price Per Day</label>
                        <input type="number" name="price" class="form-control" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-control">
                            <option value="Available">Available</option>
                            <option value="Booked">Booked</option>
                            <option value="In Maintenance">In Maintenance</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Upload Image</label>
                        <input type="file" name="image" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Add Car</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Car Modal -->
<div class="modal fade" id="editCarModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Car</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editCarForm" action="<%= request.getContextPath() %>/CarController" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="carID" id="editCarID">
                    <div class="mb-3">
                        <label class="form-label">Model</label>
                        <input type="text" name="model" id="editModel" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" id="editBrand" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">License Plate</label>
                        <input type="text" name="license" id="editLicense" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Price Per Day</label>
                        <input type="number" name="price" id="editPrice" class="form-control" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select name="status" id="editStatus" class="form-control">
                            <option value="Available">Available</option>
                            <option value="Booked">Booked</option>
                            <option value="In Maintenance">In Maintenance</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Upload Image</label>
                        <input type="file" name="image" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Update Car</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        $('#carsTable').DataTable();

        $('.editBtn').click(function () {
            let carID = $(this).data('id');
            let model = $(this).data('model');
            let brand = $(this).data('brand');
            let license = $(this).data('license');
            let price = $(this).data('price');
            let status = $(this).data('status');

            $('#editCarID').val(carID);
            $('#editModel').val(model);
            $('#editBrand').val(brand);
            $('#editLicense').val(license);
            $('#editPrice').val(price);
            $('#editStatus').val(status);
        });
    });
</script>
</body>
</html>