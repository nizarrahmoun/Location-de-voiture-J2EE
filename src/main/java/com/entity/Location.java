package com.entity;

import java.util.Date;

public class Location {
	private String num_reg;
	private Date startDate;
	private Date endDate;
	private String customerName;
	private double returnFee;

	public Location(String num_reg, Date startDate, Date endDate, String customerName, double returnFee) {
		super();
		this.num_reg = num_reg;
		this.startDate = startDate;
		this.endDate = endDate;
		this.customerName = customerName;
		this.returnFee = returnFee;
	}

	public Location() {
	}

	public String getNumReg() {
		return num_reg;
	}

	public void setNumReg(String num_reg) {
		this.num_reg = num_reg;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public double getReturnFee() {
		return returnFee;
	}

	public void setReturnFee(double returnFee) {
		this.returnFee = returnFee;
	}
}
