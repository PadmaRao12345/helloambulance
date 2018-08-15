package com.realcom.helloambulance.pojo;

public class ContactUs {
	private   int contact_id;
	private String name;
	private String email;
	private String message;
	private String date_of_message;
	
	
	//getters setters
	public int getContact_id() {
		return contact_id;
	}
	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDate_of_message() {
		return date_of_message;
	}
	public void setDate_of_message(String date_of_message) {
		this.date_of_message = date_of_message;
	}
	@Override
	public String toString() {
		return "ContactUs [contact_id=" + contact_id + ", name=" + name + ", email=" + email + ", message=" + message
				+ ", date_of_message=" + date_of_message + "]";
	}
	
}

