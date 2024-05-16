package com.clients;

import java.io.IOException;

import com.dao.ClientsDAO;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete_client")
public class DeleteClient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id")); // Correction : Integer.parseInt() au lieu de
																	// Int.parseInt()
			ClientsDAO clientsDAO = new ClientsDAO(DBConnect.getConn());

			if (clientsDAO.deleteClient(id)) {
				response.sendRedirect("clients.jsp");
			} else {
				response.getWriter().println("Error deleting client");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
