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
    <title>Car Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="/admin/navbar.jsp"%>
        <c:if test="${empty adminObj }">
            <c:redirect url="../admin_login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <h1 class="mt-5">Car Management</h1>
            
            <!-- Display existing cars -->
            <h2 class="mt-5">Existing Cars:</h2>
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
                            <button class="btn btn-warning" onclick="populateForm('<%= c.getNum_reg() %>', '<%= c.getBrand() %>', '<%= c.getModel() %>', '<%= c.getStatus() %>', '<%= c.getPrice() %>')">Update</button>
                            <form action="delete_car" method="post" style="display:inline;">
                                <input type="hidden" name="num_reg" value="<%= c.getNum_reg() %>">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <!-- Add a new car form -->
            <h2 class="mt-5" id="form-title">Add New Car:</h2>
            <form action="update_car" method="post" id="car-form">
                <input type="hidden" id="is-update" name="isUpdate" value="false">
                <div class="mb-3">
                    <label for="num_reg" class="form-label">Registration Number:</label>
                    <input type="text" class="form-control" name="num_reg" id="num_reg">
                </div>
                <div class="mb-3">
                    <label for="brand" class="form-label">Brand:</label>
                    <input type="text" class="form-control" name="brand" id="brand">
                </div>
                <div class="mb-3">
                    <label for="model" class="form-label">Model:</label>
                    <input type="text" class="form-control" name="model" id="model">
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status:</label>
                    <input type="text" class="form-control" name="status" id="status">
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price:</label>
                    <input type="text" class="form-control" name="price" id="price">
                </div>
                <button type="submit" class="btn btn-primary" id="submit-btn">Add Car</button>
            </form>
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
    </div>
</body>
</html>
