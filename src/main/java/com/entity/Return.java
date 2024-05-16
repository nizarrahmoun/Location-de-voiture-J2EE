package com.entity;

public class Return {
    private String numReg;
    private String customerName;
    private String returnDate;
    private int retard;
    private double amende;

    // Default constructor
    public Return() {}

    // Parameterized constructor
    public Return(String numReg, String returnDate, int retard, double amende) {
        this.numReg = numReg;
        this.returnDate = returnDate;
        this.retard = retard;
        this.amende = amende;
    }

    // Getters and setters

    public String getNumReg() {
        return numReg;
    }

    public void setNumReg(String numReg) {
        this.numReg = numReg;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }

    public int getRetard() {
        return retard;
    }

    public void setRetard(int retard) {
        this.retard = retard;
    }

    public double getAmende() {
        return amende;
    }

    public void setAmende(double amende) {
        this.amende = amende;
    }
}
