package com.realcom.helloambulance.pojo;

public class EmergencyBook {
	private int emergency_book_id;
	private int user_id;
	private String address;
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private String mobile;
	private String latitude ;
	private String longitude ;
	private String date;
	private String session_id;
	
	/**
	 * @return the session_id
	 */
	public String getSession_id() {
		return session_id;
	}
	/**
	 * @param session_id the session_id to set
	 */
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	public int getEmergency_book_id() {
		return emergency_book_id;
	}
	public void setEmergency_book_id(int emergency_book_id) {
		this.emergency_book_id = emergency_book_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "EmergencyBook [emergency_book_id=" + emergency_book_id + ", user_id=" + user_id + ", address=" + address
				+ ", street=" + street + ", city=" + city + ", state=" + state + ", zipcode=" + zipcode + ", country="
				+ country + ", mobile=" + mobile + ", latitude=" + latitude + ", longitude=" + longitude + ", date="
				+ date + ", session_id=" + session_id + "]";
	}
	
	

}
