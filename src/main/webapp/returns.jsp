<%@page import="com.entity.Return"%>
<%@page import="com.dao.ReturnDAO"%>
<%@page import="com.entity.Location"%>
<%@page import="com.dao.LocationDAO"%>
<%@page import="com.entity.Clients"%>
<%@page import="com.dao.ClientsDAO"%>
<%@page import="com.entity.Cars"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CarsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retour de voitures</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/admin/navbar.jsp" %>

<div class="container mt-5">
    <div class="row">
        <!-- Form Column -->
        <div class="col-md-4">
            <h2>Formulaire de Retour</h2>
            <form action="add_return" method="post">
                <div class="mb-3">
                    <label for="num_reg" class="form-label">Matricule de la voiture:</label>
                    <select class="form-select" id="num_reg" name="num_reg" required>
                        <% LocationDAO locationDAO = new LocationDAO(DBConnect.getConn());
                           List<Location> listt = locationDAO.getLocations();
                           for (Location loc : listt) { %>
                            <option value="<%= loc.getNumReg() %>"><%= loc.getNumReg() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="returnDate" class="form-label">Date de retour:</label>
                    <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                </div>
                <div class="mb-3">
                    <label for="retard" class="form-label">Retard:</label>
                    <input type="text" class="form-control" id="retard" name="retard" required>
                </div>
                <div class="mb-3">
                    <label for="amende" class="form-label">Amende:</label>
                    <input type="text" class="form-control" id="amende" name="amende" required>
                </div>
                <button type="submit" class="btn btn-primary">Retourner</button>
            </form>
        </div>

        <!-- Tables Column -->
        <div class="col-md-8">
            <!-- Voitures en Location Table -->
            <h1>Voitures en location</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th>Num_reg</th>
                        <th>Nom du client</th>
                        <th>Date de location</th>
                        <th>Date de retour</th>
                        <th>Frais de location</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Location loc : listt) { %>
                        <tr>
                            <td><%= loc.getNumReg() %></td>
                            <td><%= loc.getCustomerName() %></td>
                            <td><%= loc.getStartDate() %></td>
                            <td><%= loc.getEndDate() %></td>
                            <td><%= loc.getRentFee() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Voitures Retourner Table -->
            <h1>Voitures Retourner</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th>Num_reg</th>
                        <th>Date de retour</th>
                        <th>Retard</th>
                        <th>Amende</th>
                    </tr>
                </thead>
                <tbody>
                    <% ReturnDAO returnDAO = new ReturnDAO(DBConnect.getConn());
                       List<Return> list = returnDAO.getReturns();
                       for (Return ret : list) { %>
                        <tr>
                            <td><%= ret.getNumReg() %></td>
                            <td><%= ret.getReturnDate() %></td>
                            <td><%= ret.getRetard() %></td>
                            <td><%= ret.getAmende() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
