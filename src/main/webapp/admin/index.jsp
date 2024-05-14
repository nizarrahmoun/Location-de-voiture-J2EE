<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.point-card {
box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
<c:if test="${empty adminObj }">
<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="container p-5">
          <p class="text-center fs-3">Admin Dashboard</p>
           <c:if test="${not empty sucMsg }">
          <p class="text-center text-success fs-3">${succMsg}</p>
          <c:remove var="succMsg" scope="session"/>
          </c:if>
          <c:if test="${not empty errorMsg }">
          <p class="text-center text-danger fs-3">${errorMsg}</p>
          <c:remove var="errorMsg" scope="session"/>
          </c:if>
          <div class="row">
          <div class="col-md-4">
          <div class="card point-card">
          <div class="card-body text-center text-success">
          <i class="fas fa-user-md fa-3x"></i><br>
          <p class="fs-4 text-center">
          Car <br>5
          </p>
          </div>
          </div>
          </div>
          
          <div class="col-md-4">
          <div class="card point-card">
          <div class="card-body text-center text-success">
          <i class="fas fa-user-check fa-3x"></i><br>
          <p class="fs-4 text-center">
          User <br>43
          </p>
          </div>
          </div>
          </div>
          
          <div class="col-md-4">
          <div class="card point-card">
          <div class="card-body text-center text-success">
          <i class="far fa-calendar-check fa-3x"></i><br>
          <p class="fs-4 text-center">
          Booking <br>453
          </p>
          </div>
          </div>
          </div>
          
          <div class="col-md-4 mt-2">
          <div class="card point-card" data-bs-toggle="modal"
          data-bs-target="#exampleModal">
          <div class="card-body text-center text-success">
          <i class="far fa-calendar-check fa-3x"></i><br>
          <p class="fs-4 text-center">
          Returns <br>34
          </p>
          </div>
          </div>
          </div>
          
          </div>
</div>

</body>
</html>