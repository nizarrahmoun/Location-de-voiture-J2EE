<%@page import="java.util.List"%>
<%@page import="com.entity.Cars"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CarsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Voitures</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<%@ include file="/admin/navbar.jsp"%>
<c:if test="${empty adminObj }">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>
<div class="container mt-5">
    <h1>Gestion des Voitures</h1>
    <div class="row mt-4">
        <!-- Form Column -->
        <div class="col-md-4">
            <h2 id="form-title">Ajouter Voiture:</h2>
            <form action="update_car" method="post" id="car-form">
                <input type="hidden" id="is-update" name="isUpdate" value="false">
                <div class="mb-3">
                    <label for="num_reg" class="form-label">Numéro d'immatriculation:</label>
                    <input type="text" class="form-control" name="num_reg" id="num_reg">
                </div>
                <div class="mb-3">
                    <label for="brand" class="form-label">Marque:</label>
                    <input type="text" class="form-control" name="brand" id="brand">
                </div>
                <div class="mb-3">
                    <label for="model" class="form-label">Modèle:</label>
                    <input type="text" class="form-control" name="model" id="model">
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status:</label>
                    <select class="form-select" name="status" id="status">
                        <option value="Disponible">Disponible</option>
                        <option value="Réservée">Réservée</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Prix:</label>
                    <input type="text" class="form-control" name="price" id="price">
                </div>
                <button type="submit" class="btn btn-primary" id="submit-btn">Ajouter</button>
            </form>
        </div>
        <!-- Table Column -->
        <div class="col-md-8">
            <h2>Voitures existantes:</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Reg_num</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Status</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    CarsDAO carDAO = new CarsDAO(DBConnect.getConn());
                    List<Cars> list = carDAO.getCars();
                    for (Cars c : list) { %>
                    <tr>
                        <td><%= c.getNum_reg() %></td>
                        <td><%= c.getBrand() %></td>
                        <td><%= c.getModel() %></td>
                        <td><%= c.getStatus() %></td>
                        <td><%= c.getPrice() %></td>
                        <td>
                            <button class="btn btn-warning" onclick="populateForm('<%= c.getNum_reg() %>', '<%= c.getBrand() %>', '<%= c.getModel() %>', '<%= c.getStatus() %>', '<%= c.getPrice() %>')">Modifier</button>
                            <form action="delete_car" method="post" style="display:inline;">
                                <input type="hidden" name="num_reg" value="<%= c.getNum_reg() %>">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function populateForm(num_reg, brand, model, status, price) {
        document.getElementById('num_reg').value = num_reg;
        document.getElementById('brand').value = brand;
        document.getElementById('model').value = model;
        document.getElementById('status').value = status;
        document.getElementById('price').value = price;
        document.getElementById('is-update').value = "true";
        document.getElementById('form-title').innerText = "Update Car:";
        document.getElementById('submit-btn').innerText = "Update Car";
    }
</script>
</body>
</html>
