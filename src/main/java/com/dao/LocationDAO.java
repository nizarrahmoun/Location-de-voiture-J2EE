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
            String sql = "INSERT INTO locationtbl(num_reg, startDate, endDate, customerName, returnFee) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, location.getNumReg());
            ps.setString(2, location.getStartDate());
            ps.setString(3, location.getEndDate());
            ps.setString(4, location.getCustomerName());
            ps.setDouble(5, location.getReturnFee());

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

	/*
	 * public List<Location> getLocations() { List<Location> locationsList = new
	 * ArrayList<>(); PreparedStatement ps = null; ResultSet rs = null; try { String
	 * sql = "SELECT * FROM locationtbl"; ps = conn.prepareStatement(sql); rs =
	 * ps.executeQuery(); while (rs.next()) { Location location = new Location();
	 * location.setNumReg(rs.getString("num_reg"));
	 * location.setStartDate(rs.getDate("startDate"));
	 * location.setEndDate(rs.getDate("endDate"));
	 * location.setCustomerName(rs.getString("customerName"));
	 * location.setReturnFee(rs.getDouble("returnFee"));
	 * locationsList.add(location); } } catch (SQLException e) {
	 * e.printStackTrace(); } finally { try { if (rs != null) { rs.close(); } if (ps
	 * != null) { ps.close(); } } catch (SQLException e) { e.printStackTrace(); } }
	 * return locationsList; }
	 */
}
