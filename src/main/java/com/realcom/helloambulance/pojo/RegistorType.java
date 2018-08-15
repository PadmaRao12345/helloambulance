package com.realcom.helloambulance.pojo;

import org.springframework.context.annotation.Configuration;

@Configuration
public class RegistorType {
	
	
	
	private int register_as_id;
	private String register_type;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public RegistorType() {
		super();
	}
	public RegistorType(int register_as_id, String register_type) {
		super();
		this.register_as_id = register_as_id;
		this.register_type = register_type;
	}
	public int getRegister_as_id() {
		return register_as_id;
	}
	public void setRegister_as_id(int register_as_id) {
		this.register_as_id = register_as_id;
	}
	public String getRegister_type() {
		return register_type;
	}
	public void setRegister_type(String register_type) {
		this.register_type = register_type;
	}
	@Override
	public String toString() {
		return "RegistorType [register_as_id=" + register_as_id + ", register_type=" + register_type + ", status="
				+ status + "]";
	}
}
