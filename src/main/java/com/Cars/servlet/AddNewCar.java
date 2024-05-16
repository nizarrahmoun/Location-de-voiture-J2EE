package com.Cars.servlet;

import java.io.IOException;
<<<<<<< HEAD
=======
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa

import com.dao.CarsDAO;
import com.db.DBConnect;
import com.entity.Cars;

<<<<<<< HEAD
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add_car")
public class AddNewCar extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String num_reg = request.getParameter("num_reg");
			String brand = request.getParameter("brand");
			String model = request.getParameter("model");
			String status = request.getParameter("status");
			double price = Double.parseDouble(request.getParameter("price"));

			Cars car = new Cars(num_reg, brand, model, status, price);
			CarsDAO carDAO = new CarsDAO(DBConnect.getConn());

			if (carDAO.addCar(car)) {
				// Car added successfully, redirect to a confirmation page or list page
				response.sendRedirect("cars.jsp");
			} else {
				// Handle error, maybe show an error message to the user
				// You can forward to an error page or display a message in the same page
				response.getWriter().println("Error adding car");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
=======
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/add_car")
public class AddNewCar extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	try {
        String num_reg = request.getParameter("num_reg");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String status = request.getParameter("status");
        double price = Double.parseDouble(request.getParameter("price"));
        
        Cars car = new Cars(num_reg, brand, model, status, price);
        CarsDAO carDAO = new CarsDAO(DBConnect.getConn());

        if (carDAO.addCar(car)) {
            // Car added successfully, redirect to a confirmation page or list page
            response.sendRedirect("cars.jsp");
        } else {
            // Handle error, maybe show an error message to the user
            // You can forward to an error page or display a message in the same page
            response.getWriter().println("Error adding car");
        }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa

}
