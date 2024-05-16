package com.clients;

import java.io.IOException;

import com.dao.ClientsDAO;
import com.db.DBConnect;
import com.entity.Clients;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add_client")
public class AddClient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");

			Clients client = new Clients(name, email, phone);
			ClientsDAO clientsDAO = new ClientsDAO(DBConnect.getConn());

			if (clientsDAO.addClient(client)) {
				response.sendRedirect("clients.jsp");
			} else {
				response.getWriter().println("Error adding client");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
