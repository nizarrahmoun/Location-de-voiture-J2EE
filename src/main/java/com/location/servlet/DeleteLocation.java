package com.location.servlet;

import java.io.IOException;

import com.dao.LocationDAO;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete_location")
public class DeleteLocation extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String numReg = request.getParameter("carReg");

			LocationDAO locationDAO = new LocationDAO(DBConnect.getConn());
			boolean success = locationDAO.deleteLocation(numReg);

			if (success) {
				response.sendRedirect("location.jsp");
			} else {
				response.getWriter().println("Error deleting location");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
