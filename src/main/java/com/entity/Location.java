package com.entity;

public class Location {
	private String numReg;
	private String startDate;
	private String endDate;
	private String customerName;
	private double rentFee;

	public Location(String numReg, String startDate, String endDate, String customerName, double rentFee) {
		this.numReg = numReg;
		this.startDate = startDate;
		this.endDate = endDate;
		this.customerName = customerName;
		this.rentFee = rentFee;
	}

	public Location() {
	}

	public String getNumReg() {
		return numReg;
	}

	public void setNumReg(String numReg) {
		this.numReg = numReg;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public double getRentFee() {
		return rentFee;
	}

	public void setRentFee(double rentFee) {
		this.rentFee = rentFee;
	}
}
