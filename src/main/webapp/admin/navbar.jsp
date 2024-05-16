<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-brand {
            margin-right: 30px; /* Adjust as needed */
        }
        .navbar-nav {
            margin-left: auto; /* Align to the right */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" ><img alt="" src=""> Location voiture</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item me-3"><a class="nav-link active" href="/Car_rental/admin/index.jsp"><i class="fas fa-home"></i> HOME</a></li>
                    <li class="nav-item me-3"><a class="nav-link active" href="/Car_rental/cars.jsp"><i class="fas fa-car"></i> Voitures</a></li>
                    <li class="nav-item me-3"><a class="nav-link active" href="/Car_rental/clients.jsp"><i class="fas fa-person"></i> Clients</a></li>
                    <li class="nav-item me-3"><a class="nav-link active" href="/Car_rental/location.jsp"><i class="fas fa-calendar"></i> Location</a></li>
                    <li class="nav-item me-3"><a class="nav-link active" href="/Car_rental/returns.jsp"><i class="fas fa-calendar"></i> Retours</a></li>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
