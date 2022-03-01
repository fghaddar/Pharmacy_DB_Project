package com.csumb.cst363;

public class ReportElement1 {
	
	private String name;
	private int quantity;
	

	public ReportElement1(String name, int quantity) {
		super();
		this.name = name;
		this.quantity = quantity;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "Drug [name=" + name + ", quantity=" + quantity + "]";
	}
	
	

}
