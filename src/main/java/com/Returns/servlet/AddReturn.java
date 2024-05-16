package com.Returns.servlet;

import java.io.IOException;
import java.sql.Date;

import com.dao.ReturnDAO;
import com.db.DBConnect;
import com.entity.Return;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add_return")
public class AddReturn extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form parameters
            String numReg = request.getParameter("num_reg");
            String returnDate = request.getParameter("returnDate");
            int retard = Integer.parseInt(request.getParameter("retard"));
            double amende = Double.parseDouble(request.getParameter("amende"));

            // Create a new Return object
            Return ret = new Return(numReg, returnDate, retard, amende);
            ReturnDAO returnDAO = new ReturnDAO(DBConnect.getConn());
            
            if (returnDAO.addReturn(ret)) {
                // Return added successfully, redirect to a confirmation page or list page
                response.sendRedirect("returns.jsp");
            } else {
                response.getWriter().println("Error adding return");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
