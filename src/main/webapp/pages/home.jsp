<%@ page import="com.example.megacitycab.dao.CarDAO, com.example.megacitycab.models.Car, java.util.List" %>
<%@ page import="com.example.megacitycab.dao.DriverDAO, com.example.megacitycab.models.Driver" %>
<%@ page import="com.example.megacitycab.dao.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Megacity Cab - Book Your Ride</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            height: 65vh;
            background-color: #434343;
            width: 100%;
            background: url('<%= request.getContextPath() %>/assets/images/hi.jpeg') no-repeat center center fixed;
            background-size: cover; /* Increase the width of the image by covering the entire container */
            background-position: center 70%; /* Move the image down slightly (adjust the percentage as needed) */
            display: flex;
            align-items: center;
            color: #2c2c2c;
        }
        .car-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
        }
        .car-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .price-tag {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        .top-right-buttons {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .modal-content {
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Header -->
<jsp:include page="/includes/header2.jsp" />



<!-- Booking Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Book Your Ride</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="bookingForm" action="<%= request.getContextPath() %>/BookingController" method="post">
                    <input type="hidden" id="bookCarID" name="carID">
                    <input type="hidden" id="totalBill" name="totalBill">

                    <div class="mb-3">
                        <label class="form-label">Customer Name</label>
                        <input type="text" class="form-control" name="customer_name" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <textarea class="form-control" name="address" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Telephone Number</label>
                        <input type="text" class="form-control" name="telephone_number" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Pickup Location</label>
                        <input type="text" class="form-control" name="pickup_location" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Duration(Km)  [First 200Km free] </label>
                        <input type="number" class="form-control" id="duration" name="duration" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Booking Date & Time</label>
                        <input type="datetime-local" class="form-control" name="orderDatetime" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Driver</label>
                        <select class="form-control" id="driver" name="driver_name" required>
                            <option value="Self Drive">Self Drive</option>
                            <option value="With a driver">With a driver</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Car Model</label>
                        <select class="form-control" id="carModel" name="car_model" required>
                            <option value="Suzuki Alto" data-price="4000">Suzuki Alto - Rs.4000</option>
                            <option value="Suzuki Wagon R" data-price="5000">Suzuki Wagon R - Rs.5000</option>
                            <option value="Toyota Prius" data-price="6000">Toyota Prius - Rs.6000</option>
                            <option value="Honda Vessel" data-price="6500">Honda Vessel - Rs.6500</option>
                            <option value="Toyota Land Cruiser" data-price="7000">Toyota Land Cruiser - Rs.7000</option>
                            <option value="Audi A3" data-price="8500">Audi A3 - Rs.8500</option>
                        </select>
                    </div>

                    <button type="button" class="btn btn-primary w-100" onclick="calculateBill()">Submit Booking</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bill Summary Popup -->
<div class="modal fade" id="billSummaryModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Bill Summary</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p id="billDetails"></p>
                <button type="submit" class="btn btn-success w-100" onclick="submitBooking()">Confirm & Generate Bill</button>
            </div>
        </div>
    </div>
</div>


<!-- Hero Section -->
<div class="hero-section">
    <div class="container text-center">
        <h1 class="display-4 mb-4 animate-fade-in">Find Your Perfect Ride</h1>
        <div class="search-bar mx-auto" style="max-width: 600px;">
            <input type="text" class="form-control form-control-lg"
                   placeholder="Search by brand, model, or features...">
        </div>
    </div>
</div>
<!-- Top Right Buttons -->
<div class="top-right-buttons">

</div>

<!-- Featured Cars Section -->
<div class="container py-5">
    <div class="d-flex justify-content-center mb-4 gap-3">
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</button>
        <a href="../pages/makePayment.jsp" class="btn btn-danger">Make Payment</a>
        <a href="../index.jsp" class="btn btn-danger">Logout</a>
    </div>
    <h2 class="text-center mb-5">Available Vehicles</h2>
    <div class="row g-4">
        <%
            CarDAO carDAO = new CarDAO();
            List<Car> cars = carDAO.getFeaturedCars(30);
            for (Car car : cars) {
        %>
        <div class="col-md-4 col-lg-3">
            <div class="car-card card h-100 position-relative">
                <div class="price-tag">Rs. <%= car.getPricePerDay() %>/day</div>

                <img src="<%= request.getContextPath() %>/<%= car.getImage() %>"
                     class="card-img-top"
                     alt="<%= car.getBrand() %> <%= car.getModel() %>"
                     style="height: 200px; object-fit: cover;">

                <div class="card-body">
                    <h5 class="card-title"><%= car.getBrand() %> <%= car.getModel() %></h5>
                    <p class="text-muted"><%= car.getLicensePlate() %></p>
                    <button class="btn btn-primary w-100 book-btn"
                            data-car-id="<%= car.getCarID() %>"
                            data-bs-toggle="modal"
                            data-bs-target="#bookingModal">
                        Book Now
                    </button>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Popup for Booking Success or Failure -->
<% if ("success".equals(request.getParameter("booking"))) { %>
<script type="text/javascript">
    alert("Booking Successful! Your ride has been confirmed.");
</script>
<% } else if ("error".equals(request.getParameter("booking"))) { %>
<script type="text/javascript">
    alert("Booking failed. Please try again.");
</script>
<% } %>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.book-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            let carID = btn.dataset.carId;
            console.log("Selected Car ID: ", carID); // Debugging
            document.getElementById('bookCarID').value = carID;
        });
    });

    function calculateBill() {
        let duration = parseInt(document.getElementById("duration").value) || 0;
        let driver = document.getElementById("driver").value;
        let carModel = document.getElementById("carModel");
        let carPrice = parseInt(carModel.options[carModel.selectedIndex].getAttribute("data-price")) || 0;

        let bill = (duration * 40) + carPrice;
        if (driver === "With a driver") {
            bill += 5000;
        }

        let discount = bill * 0.2;
        let finalBill = bill - discount;

        document.getElementById("totalBill").value = finalBill;
        document.getElementById("billDetails").innerHTML = `
        <strong>Base Price:</strong> Rs.${carPrice} <br>
        <strong>Duration Charge (Rs.40/km):</strong> Rs.${duration * 40} <br>
        ${driver == "With a driver" ? "<strong>Driver Fee:</strong> Rs.5000 <br>" : ""}
        <strong>Subtotal:</strong> Rs.${bill} <br>
        <strong>Discount (20%):</strong> -Rs.${discount} <br>
        <strong>Total Bill:</strong> <span style="color:green;">Rs.${finalBill}</span>
    `;

        new bootstrap.Modal(document.getElementById("billSummaryModal")).show();
    }

    function submitBooking() {
        document.getElementById("bookingForm").submit();
    }

</script>
</body>
</html>
