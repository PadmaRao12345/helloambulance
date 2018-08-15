package com.realcom.helloambulance.pojo;

public class UserLoginHistory {
	private int lh_id;
	
	private int reg_id;
	private String login_time;
	private String logout_time;
	private String ip_address;
	private String agent;
	private String device;
	private String browser;
	private String session_id;
	private String mac_address;
	private String version_model;
	
	public int getLh_id() {
		return lh_id;
	}
	public void setLh_id(int lh_id) {
		this.lh_id = lh_id;
	}
	public int getReg_id() {
		return reg_id;
	}
	public void setReg_id(int reg_id) {
		this.reg_id = reg_id;
	}
	public String getLogin_time() {
		return login_time;
	}
	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}
	public String getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getSession_id() {
		return session_id;
	}
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	public String getMac_address() {
		return mac_address;
	}
	public void setMac_address(String mac_address) {
		this.mac_address = mac_address;
	}
	public String getVersion_model() {
		return version_model;
	}
	public void setVersion_model(String version_model) {
		this.version_model = version_model;
	}
	
	@Override
	public String toString() {
		return "UserLoginHistory [lh_id=" + lh_id + ", reg_id=" + reg_id + ", login_time=" + login_time
				+ ", logout_time=" + logout_time + ", ip_address=" + ip_address + ", agent=" + agent + ", device="
				+ device + ", browser=" + browser + ", session_id=" + session_id + ", mac_address=" + mac_address
				+ ", version_model=" + version_model + "]";
	}}