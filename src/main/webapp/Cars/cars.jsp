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
                    <th>Car ID</th>
                    <th>Model</th>
                    <th>Make</th>
                    <th>Year</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over cars using JSTL -->
                <c:forEach items="${cars}" var="car">
                    <tr>
                        <td>${car.id}</td>
                        <td>${car.model}</td>
                        <td>${car.make}</td>
                        <td>${car.year}</td>
                        <td>
                            <a href="editCar.jsp?id=${car.id}" class="btn btn-primary btn-sm">Edit</a>
                            <a href="deleteCar.jsp?id=${car.id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <!-- Add a new car form -->
        <h2 class="mt-5">Add New Car:</h2>
        <form action="addCar.jsp" method="post">
            <div class="mb-3">
                <label for="model" class="form-label">Model:</label>
                <input type="text" class="form-control" id="model" name="model">
            </div>
            <div class="mb-3">
                <label for="make" class="form-label">Make:</label>
                <input type="text" class="form-control" id="make" name="make">
            </div>
            <div class="mb-3">
                <label for="year" class="form-label">Year:</label>
                <input type="text" class="form-control" id="year" name="year">
            </div>
            <button type="submit" class="btn btn-primary">Add Car</button>
        </form>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
