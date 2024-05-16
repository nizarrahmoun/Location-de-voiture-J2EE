package com.location;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dao.LocationDAO;
import com.db.DBConnect;
import com.entity.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add_location")
public class AddLocation extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String carReg = request.getParameter("carReg");
			String startDateStr = request.getParameter("startDate");
			String endDateStr = request.getParameter("endDate");
			String customerName = request.getParameter("customerName");
			double returnFee = Double.parseDouble(request.getParameter("returnFee"));

			// Convertir les dates de String en java.util.Date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = sdf.parse(startDateStr);
			Date endDate = sdf.parse(endDateStr);

			// Créer une nouvelle instance de Location
			Location location = new Location(carReg, startDate, endDate, customerName, returnFee);
			LocationDAO locationDAO = new LocationDAO(DBConnect.getConn());

			if (locationDAO.addLocation(location)) {
				// Location added successfully, redirect to a confirmation page or list page
				response.sendRedirect("locations.jsp");
			} else {
				// Handle error, maybe show an error message to the user
				// You can forward to an error page or display a message in the same page
				response.getWriter().println("Error adding location");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
