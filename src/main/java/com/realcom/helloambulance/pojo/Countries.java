package com.realcom.helloambulance.pojo;

public class Countries {
private int Country_id;
private String sortname;
private String name;
private int phonecode;


public int getCountry_id() {
	return Country_id;
}
public void setCountry_id(int Country_id) {
	this.Country_id = Country_id;
}
public String getsortname() {
	return sortname;
}
public void setsortname(String sortname) {
	this.sortname = sortname;
}
public String getname() {
	return name;
}
public void setname(String name) {
	this.name = name;
}
public int getphonecode() {
	return phonecode;
}
public void setphonecode(int phonecode) {
	this.phonecode = phonecode;
}

@Override
public String toString() {
	return "Countries [Country_id=" + Country_id + ",sortname=" + sortname + ", name=" + name + ",phonecode=\" + phonecode + \",]";
	
}

}