package com.realcom.helloambulance.pojo;

public class Cities {
private int CityId;
private String CityName;
private String CityStateId;



public int getCityId() {
	return CityId;
}
public void setCityId(int CityId) {
	this.CityId = CityId;
}
public String getCityName() {
	return CityName;
}
public void setCityName(String CityName) {
	this.CityName = CityName;
}
public String getCityStateId() {
	return CityStateId;
}
public void setCityStateId(String CityStateId) {
	this.CityStateId = CityStateId;
}


@Override
public String toString() {
	return "Cities [CityId=" + CityId + ", CityName=" + CityName + ", CityStateId=" + CityStateId + ",]";
	
}

}
