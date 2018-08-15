package com.realcom.helloambulance.pojo;

public class UserRegistration {

	// userRegistration Variables
		private int user_reg_id;
		private String name;
		private String mobile_number;
		private String email_id;
		private String password;
		private String date_of_birth;
		private String gender;
		private String blood_group;
		private String country;
		private String state;
		private String city;
		private String pincode;
		private int user_status;
		private String role;
		private String otp;
		private int remarks;
		private String date_of_register;

		// generate setters & getters
		public int getUser_reg_id() {
			return user_reg_id;
		}

		public void setUser_reg_id(int user_reg_id) {
			this.user_reg_id = user_reg_id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
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

		public int getUser_status() {
			return user_status;
		}

		public void setUser_status(int i) {
			this.user_status = i;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public String getOtp() {
			return otp;
		}

		public void setOtp(String otp) {
			this.otp = otp;
		}

		public int getRemarks() {
			return remarks;
		}

		public void setRemarks(int i) {
			this.remarks = i;
		}

		public String getDate_of_register() {
			return date_of_register;
		}

		public void setDate_of_register(String date_of_register) {
			this.date_of_register = date_of_register;
		}

		@Override
		public String toString() {
			return "UserRegistration [user_reg_id=" + user_reg_id + ", name=" + name + ", mobile_number=" + mobile_number
					+ ", email_id=" + email_id + ", password=" + password + ", date_of_birth=" + date_of_birth + ", gender="
					+ gender + ", blood_group=" + blood_group + ", country=" + country + ", state=" + state + ", city="
					+ city + ", pincode=" + pincode + ", user_status=" + user_status + ", role=" + role + ", otp=" + otp
					+ ", remarks=" + remarks + ", date_of_register=" + date_of_register + "]";
		}

	}