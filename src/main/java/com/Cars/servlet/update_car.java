package com.Cars.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.CarsDAO;
import com.db.DBConnect;
import com.entity.Cars;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/update_car")
public class update_car extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Retrieve parameters from the request
            String num_reg = request.getParameter("num_reg");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String status = request.getParameter("status");
            double price = Double.parseDouble(request.getParameter("price"));
<<<<<<< HEAD
=======
            boolean isUpdate = Boolean.parseBoolean(request.getParameter("isUpdate"));
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa
            
            // Create a Cars object with the updated details
            Cars car = new Cars(num_reg, brand, model, status, price);
            CarsDAO carDAO = new CarsDAO(DBConnect.getConn());

<<<<<<< HEAD
            // Call the updateCar method in CarsDAO
=======
            if (isUpdate) {
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa
            if (carDAO.updateCar(car)) {
                // Car updated successfully, redirect to a confirmation page or list page
                response.sendRedirect("cars.jsp");
            } else {
                // Handle error, maybe show an error message to the user
                // You can forward to an error page or display a message in the same page
                response.getWriter().println("Error updating car");
            }
<<<<<<< HEAD
=======
            }else {
            	if (carDAO.addCar(car)) {
					response.sendRedirect("cars.jsp");
				} else {
					response.getWriter().println("Error adding car");
				}
            }
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 1d5f215118529e5845e1d038bdd03299a5aa77aa
