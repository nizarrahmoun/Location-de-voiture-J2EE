package com.location.servlet;

import java.io.IOException;

import com.dao.LocationDAO;
import com.db.DBConnect;
import com.entity.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update_location")
public class UpdateLocation extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String numReg = request.getParameter("carReg");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String customerName = request.getParameter("customerName");
			double rentFee = Double.parseDouble(request.getParameter("rentFee"));
			boolean isUpdate = Boolean.parseBoolean(request.getParameter("isUpdate"));

			Location location = new Location(numReg, startDate, endDate, customerName, rentFee);
			LocationDAO locationDAO = new LocationDAO(DBConnect.getConn());

			if (isUpdate) {
				if (locationDAO.updateLocation(location)) {
					response.sendRedirect("location.jsp");
				} else {
					response.getWriter().println("Error updating location");
				}
			} else {
				if (locationDAO.addLocation(location)) {
					response.sendRedirect("location.jsp");
				} else {
					response.getWriter().println("Error adding location");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}