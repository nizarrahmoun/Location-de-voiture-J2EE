<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.point-card {
box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
<%@include file="component/navbar.jsp" %>

 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/imge2.jpg" class="d-block w-100" alt="..." height="600px">
            </div>
            <div class="carousel-item">
                <img src="img/imge3.jpg" class="d-block w-100" alt="..." height="600px">
            </div>
            <div class="carousel-item">
                <img src="img/imge4.jpg" class="d-block w-100" alt="..." height="600px">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

<div class="container p-3">
<p class="text-center fs-2">About Us</p>

<div class="row">
<div class="col-md-8 p-5">
<div class="row">
<div class="col-md-6">
<div class="card point-card">
<div class="card-body">
<p class="fs-5">Where Every Mile Matters</p>
<p>Embark on extraordinary adventures with our premium rental services.</p>
</div>
</div>
</div>
<div class="col-md-6">
<div class="card point-card">
<div class="card-body">
<p class="fs-5">Drive with Confidence</p>
<p>Experience peace of mind knowing our fleet is meticulously maintained for your safety.</p>
</div>
</div>
</div>
<div class="col-md-6 mt-2">
<div class="card point-card">
<div class="card-body">
<p class="fs-5">Tailored Travel Solutions</p>
<p>Find the perfect vehicle for your journey, whether it's a weekend getaway or a cross-country road trip.</p>
</div>
</div>
</div>
<div class="col-md-6 mt-2">
<div class="card point-card">
<div class="card-body">
<p class="fs-5">Your Road, Our Promise</p>
<p>Count on us to be your reliable partner, providing support and service throughout your travels.</p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-4">
<img alt="" src="img/3dcar.png" width="320px" height="400px" >
</div>
</div>
</div>

<hr>
<div class="container p-2">
<p class="text-center fs-2">Our Cars</p>
<div class="row">
<div class="col-md-3">
<div class="card point-card">
<div class="card-body text-center">
<img src="img/audicar.jpeg" width="250px" height="300px">
<p class="fw-bold fs-5">Audi</p>

</div>
</div>
</div>
<div class="col-md-3">
<div class="card point-card">
<div class="card-body text-center">
<img src="img/mercedescar.jpeg" width="250px" height="300px">
<p class="fw-bold fs-5">Mercedes</p>

</div>
</div>
</div>
<div class="col-md-3">
<div class="card point-card">
<div class="card-body text-center">
<img src="img/bmwcar.jpeg" width="250px" height="300px">
<p class="fw-bold fs-5">BMW</p>

</div>
</div>
</div>
<div class="col-md-3">
<div class="card point-card">
<div class="card-body text-center">
<img src="img/volvocar.jpeg" width="250px" height="300px">
<p class="fw-bold fs-5">Volvo</p>

</div>
</div>
</div>

</div>
</div>


<%@include file="component/footer.jsp" %>

</body>
</html>