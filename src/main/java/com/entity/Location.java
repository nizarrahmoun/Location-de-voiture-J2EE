package com.entity;

import java.util.Date;

public class Location {
	private String num_reg;
	private String startDate;
	private String endDate;
	private String customerName;
	private double rentFee;

	public Location(String num_reg, String startDate, String endDate, String customerName, double rentFee) {
		super();
		this.num_reg = num_reg;
		this.startDate = startDate;
		this.endDate = endDate;
		this.customerName = customerName;
		this.rentFee = rentFee;
	}

	public Location() {
	}

	public String getNumReg() {
		return num_reg;
	}

	public void setNumReg(String num_reg) {
		this.num_reg = num_reg;
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

	public double getReturnFee() {
		return rentFee;
	}

	public void setReturnFee(double returnFee) {
		this.rentFee = returnFee;
	}
}
