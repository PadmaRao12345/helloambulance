package com.realcom.helloambulance.pojo;

public class DoctorSpecailization {
	
	private int doctor_specialization_id;
	private String doctor_specialization_type;
	private int  doctor_degree_id;
	private String Status;
	
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public int getDoctor_specialization_id() {
		return doctor_specialization_id;
	}
	public void setDoctor_specialization_id(int doctor_specialization_id) {
		this.doctor_specialization_id = doctor_specialization_id;
	}
	public String getDoctor_specialization_type() {
		return doctor_specialization_type;
	}
	public void setDoctor_specialization_type(String doctor_specialization_type) {
		this.doctor_specialization_type = doctor_specialization_type;
	}
	public int getDoctor_degree_id() {
		return doctor_degree_id;
	}
	public void setDoctor_degree_id(int doctor_degree_id) {
		this.doctor_degree_id = doctor_degree_id;
	}
	@Override
	public String toString() {
		return "DoctorSpecailization [doctor_specialization_id=" + doctor_specialization_id
				+ ", doctor_specialization_type=" + doctor_specialization_type + ", doctor_degree_id="
				+ doctor_degree_id + ", Status="+Status+"]";
	}

}
