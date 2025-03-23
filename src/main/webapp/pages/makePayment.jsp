<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .payment-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            max-width: 900px; /* Increased width for horizontal layout */
            width: 100%;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card-preview {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 12px;
            padding: 1.5rem;
            color: white;
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
        }

        .card-preview::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(45deg);
        }

        .card-preview .card-number {
            font-size: 1.5rem;
            letter-spacing: 2px;
            margin-bottom: 1rem;
        }

        .card-preview .card-details {
            display: flex;
            justify-content: space-between;
            font-size: 0.9rem;
        }

        .card-preview .card-details .card-name,
        .card-preview .card-details .card-expiry {
            text-transform: uppercase;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-weight: 500;
            color: #555;
            margin-bottom: 0.5rem;
        }

        .form-group input {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 0.75rem;
            width: 100%;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-group input::placeholder {
            color: #aaa;
        }

        .form-group .input-icon {
            position: relative;
        }

        .form-group .input-icon i {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            color: #667eea;
        }

        .pay-button {
            background: #667eea;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            width: 100%;
            transition: background 0.3s ease;
        }

        .pay-button:hover {
            background: #5a6fd1;
        }

        .credit-card-image {
            max-width: 100%;
            height: auto;
            border-radius: 12px;
        }
    </style>
</head>
<body>
<div class="payment-container">
    <div class="row">
        <!-- Left Column: Credit Card Image -->
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <img src="<%= request.getContextPath() %>/assets/images/hello1.png" alt="Credit Card" class="credit-card-image">
        </div>

        <!-- Right Column: Payment Form -->
        <div class="col-md-6">
            <h2 class="text-center mb-4">💳 Make Payment</h2>

            <!-- Card Preview -->
            <div class="card-preview">
                <div class="card-number" id="cardNumberPreview">**** **** **** ****</div>
                <div class="card-details">
                    <div class="card-name" id="cardNamePreview">FULL NAME</div>
                    <div class="card-expiry" id="cardExpiryPreview">MM/YY</div>
                </div>
            </div>

            <!-- Payment Form -->
            <form id="paymentForm" action="<%= request.getContextPath() %>/PaymentController" method="post" onsubmit="return validatePayment()">
                <!-- Card Number -->
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <div class="input-icon">
                        <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19" required>
                        <i class="fas fa-credit-card"></i>
                    </div>
                </div>

                <!-- Expiry Date -->
                <div class="form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <div class="input-icon">
                        <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" maxlength="5" required>
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                </div>

                <!-- CVV -->
                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <div class="input-icon">
                        <input type="text" id="cvv" name="cvv" placeholder="123" maxlength="3" required>
                        <i class="fas fa-lock"></i>
                    </div>
                </div>

                <!-- Name -->
                <div class="form-group">
                    <label for="name">Cardholder Name</label>
                    <input type="text" id="name" name="name" placeholder="John Doe" required>
                </div>

                <!-- Contact Number -->
                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <input type="text" id="contactNumber" name="contactNumber" placeholder="+94 123 456 789" required>
                </div>

                <!-- Pay Button -->
                <button type="submit" class="pay-button">Pay Now</button>
            </form>
        </div>
    </div>
</div>

<!-- JavaScript for Dynamic Card Preview and Validation -->
<script>
    // Card Number Formatting
    const cardNumberInput = document.getElementById('cardNumber');
    const cardNumberPreview = document.getElementById('cardNumberPreview');

    cardNumberInput.addEventListener('input', (e) => {
        let value = e.target.value.replace(/\s/g, '').replace(/\D/g, '');
        if (value.length > 16) value = value.slice(0, 16);
        value = value.replace(/(\d{4})/g, '$1 ').trim();
        e.target.value = value;
        cardNumberPreview.textContent = value || '**** **** **** ****';
    });

    // Expiry Date Formatting
    const expiryDateInput = document.getElementById('expiryDate');
    const cardExpiryPreview = document.getElementById('cardExpiryPreview');

    expiryDateInput.addEventListener('input', (e) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 4) value = value.slice(0, 4);
        if (value.length > 2) value = value.replace(/(\d{2})(\d{0,2})/, '$1/$2');
        e.target.value = value;
        cardExpiryPreview.textContent = value || 'MM/YY';
    });

    // Name Formatting
    const nameInput = document.getElementById('name');
    const cardNamePreview = document.getElementById('cardNamePreview');

    nameInput.addEventListener('input', (e) => {
        cardNamePreview.textContent = e.target.value.toUpperCase() || 'FULL NAME';
    });

    // Payment Validation
    function validatePayment() {
        const cardNumber = cardNumberInput.value.replace(/\s/g, '');
        const expiryDate = expiryDateInput.value;
        const cvv = document.getElementById('cvv').value;
        const name = nameInput.value;
        const contactNumber = document.getElementById('contactNumber').value;

        // Validate Card Number (16 digits)
        if (cardNumber.length !== 16 || !/^\d+$/.test(cardNumber)) {
            alert('Invalid card number. Please enter a valid 16-digit card number.');
            return false;
        }

        // Validate Expiry Date (MM/YY format)
        if (!/^\d{2}\/\d{2}$/.test(expiryDate)) {
            alert('Invalid expiry date. Please use the MM/YY format.');
            return false;
        }

        // Validate CVV (3 digits)
        if (cvv.length !== 3 || !/^\d+$/.test(cvv)) {
            alert('Invalid CVV. Please enter a valid 3-digit CVV.');
            return false;
        }

        // Validate Name (non-empty)
        if (name.trim() === '') {
            alert('Please enter the cardholder name.');
            return false;
        }

        // Validate Contact Number (non-empty)
        if (contactNumber.trim() === '') {
            alert('Please enter your contact number.');
            return false;
        }

        // If all validations pass, show success message
        alert('Payment successful! Thank you for your purchase.');
        return true;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>