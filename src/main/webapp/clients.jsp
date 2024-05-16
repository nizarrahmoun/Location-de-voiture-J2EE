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
    <title>Client Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/admin/navbar.jsp"%>
        <c:if test="${empty adminObj}">
            <c:redirect url="../admin_login.jsp"></c:redirect>
        </c:if>
    <div class="container">
        <div class="container">
            <h1 class="mt-5">Client Management</h1>
            
            <!-- Display existing clients -->
            <h2 class="mt-5">Existing Clients:</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Client ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
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
                            <button class="btn btn-warning" onclick="populateForm('<%= client.getId() %>', '<%= client.getName() %>', '<%= client.getEmail() %>', '<%= client.getPhone() %>')">Update</button>
                            <form action="delete_client" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= client.getId() %>">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <!-- Add or Update a client form -->
            <h2 class="mt-5">Add New Client:</h2>
            <form action="update_client" method="post">
                <input type="hidden" id="client_id" name="client_id">
                <input type="hidden" id="isUpdate" name="isUpdate" value="false">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone:</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>
                <button type="submit" class="btn btn-primary" id="submit-btn">Add Client</button>
            </form>
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
        }
    </script>
</body>
</html>
