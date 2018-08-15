package com.realcom.helloambulance.pojo;

public class HospitalRegistration {

	private Integer register_reg_id;
	private Integer vendor_reg_id;
	private String hospital_name;
	private String hospital_reg_no;
	private String hospital_type;
	private String hospital_website;
	private String from_time;
	private String to_time;
	private String no_of_doctors;
	private String equipments;
	private String hospital_address;
	private String country;
	private String state;
	private String city;
	private String pincode;
	private String date_of_register;
	private String status;

	public Integer getRegister_reg_id() {
		return register_reg_id;
	}

	public void setRegister_reg_id(Integer register_reg_id) {
		this.register_reg_id = register_reg_id;
	}

	public Integer getVendor_reg_id() {
		return vendor_reg_id;
	}

	public void setVendor_reg_id(Integer vendor_reg_id) {
		this.vendor_reg_id = vendor_reg_id;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}

	public String getHospital_reg_no() {
		return hospital_reg_no;
	}

	public void setHospital_reg_no(String hospital_reg_no) {
		this.hospital_reg_no = hospital_reg_no;
	}

	public String getHospital_type() {
		return hospital_type;
	}

	public void setHospital_type(String hospital_type) {
		this.hospital_type = hospital_type;
	}

	public String getHospital_website() {
		return hospital_website;
	}

	public void setHospital_website(String hospital_website) {
		this.hospital_website = hospital_website;
	}

	

	public String getFrom_time() {
		return from_time;
	}

	public void setFrom_time(String from_time) {
		this.from_time = from_time;
	}

	public String getTo_time() {
		return to_time;
	}

	public void setTo_time(String to_time) {
		this.to_time = to_time;
	}

	public String getNo_of_doctors() {
		return no_of_doctors;
	}

	public void setNo_of_doctors(String no_of_doctors) {
		this.no_of_doctors = no_of_doctors;
	}

	public String getEquipments() {
		return equipments;
	}

	public void setEquipments(String equipments) {
		this.equipments = equipments;
	}

	public String getHospital_address() {
		return hospital_address;
	}

	public void setHospital_address(String hospital_address) {
		this.hospital_address = hospital_address;
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

	@Override
	public String toString() {
		return "HospitalRegistration [register_reg_id=" + register_reg_id + ", vendor_reg_id=" + vendor_reg_id
				+ ", hospital_name=" + hospital_name + ", hospital_reg_no=" + hospital_reg_no + ", hospital_type="
				+ hospital_type + ", hospital_website=" + hospital_website + ", from_time=" + from_time + ", to_time="
				+ to_time + ", no_of_doctors=" + no_of_doctors + ", equipments=" + equipments + ", hospital_address="
				+ hospital_address + ", country=" + country + ", state=" + state + ", city=" + city + ", pincode="
				+ pincode + ", date_of_register=" + date_of_register + ", status=" + status + "]";
	}
	
	

}
