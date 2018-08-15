package com.realcom.helloambulance.pojo;

public class VendorRegistration {

	private int vendor_id;
	private String name;
	private String profile_picture;
	private String mobile_no;
	private String email_id;
	private String password;
	private String date_of_birth;
	private String role;
	private String gender;
	private String blood_group;
	private String register_as;
	private String date_of_register;
	private String vendor_status;
	private String remarks;
	private String otp;

	public int getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile_picture() {
		return profile_picture;
	}

	public void setProfile_picture(String profile_picture) {
		this.profile_picture = profile_picture;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
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

	public String getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}

	public String getRegister_as() {
		return register_as;
	}

	public void setRegister_as(String register_as) {
		this.register_as = register_as;
	}

	public String getDate_of_register() {
		return date_of_register;
	}

	public void setDate_of_register(String date_of_register) {
		this.date_of_register = date_of_register;
	}
	
	

	public String getVendor_status() {
		return vendor_status;
	}

	public void setVendor_status(String vendor_status) {
		this.vendor_status = vendor_status;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	@Override
	public String toString() {
		return "VendorRegistration [vendor_id=" + vendor_id + ", name=" + name + ", profile_picture=" + profile_picture
				+ ", mobile_no=" + mobile_no + ", email_id=" + email_id + ", password=" + password + ", date_of_birth="
				+ date_of_birth + ", role=" + role + ", gender=" + gender + ", blood_group=" + blood_group
				+ ", register_as=" + register_as + ", date_of_register=" + date_of_register + ", vendor_status="
				+ vendor_status + ", remarks=" + remarks + ", otp=" + otp + "]";
	}

	
	
}
