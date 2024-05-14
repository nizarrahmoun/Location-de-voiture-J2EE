package com.user.servlet;

import java.io.IOException;

import com.dao.CarsDAO;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Cars;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddCar")

public class AddCar extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
	        String num_reg = req.getParameter("num_reg");
	        String brand = req.getParameter("brand");
	        String model = req.getParameter("model");
	        String status = req.getParameter("status");
	        double price = Double.parseDouble(req.getParameter("price"));
	        
	        Cars car = new Cars(num_reg, brand, model, status, price);
	        CarsDAO carDAO = new CarsDAO(DBConnect.getConn());

	        if (carDAO.addCar(car)) {
	            // Car added successfully, redirect to a confirmation page or list page
	            resp.sendRedirect("cars.jsp");
	        } else {
	            // Handle error, maybe show an error message to the user
	            // You can forward to an error page or display a message in the same page
	            resp.getWriter().println("Error adding car");
	        }
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	}
}
