package com.entity;

<<<<<<< HEAD
public class Location {
	private String numReg;
=======
import java.util.Date;

public class Location {
	private String num_reg;
>>>>>>> 7cdad6e9f6d19c82f20a33a4fd3d8b3899ee547d
	private String startDate;
	private String endDate;
	private String customerName;
	private double rentFee;

<<<<<<< HEAD
	public Location(String numReg, String startDate, String endDate, String customerName, double rentFee) {
		this.numReg = numReg;
=======
	public Location(String num_reg, String startDate, String endDate, String customerName, double rentFee) {
		super();
		this.num_reg = num_reg;
>>>>>>> 7cdad6e9f6d19c82f20a33a4fd3d8b3899ee547d
		this.startDate = startDate;
		this.endDate = endDate;
		this.customerName = customerName;
		this.rentFee = rentFee;
	}

	public Location() {
	}

	public String getNumReg() {
<<<<<<< HEAD
		return numReg;
	}

	public void setNumReg(String numReg) {
		this.numReg = numReg;
=======
		return num_reg;
	}

	public void setNumReg(String num_reg) {
		this.num_reg = num_reg;
>>>>>>> 7cdad6e9f6d19c82f20a33a4fd3d8b3899ee547d
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

<<<<<<< HEAD
	public double getRentFee() {
		return rentFee;
	}

	public void setRentFee(double rentFee) {
		this.rentFee = rentFee;
=======
	public double getReturnFee() {
		return rentFee;
	}

	public void setReturnFee(double returnFee) {
		this.rentFee = returnFee;
>>>>>>> 7cdad6e9f6d19c82f20a33a4fd3d8b3899ee547d
	}
}
