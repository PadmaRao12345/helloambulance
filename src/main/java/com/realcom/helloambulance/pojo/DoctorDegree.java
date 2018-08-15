package com.realcom.helloambulance.pojo;

public class DoctorDegree {
	private int doctor_degree_id;
	private String doctor_degree ;
	private String Status;
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	public int getDoctor_degree_id() {
		return doctor_degree_id;
	}
	public void setDoctor_degree_id(int doctor_degree_id) {
		this.doctor_degree_id = doctor_degree_id;
	}
	public String getDoctor_degree() {
		return doctor_degree;
	}
	public void setDoctor_degree(String doctor_degree) {
		this.doctor_degree = doctor_degree;
	}
	@Override
	public String toString() {
		return "DoctorDegree [doctor_degree_id=" + doctor_degree_id + ", doctor_degree=" + doctor_degree + ",Status="+ Status+"]";
	}
	
	
	
}
