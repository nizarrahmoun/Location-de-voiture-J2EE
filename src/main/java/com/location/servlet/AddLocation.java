package com.location.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.dao.LocationDAO; // Import your LocationsDAO class
import com.db.DBConnect; // Import your DBConnect class
import com.entity.Location; // Import your Locations class

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add_location")
public class AddLocation extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form parameters
            String carReg = request.getParameter("carReg");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String customerName = request.getParameter("customerName");
            double rentFee = Double.parseDouble(request.getParameter("rentFee"));

            // Add the location to the database
            Location location = new Location (carReg, startDate, endDate, customerName, rentFee);
            LocationDAO locationDAO = new LocationDAO(DBConnect.getConn());

            if (locationDAO.addLocation(location)) {
                // Car added successfully, redirect to a confirmation page or list page
                response.sendRedirect("location.jsp");
            } else {
                
                response.getWriter().println("Error adding location");
            }
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
    }
}
