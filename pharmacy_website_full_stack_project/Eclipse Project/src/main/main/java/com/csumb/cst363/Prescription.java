package com.csumb.cst363;


public class Prescription {
	
	private String rxid;  // primary key
	private String drugName;
	private int quantity;
	private String patient_ssn;
	private String patientName;
	private String doctor_ssn;
	private String doctorName;
	private String pharmacyID;   // pharmacy fields will be null or blank if no pharmacy has been chosen
	private String pharmacyAddress;
	private String pharmacyPhone;
	private String pharmacyName;
	private String dateFilled;   // this field is blank or null if prescription has not been filled
	private double price;
	
	
	public String getRxid() {
		return rxid;
	}
	public void setRxid(String rxid) {
		this.rxid = rxid;
	}
	public String getDrugName() {
		return drugName;
	}
	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPatient_ssn() {
		return patient_ssn;
	}
	public void setPatient_ssn(String patient_ssn) {
		this.patient_ssn = patient_ssn;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getDoctor_ssn() {
		return doctor_ssn;
	}
	public void setDoctor_ssn(String doctor_ssn) {
		this.doctor_ssn = doctor_ssn;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getPharmacyID() {
		return pharmacyID;
	}
	public void setPharmacyID(String pharmacyID) {
		this.pharmacyID = pharmacyID;
	}
	public String getPharmacyAddress() {
		return pharmacyAddress;
	}
	public void setPharmacyAddress(String pharmacyAddress) {
		this.pharmacyAddress = pharmacyAddress;
	}
	public String getPharmacyPhone() {
		return pharmacyPhone;
	}
	public void setPharmacyPhone(String pharmacyPhone) {
		this.pharmacyPhone = pharmacyPhone;
	}
	public String getPharmacyName() {
		return pharmacyName;
	}
	public void setPharmacyName(String pharmacyName) {
		this.pharmacyName = pharmacyName;
	}
	public String getDateFilled() {
		return dateFilled;
	}
	public void setDateFilled(String dateFilled) {
		this.dateFilled = dateFilled;
	}
	public double  getCost() {
		return price;
	}
	public void setCost(double cost) {
		this.price = ((int)(cost*100+0.5))/100.0;
	}
	
	@Override
	public String toString() {
		return "Prescription [rxid=" + rxid + ", drugName=" + drugName + ", quantity=" + quantity + ", patient_ssn="
				+ patient_ssn + ", patientName=" + patientName + ", doctor_ssn=" + doctor_ssn + ", doctorName="
				+ doctorName + ", pharmacyID=" + pharmacyID + ", pharmacyAddress=" + pharmacyAddress + ", pharmacyName="
				+ pharmacyName + ", dateFilled=" + dateFilled + ", cost="+price+"]";
	}

}
