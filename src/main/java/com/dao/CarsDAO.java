package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cars;

public class CarsDAO {
<<<<<<< HEAD

=======
	
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa
	private static Connection conn;

	public CarsDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCar(Cars car) {
		boolean success = false;
		try {
			String sql = "INSERT INTO carstbl(num_reg, brand, model, status, price) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, car.getNum_reg());
			ps.setString(2, car.getBrand());
			ps.setString(3, car.getModel());
			ps.setString(4, car.getStatus());
			ps.setDouble(5, car.getPrice());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}
<<<<<<< HEAD

	public Cars getCarByRegNum(String num_reg) {
		Cars car = null;
		try {
			String sql = "SELECT * FROM carstbl WHERE num_reg = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, num_reg);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				car = new Cars();
				car.setNum_reg(rs.getString("num_reg"));
				car.setBrand(rs.getString("brand"));
				car.setModel(rs.getString("model"));
				car.setStatus(rs.getString("status"));
				car.setPrice(rs.getDouble("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return car;
	}
=======
	
	public Cars getCarByRegNum(String num_reg) {
        Cars car = null;
        try {
            String sql = "SELECT * FROM carstbl WHERE num_reg = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, num_reg);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                car = new Cars();
                car.setNum_reg(rs.getString("num_reg"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setStatus(rs.getString("status"));
                car.setPrice(rs.getDouble("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa

	public static List<Cars> getCars() {
		List<Cars> carsList = new ArrayList<>();
		try {
			String sql = "SELECT * FROM carstbl";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Cars car = new Cars();
				car.setNum_reg(rs.getString("num_reg"));
				car.setBrand(rs.getString("brand"));
				car.setModel(rs.getString("model"));
				car.setStatus(rs.getString("status"));
				car.setPrice(rs.getDouble("price"));
				carsList.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return carsList;
	}

	public boolean updateCar(Cars car) {
		boolean success = false;
		try {
<<<<<<< HEAD
			String sql = "UPDATE carstbl SET num_reg = ?, brand = ?, model = ?, status = ?, price = ? WHERE id = ?";
=======
			String sql = "UPDATE carstbl SET num_reg = ?, brand = ?, model = ?, status = ?, price = ? WHERE num_reg = ?";
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, car.getNum_reg());
			ps.setString(2, car.getBrand());
			ps.setString(3, car.getModel());
			ps.setString(4, car.getStatus());
			ps.setDouble(5, car.getPrice());
<<<<<<< HEAD
=======
			ps.setString(6, car.getNum_reg());
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

	public boolean deleteCar(String num_reg) {
		boolean success = false;
		try {
			String sql = "DELETE FROM carstbl WHERE num_reg = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, num_reg);

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
