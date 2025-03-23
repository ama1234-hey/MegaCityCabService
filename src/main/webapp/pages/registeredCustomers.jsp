<%@ page import="com.example.megacitycab.dao.CustomerDAO, com.example.megacitycab.models.Customer, java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registered Customers - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #6366f1;
      --danger-color: #294cbf;
      --card-bg: #ffffff;
    }

    body {
      background: #f8fafc;
      font-family: 'Inter', sans-serif;
      padding: 2rem 0;
    }

    .customer-card {
      background: var(--card-bg);
      border-radius: 16px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
      transition: transform 0.2s ease;
      overflow: hidden;
      margin-bottom: 1.5rem;
    }

    .customer-card:hover {
      transform: translateY(-3px);
    }

    .card-header {
      background: linear-gradient(135deg, var(--primary-color), #4f46e5);
      color: white;
      padding: 1.2rem;
      border-bottom: 0;
    }

    .detail-group {
      padding: 1.5rem;
      border-bottom: 1px solid #f1f5f9;
    }

    .detail-group:last-child {
      border-bottom: 0;
    }

    .detail-label {
      color: #64748b;
      font-size: 0.9rem;
      margin-bottom: 0.3rem;
    }

    .detail-value {
      color: #1e293b;
      font-weight: 500;
      margin-bottom: 1rem;
    }

    .delete-btn {
      background: var(--danger-color);
      color: white;
      border: none;
      padding: 0.6rem 1.2rem;
      border-radius: 8px;
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      transition: background 0.2s ease;
    }

    .delete-btn:hover {
      background: #dc2626;
    }
  </style>
</head>
<body>

<!-- Header -->


<div class="container">
  <div class="mb-4 text-center">
    <h2 class="fw-bold mb-3">👥 Registered Customers</h2>
    <p class="text-muted">Manage all registered customers</p>
  </div>

  <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    <%
      CustomerDAO customerDAO = null;
      try {
        customerDAO = new CustomerDAO();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
      List<Customer> customers = customerDAO.getAllCustomers();

      for (Customer customer : customers) {
    %>
    <div class="col">
      <div class="customer-card">
        <div class="card-header">
          <h5 class="mb-0">Customer #<%= customer.getCustomerId() %></h5>
        </div>

        <div class="detail-group">
          <div class="detail-label"><i class="fas fa-user me-2"></i>Name</div>
          <div class="detail-value"><%= customer.getName() %></div>

          <div class="detail-label"><i class="fas fa-id-card me-2"></i>NIC</div>
          <div class="detail-value"><%= customer.getNic() %></div>

          <div class="detail-label"><i class="fas fa-envelope me-2"></i>Email</div>
          <div class="detail-value"><%= customer.getEmail() %></div>

          <div class="detail-label"><i class="fas fa-phone me-2"></i>Phone</div>
          <div class="detail-value"><%= customer.getPhoneNumber() %></div>
        </div>

        <div class="detail-group text-end p-3">
          <form method="post" action="${pageContext.request.contextPath}/DeleteCustomerController" onsubmit="return confirmDelete();">
            <input type="hidden" name="customer_id" value="<%= customer.getCustomerId() %>">
            <button type="submit" class="delete-btn">
              <i class="fas fa-trash me-1"></i>
              Delete Customer
            </button>
          </form>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</div>

<script>
  // JavaScript function to confirm deletion
  function confirmDelete() {
    return confirm("Are you sure you want to delete this user?");
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>