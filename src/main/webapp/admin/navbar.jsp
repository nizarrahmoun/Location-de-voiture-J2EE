<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
    <a class="navbar-brand">
    <i class="fas fa-car"></i> Location voiture</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
    data-bs-target="#navbarSupportedContent"
    aria-controls="navbarSuportedContent" aria-expanded="false"
    aria-label="Toggle Navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
     <ul class="navbar-nav me-auto mb-2 mn-lg-0">
     <li class="nav-item"><a class="nav-link active" href="/Car_rental/admin/index.jsp"><i class="fas fa-home"></i>HOME</a></li>
     <li class="nav-item"><a class="nav-link active" href="/Car_rental/cars.jsp">Voitures</a></li>
     <li class="nav-item"><a class="nav-link active" href="/Car_rental/clients.jsp">Clients</a></li>
     <li class="nav-item"><a class="nav-link active" href="/Car_rental/location.jsp">Location</a></li>
     <li class="nav-item"><a class="nav-link active" href="patient.jsp">Retours</a></li>
     
    </ul>
    
    <form class="d-flex">
    <div class="dropdown">
    <button class="btn btn-light dropdown-toggle" type="button"
    id="dropdownMenuButton1" data-bs-toggle="dropdown"
    aria-expanded="false">Admin</button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
    </ul>
    </div>
    </form>
    </div>
    </div>
    </nav>