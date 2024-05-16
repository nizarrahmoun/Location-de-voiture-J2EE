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

@WebServlet("/update_client")
public class UpdateClients extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// Récupérer les paramètres du formulaire
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			boolean isUpdate = Boolean.parseBoolean(request.getParameter("isUpdate"));

			ClientsDAO clientsDAO = new ClientsDAO(DBConnect.getConn());

			// Si l'action est une mise à jour
			if (isUpdate) {
				int id = Integer.parseInt(request.getParameter("client_id"));
				Clients client = new Clients(id, name, email, phone);

				if (clientsDAO.updateClient(client)) {
					response.sendRedirect("clients.jsp");
				} else {
					response.getWriter().println("Error updating client");
				}
			} else { // Sinon, ajouter un nouveau client
				Clients client = new Clients(name, email, phone);

				if (clientsDAO.addClient(client)) {
					response.sendRedirect("clients.jsp");
				} else {
					response.getWriter().println("Error adding client");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
