<%@ page import="com.example.megacitycab.models.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Add Car - Mega City Cab</title>

    <!-- Bootstrap & MUI CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('<%= request.getContextPath() %>/assets/images/login.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(4px);
        }

        .card {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .form-control {
            border-radius: 10px;
            padding: 10px;
            font-size: 16px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
        }

        .image-preview {
            width: 80%;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            display: none;
        }

        .modal-content {
            border-radius: 15px;
        }
    </style>

    <script>
        function previewImage(event) {
            let imagePreview = document.getElementById("imagePreview");
            imagePreview.src = URL.createObjectURL(event.target.files[0]);
            imagePreview.style.display = "block";
        }
    </script>
</head>

<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4">
            <div class="card p-3">
                <h2 class="text-center mb-3">🚗 Add New Car</h2>

                <!-- Success/Error Messages -->
                <% String success = request.getParameter("success");
                    String error = request.getParameter("error");
                    if (success != null) { %>
                <div class="alert alert-success text-center"><%= success %></div>
                <% } if (error != null) { %>
                <div class="alert alert-danger text-center"><%= error %></div>
                <% } %>

                <form action="${pageContext.request.contextPath}/AddCarServlet" method="post" enctype="multipart/form-data">
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
                        <input type="text" name="licensePlate" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Price Per Day ($)</label>
                        <input type="number" step="0.01" name="pricePerDay" class="form-control" required>
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
                        <label class="form-label">Car Image</label>
                        <input type="file" name="image" class="form-control" accept="image/*" onchange="previewImage(event)">
                        <img id="imagePreview" class="image-preview mt-3">
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Add Car</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
