<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Location" %>
<%@ page import="com.entity.Cars" %>
<%@ page import="com.entity.Clients" %>
<%@ page import="com.dao.LocationDAO" %>
<%@ page import="com.dao.CarsDAO" %>
<%@ page import="com.dao.ClientsDAO" %>
<%@ page import="com.db.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location de voitures</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/admin/navbar.jsp" %>

<div class="container">
    <h1 class="mt-5">Voitures disponibles pour location</h1>
    <table class="table">
        <thead>
            <tr>
                <th>Reg_num</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Status</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <% 
            CarsDAO carDAO = new CarsDAO(DBConnect.getConn());
            List<Cars> carsList = carDAO.getCarsDisp();
            for (Cars car : carsList) { %>
                <tr>
                    <td><%= car.getNum_reg() %></td>
                    <td><%= car.getBrand() %></td>
                    <td><%= car.getModel() %></td>
                    <td><%= car.getStatus() %></td>
                    <td><%= car.getPrice() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <h2 class="mt-5">Formulaire de location</h2>
    <form action="update_location" method="post" id="location-form">
        <div class="mb-3">
            <label for="carReg" class="form-label">Matricule de la voiture:</label>
            <select class="form-select" id="carReg" name="carReg" required>
                <% for (Cars car : carsList) { %>
                    <option value="<%= car.getNum_reg() %>"><%= car.getNum_reg() %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label for="startDate" class="form-label">Date de début de location:</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="mb-3">
            <label for="endDate" class="form-label">Date de fin de location:</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="mb-3">
            <label for="customerName" class="form-label">Nom du client:</label>
            <select class="form-select" id="customerName" name="customerName" required>
                <% 
                ClientsDAO clientsDAO = new ClientsDAO(DBConnect.getConn());
                List<Clients> clientsList = clientsDAO.getClients();
                for(Clients client : clientsList) { %>
                    <option value="<%= client.getName() %>"><%= client.getName() %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label for="rentFee" class="form-label">Frais de location:</label>
            <input type="text" class="form-control" id="rentFee" name="rentFee" required>
        </div>
        <input type="hidden" id="is-update" name="isUpdate" value="false">
        <button type="submit" class="btn btn-primary" id="submit-btn">Louer</button>
    </form>

    <h1 class="mt-5">Voitures en location</h1>
    <table class="table">
        <thead>
            <tr>
                <th>Num_reg</th>
                <th>Nom du client</th>
                <th>Date de location</th>
                <th>Date de retour</th>
                <th>Frais de retour</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            LocationDAO locationDAO = new LocationDAO(DBConnect.getConn());
            List<Location> locationsList = locationDAO.getLocations();
            for (Location location : locationsList) { %>
                <tr>
                    <td><%= location.getNumReg() %></td>
                    <td><%= location.getCustomerName() %></td>
                    <td><%= location.getStartDate() %></td>
                    <td><%= location.getEndDate() %></td>
                    <td><%= location.getRentFee() %></td>
                    <td>
                        <button class="btn btn-warning" onclick="populateForm('<%= location.getNumReg() %>','<%= location.getCustomerName() %>','<%= location.getStartDate() %>','<%= location.getEndDate() %>','<%= location.getRentFee() %>')">Update</button>
                        <form action="delete_location" method="post" style="display:inline;">
                            <input type="hidden" name="carReg" value="<%= location.getNumReg() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function populateForm(numReg, customerName, startDate, endDate, rentFee) {
        document.getElementById('carReg').value = numReg;
        document.getElementById('customerName').value = customerName;
        document.getElementById('startDate').value = startDate;
        document.getElementById('endDate').value = endDate;
        document.getElementById('rentFee').value = rentFee;
        document.getElementById('is-update').value = "true";
        document.getElementById('submit-btn').innerText = "Update Location";
    }
</script>
</body>
</html>
