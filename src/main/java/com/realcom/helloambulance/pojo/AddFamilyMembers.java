package com.realcom.helloambulance.pojo;

public class AddFamilyMembers {
	
	
	private int family_member_id;
	private int user_id;
	private String relation_type;
	private String name;
	private String gender;
	private String date_of_birth;
	private String mobile_number;
	private String email_id;
	private String blood_group;
	private String willing_to_donate_blood;
	private String notify_blood_request;
	private String last_donated_date;
	private String willing_to_donate_organs;
	private String address;
	private String country;
	private String state;
	private String city;
	private String pincode;
	private String designation;
	private String marital_status;
	private String food_habit;
	private String date_of_register;
	private String Status;
	

	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public int getFamily_member_id() {
		return family_member_id;
	}
	public void setFamily_member_id(int family_member_id) {
		this.family_member_id = family_member_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getRelation_type() {
		return relation_type;
	}
	public void setRelation_type(String relation_type) {
		this.relation_type = relation_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	public String getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getBlood_group() {
		return blood_group;
	}
	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}
	public String getWilling_to_donate_blood() {
		return willing_to_donate_blood;
	}
	public void setWilling_to_donate_blood(String willing_to_donate_blood) {
		this.willing_to_donate_blood = willing_to_donate_blood;
	}
	public String getNotify_blood_request() {
		return notify_blood_request;
	}
	public void setNotify_blood_request(String notify_blood_request) {
		this.notify_blood_request = notify_blood_request;
	}
	public String getLast_donated_date() {
		return last_donated_date;
	}
	public void setLast_donated_date(String last_donated_date) {
		this.last_donated_date = last_donated_date;
	}
	public String getWilling_to_donate_organs() {
		return willing_to_donate_organs;
	}
	public void setWilling_to_donate_organs(String willing_to_donate_organs) {
		this.willing_to_donate_organs = willing_to_donate_organs;
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
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getFood_habit() {
		return food_habit;
	}
	public void setFood_habit(String food_habit) {
		this.food_habit = food_habit;
	}
	public String getDate_of_register() {
		return date_of_register;
	}
	public void setDate_of_register(String date_of_register) {
		this.date_of_register = date_of_register;
	}
	
	@Override
	public String toString() {
		return "AddFamilyMembers [family_member_id=" + family_member_id + ", user_id=" + user_id + ", relation_type="
				+ relation_type + ", name=" + name + ", gender=" + gender + ", date_of_birth=" + date_of_birth
				+ ", mobile_number=" + mobile_number + ", email_id=" + email_id + ", blood_group=" + blood_group
				+ ", willing_to_donate_blood=" + willing_to_donate_blood + ", notify_blood_request="
				+ notify_blood_request + ", last_donated_date=" + last_donated_date + ", willing_to_donate_organs="
				+ willing_to_donate_organs + ", address=" + address + ", country=" + country + ", state=" + state
				+ ", city=" + city + ", pincode=" + pincode + ", designation=" + designation + ", marital_status="
				+ marital_status + ", food_habit=" + food_habit + ", date_of_register=" + date_of_register +", Status="+Status+"]";
	}

	
	

}
