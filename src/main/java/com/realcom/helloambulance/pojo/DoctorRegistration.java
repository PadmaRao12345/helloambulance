package com.realcom.helloambulance.pojo;

import java.util.Arrays;

public class DoctorRegistration {

	private int register_as_doctor_id;
	private int vendor_reg_id;
	private String doctor_name;
	private String email_id;
	private String password;
	private String gender;
	private String doctor_degree;
	private String doctor_specialization;
	private String hospitalname;
	private String experience;
	private String practice_location;
	private String address;
	private String country;
	private String state;
	private String city;
	private String pincode;
	private String date_of_register;
	private String status;
	private byte[] profilepicture;
	private String image;
	private String role;

	public int getRegister_as_doctor_id() {
		return register_as_doctor_id;
	}

	public void setRegister_as_doctor_id(int register_as_doctor_id) {
		this.register_as_doctor_id = register_as_doctor_id;
	}

	public int getVendor_reg_id() {
		return vendor_reg_id;
	}

	public void setVendor_reg_id(int vendor_reg_id) {
		this.vendor_reg_id = vendor_reg_id;
	}

	public String getDoctor_name() {
		return doctor_name;
	}

	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDoctor_degree() {
		return doctor_degree;
	}

	public void setDoctor_degree(String doctor_degree) {
		this.doctor_degree = doctor_degree;
	}

	public String getDoctor_specialization() {
		return doctor_specialization;
	}

	public void setDoctor_specialization(String doctor_specialization) {
		this.doctor_specialization = doctor_specialization;
	}

	public String getHospitalname() {
		return hospitalname;
	}

	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getPractice_location() {
		return practice_location;
	}

	public void setPractice_location(String practice_location) {
		this.practice_location = practice_location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getDate_of_register() {
		return date_of_register;
	}

	public void setDate_of_register(String date_of_register) {
		this.date_of_register = date_of_register;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public byte[] getProfilepicture() {
		return profilepicture;
	}

	public void setProfilepicture(byte[] profilepicture) {
		this.profilepicture = profilepicture;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "DoctorRegistration [register_as_doctor_id=" + register_as_doctor_id + ", vendor_reg_id=" + vendor_reg_id
				+ ", doctor_name=" + doctor_name + ", email_id=" + email_id + ", password=" + password + ", gender="
				+ gender + ", doctor_degree=" + doctor_degree + ", doctor_specialization=" + doctor_specialization
				+ ", hospitalname=" + hospitalname + ", experience=" + experience + ", practice_location="
				+ practice_location + ", address=" + address + ", country=" + country + ", state=" + state + ", city="
				+ city + ", pincode=" + pincode + ", date_of_register=" + date_of_register + ", status=" + status
				+ ", profilepicture=" + Arrays.toString(profilepicture) + ", image=" + image + ", role=" + role + "]";
	}

	

}