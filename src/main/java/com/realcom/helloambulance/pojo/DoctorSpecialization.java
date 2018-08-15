package com.realcom.helloambulance.pojo;

public class DoctorSpecialization {
	private Integer doctor_specialization_id;
	private String  doctor_specialization_type;
	private String doctor_degree_id;

	public String getDoctor_degree_id() {
		return doctor_degree_id;
	}

	public void setDoctor_degree_id(String doctor_degree_id) {
		this.doctor_degree_id = doctor_degree_id;
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
	@Override
	public String toString() {
		return "DoctorSpecialization [doctor_specialization_id=" + doctor_specialization_id
				+ ", doctor_specialization_type=" + doctor_specialization_type + ", doctor_degree_id="
				+ doctor_degree_id + "]";
	}


}
