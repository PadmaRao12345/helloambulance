package com.realcom.helloambulance.pojo;

public class BloodGroup {

	private int bloodGroupId;
	private String bloodGroupName;
	
	public int getBloodGroupId() {
		return bloodGroupId;
	}
	public void setBloodGroupId(int bloodGroupId) {
		this.bloodGroupId = bloodGroupId;
	}
	public String getBloodGroupName() {
		return bloodGroupName;
	}
	public void setBloodGroupName(String bloodGroupName) {
		this.bloodGroupName = bloodGroupName;
	}
	
	@Override
	public String toString() {
		return "BloodGroup [bloodGroupId=" + bloodGroupId + ", bloodGroupName=" + bloodGroupName + "]";
	}
	
}
