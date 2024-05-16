package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Return;

public class ReturnDAO {

    private Connection conn;

    public ReturnDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to add a return record
    public boolean addReturn(Return ret) {
        boolean success = false;
        try {
            String sql = "INSERT INTO returntbl(num_reg, returnDate, retard, amende) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ret.getNumReg());
            ps.setString(2, ret.getReturnDate());
            ps.setInt(3, ret.getRetard());
            ps.setDouble(4, ret.getAmende());
            int rowsAffected = ps.executeUpdate();
            
            updateStatusCar(ret.getNumReg());
            
            updateLocationStat(ret.getNumReg());
            
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method to get all return records
    public List<Return> getReturns() {
        List<Return> returnsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM returntbl";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Return ret = new Return();
                ret.setNumReg(rs.getString("num_reg"));
                ret.setReturnDate(rs.getString("returnDate"));
                ret.setRetard(rs.getInt("retard"));
                ret.setAmende(rs.getDouble("amende"));
                returnsList.add(ret);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return returnsList;
    }
    
    public Boolean updateStatusCar(String num_reg) throws SQLException {
    	String updateCarStatusSql = "UPDATE carstbl SET status = 'Disponible' WHERE num_reg = ?";
        PreparedStatement psUpdate = conn.prepareStatement(updateCarStatusSql);
        psUpdate.setString(1, num_reg);
        psUpdate.executeUpdate();
    	return false;
    }
    
    public Boolean updateLocationStat(String num_reg) throws SQLException {
    	String updateCarStatusSql = "DELETE FROM locationtbl WHERE num_reg = ?";
        PreparedStatement psUpdate = conn.prepareStatement(updateCarStatusSql);
        psUpdate.setString(1, num_reg);
        psUpdate.executeUpdate();
    	return false;
    }
    
}
