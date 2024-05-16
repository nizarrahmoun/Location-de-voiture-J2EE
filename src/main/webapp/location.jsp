<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="/admin/navbar.jsp"%>

<div class="container">
    <h1 class="mt-5">Voitures disponibles pour location</h1>

    
    <table class="table">
        <thead>
        <tr>
            <th>Location ID</th>
            <th>Num_reg</th>
            <th>Nom du client</th>
            <th>Date de location</th>
            <th>Date de retour</th>
            <th>Frais de retour</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${locations}" var="location">
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h2 class="mt-5">Formulaire de location</h2>
    <form action="completeLocation.jsp" method="post">
        <div class="mb-3">
            <label for="carReg" class="form-label">Matricule de la voiture:</label>
            <input type="text" class="form-control" id="carReg" name="carReg" required>
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
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="customerName" class="form-label">Frais se retour:</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <button type="submit" class="btn btn-primary">Louer</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
