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
                    <th>model</th>
                    <th>Status</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                CarsDAO car=new CarsDAO(DBConnect.getConn());
                List<Cars> list=car.getCars();
                for(Cars c:list){%>
                <tr>
                <td><%=c.getNum_reg() %></td>
                <td><%=c.getBrand() %></td>
                <td><%=c.getModel() %></td>
                <td><%=c.getStatus() %></td>
                <td><%=c.getPrice() %></td>
                <tr>
                <%} %>
                
            </tbody>
        </table>
        
        <!-- Add a new car form -->
        <h2 class="mt-5">Add New Car:</h2>
        <form action="add_car" method="post">
            <div class="mb-3">
                <label for="num_reg" class="form-label">Registration Number:</label>
                <input type="text" class="form-control" name="num_reg">
            </div>
            <div class="mb-3">
                <label for="brand" class="form-label">Brand:</label>
                <input type="text" class="form-control"  name="brand">
            </div>
            <div class="mb-3">
                <label for="model" class="form-label">Model:</label>
                <input type="text" class="form-control" name="model">
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status:</label>
                <input type="text" class="form-control"  name="status">
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price:</label>
                <input type="text" class="form-control" id="price" name="price">
            </div>
            <button type="submit" class="btn btn-primary">Add Car</button>
        </form>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
