package com.entity;

public class Cars {
	private String num_reg;
	private String brand;
	private String model;
	private String status;
	private double price;

	public Cars(String num_reg, String brand, String model, String status, double price) {
		super();
		this.num_reg = num_reg;
		this.brand = brand;
		this.model = model;
		this.status = status;
		this.price = price;
	}

	public Cars(String brand, String model, String status, double price) {
		super();
		this.brand = brand;
		this.model = model;
		this.status = status;
		this.price = price;
	}

	public Cars() {

	}

	public String getNum_reg() {
		return num_reg;
	}

	public void setNum_reg(String num_reg) {
		this.num_reg = num_reg;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
