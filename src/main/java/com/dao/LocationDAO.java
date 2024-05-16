package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Location;

public class LocationDAO {

	private Connection conn;

	public LocationDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean addLocation(Location location) {
		boolean success = false;
		PreparedStatement ps = null;
		try {
			String sql = "INSERT INTO locationtbl(num_reg, startDate, endDate, customerName, rentFee) VALUES (?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location.getNumReg());
			ps.setString(2, location.getStartDate());
			ps.setString(3, location.getEndDate());
			ps.setString(4, location.getCustomerName());
			ps.setDouble(5, location.getRentFee());

			int rowsAffected = ps.executeUpdate();
			updateStatusCar(location.getNumReg());
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public boolean updateLocation(Location location) {
		boolean success = false;
		PreparedStatement ps = null;
		try {
			String sql = "UPDATE locationtbl SET startDate=?, endDate=?, customerName=?, rentFee=? WHERE num_reg=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location.getStartDate());
			ps.setString(2, location.getEndDate());
			ps.setString(3, location.getCustomerName());
			ps.setDouble(4, location.getRentFee());
			ps.setString(5, location.getNumReg());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public Boolean updateStatusCar(String num_reg) throws SQLException {
		String updateCarStatusSql = "UPDATE carstbl SET status = 'Réservée' WHERE num_reg = ?";
		PreparedStatement psUpdate = conn.prepareStatement(updateCarStatusSql);
		psUpdate.setString(1, num_reg);
		psUpdate.executeUpdate();
		return false;
	}

	public boolean deleteLocation(String locationId) {
		boolean success = false;
		PreparedStatement ps = null;
		try {
			String sql = "DELETE FROM locationtbl WHERE num_reg = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, locationId);

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}

	public List<Location> getLocations() {
		List<Location> locationsList = new ArrayList<>();
		try {
			String sql = "SELECT * FROM locationtbl";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Location location = new Location();
				location.setNumReg(rs.getString("num_reg"));
				location.setStartDate(rs.getString("startDate"));
				location.setEndDate(rs.getString("endDate"));
				location.setCustomerName(rs.getString("customerName"));
				location.setRentFee(rs.getDouble("rentFee"));
				locationsList.add(location);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return locationsList;
	}

}