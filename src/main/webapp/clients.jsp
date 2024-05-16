<%@page import="java.util.List"%>
<%@page import="com.entity.Clients"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.ClientsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des clients</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/admin/navbar.jsp"%>
<c:if test="${empty adminObj}">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>
<div class="container mt-5">
    <h1>Gestion des clients</h1>
    <div class="row mt-4">
        <!-- Form Column -->
        <div class="col-md-4">
            <h2 id="form-title">Ajouter un client:</h2>
            <form action="update_client" method="post" id="client-form">
                <input type="hidden" id="client_id" name="client_id">
                <input type="hidden" id="isUpdate" name="isUpdate" value="false">
                <div class="mb-3">
                    <label for="name" class="form-label">Nom:</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Téléphone:</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>
                <button type="submit" class="btn btn-primary" id="submit-btn">Ajouter</button>
            </form>
        </div>
        <!-- Table Column -->
        <div class="col-md-8">
            <h2>Clients existants:</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Client ID</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Téléphone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    ClientsDAO clientsDAO = new ClientsDAO(DBConnect.getConn());
                    List<Clients> clientsList = clientsDAO.getClients();
                    for(Clients client : clientsList) {
                    %>
                    <tr>
                        <td><%= client.getId() %></td>
                        <td><%= client.getName() %></td>
                        <td><%= client.getEmail() %></td>
                        <td><%= client.getPhone() %></td>
                        <td>
                            <button class="btn btn-warning" onclick="populateForm('<%= client.getId() %>', '<%= client.getName() %>', '<%= client.getEmail() %>', '<%= client.getPhone() %>')">Modifier</button>
                            <form action="delete_client" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= client.getId() %>">
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
    function populateForm(id, name, email, phone) {
        document.getElementById('client_id').value = id;
        document.getElementById('name').value = name;
        document.getElementById('email').value = email;
        document.getElementById('phone').value = phone;
        document.getElementById('isUpdate').value = "true";
        document.getElementById('submit-btn').innerText = "Update Client";
        document.getElementById('form-title').innerText = "Update Client:";
    }
</script>
</body>
</html>
