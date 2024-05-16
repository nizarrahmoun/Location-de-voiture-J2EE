package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Clients;

public class ClientsDAO {

	private static Connection conn;

	public ClientsDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addClient(Clients client) {
		boolean success = false;
		try {
			String sql = "INSERT INTO clientstbl(name, email, phone) VALUES (?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, client.getName());
			ps.setString(2, client.getEmail());
			ps.setString(3, client.getPhone());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

	public List<Clients> getClients() {
		List<Clients> clientsList = new ArrayList<>();
		try {
			String sql = "SELECT * FROM clientstbl";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Clients client = new Clients();
				client.setId(rs.getInt("id"));
				client.setName(rs.getString("name"));
				client.setEmail(rs.getString("email"));
				client.setPhone(rs.getString("phone"));
				clientsList.add(client);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clientsList;
	}

	public boolean updateClient(Clients client) {
		boolean success = false;
		try {
			String sql = "UPDATE clientstbl SET name = ?, email = ?, phone = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, client.getName());
			ps.setString(2, client.getEmail());
			ps.setString(3, client.getPhone());
			ps.setInt(4, client.getId());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

	public boolean deleteClient(int id) {
		boolean success = false;
		try {
			String sql = "DELETE FROM clientstbl WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

}
