package com.realcom.helloambulance.pojo;

import java.util.Arrays;

//
public class AmbulanceRegistration {
	private int register_ambulance_id;
	private int vendor_reg_id;
	private String name;
	private String email_id;
	private String password;
	private String gender;
	private byte[] Profilepicture;
	private String ambulance_provider_name;
	private String organization_name;
	private String type_of_ambulance;
	private String purchesed_from;
	private String vechicle_model;
	private String vechicle_reg_no;
	private String vechicle_engine_no;
	private String vechicle_colour;
	private String equipments;
	private String address;
	private String country;
	private String state;
	private String city;
	private String pincode;
	private String date_of_register;
	private String status;
	private String image;
	private String role;
	private String mobile_no;
	
	public int getRegister_ambulance_id() {
		return register_ambulance_id;
	}
	public void setRegister_ambulance_id(int register_ambulance_id) {
		this.register_ambulance_id = register_ambulance_id;
	}
	public int getVendor_reg_id() {
		return vendor_reg_id;
	}
	public void setVendor_reg_id(int vendor_reg_id) {
		this.vendor_reg_id = vendor_reg_id;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public byte[] getProfilepicture() {
		return Profilepicture;
	}
	public void setProfilepicture(byte[] bs) {
		Profilepicture = bs;
	}

	public String getOrganization_name() {
		return organization_name;
	}
	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}
	public String getType_of_ambulance() {
		return type_of_ambulance;
	}
	public void setType_of_ambulance(String type_of_ambulance) {
		this.type_of_ambulance = type_of_ambulance;
	}
	public String getPurchesed_from() {
		return purchesed_from;
	}
	public void setPurchesed_from(String purchesed_from) {
		this.purchesed_from = purchesed_from;
	}
	public String getVechicle_model() {
		return vechicle_model;
	}
	public void setVechicle_model(String vechicle_model) {
		this.vechicle_model = vechicle_model;
	}
	public String getVechicle_reg_no() {
		return vechicle_reg_no;
	}
	public void setVechicle_reg_no(String vechicle_reg_no) {
		this.vechicle_reg_no = vechicle_reg_no;
	}
	public String getVechicle_engine_no() {
		return vechicle_engine_no;
	}
	public void setVechicle_engine_no(String vechicle_engine_no) {
		this.vechicle_engine_no = vechicle_engine_no;
	}
	public String getVechicle_colour() {
		return vechicle_colour;
	}
	public void setVechicle_colour(String vechicle_colour) {
		this.vechicle_colour = vechicle_colour;
	}
	public String getEquipments() {
		return equipments;
	}
	public void setEquipments(String equipments) {
		this.equipments = equipments;
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
	
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "AmbulanceRegistration [register_ambulance_id=" + register_ambulance_id + ", vendor_reg_id="
				+ vendor_reg_id + ", name=" + name + ", email_id=" + email_id + ", password=" + password + ", gender="
				+ gender + ", Profilepicture=" + Arrays.toString(Profilepicture) + ", ambulance_provider_name="
				+ ambulance_provider_name + ", organization_name=" + organization_name + ", type_of_ambulance="
				+ type_of_ambulance + ", purchesed_from=" + purchesed_from + ", vechicle_model=" + vechicle_model
				+ ", vechicle_reg_no=" + vechicle_reg_no + ", vechicle_engine_no=" + vechicle_engine_no
				+ ", vechicle_colour=" + vechicle_colour + ", equipments=" + equipments + ", address=" + address
				+ ", country=" + country + ", state=" + state + ", city=" + city + ", pincode=" + pincode
				+ ", date_of_register=" + date_of_register + ", status=" + status + ", image=" + image + ", role="
				+ role + ", mobile_no=" + mobile_no + "]";
	}

	
}
