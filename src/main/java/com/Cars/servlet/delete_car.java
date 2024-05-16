package com.Cars.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.dao.CarsDAO;
import com.db.DBConnect;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/delete_car")
public class delete_car extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String num_reg = request.getParameter("num_reg");
            CarsDAO carDAO = new CarsDAO(DBConnect.getConn());

            if (carDAO.deleteCar(num_reg)) {
                // Car deleted successfully, redirect to a confirmation page or list page
                response.sendRedirect("cars.jsp");
            } else {
                // Handle error, maybe show an error message to the user
                response.getWriter().println("Error deleting car");
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
    
