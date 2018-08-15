package com.realcom.helloambulance.pojo;

import org.springframework.context.annotation.Configuration;

@Configuration
public class Equipments {
	private int equipments_id;
	private String equipment_name;
	private String Status;
	
	
	
	public Equipments(String equipment_name) {
		super();
		this.equipment_name = equipment_name;
	}
	public Equipments() {
		super();
	}
	public int getEquipments_id() {
		return equipments_id;
	}
	public void setEquipments_id(int equipments_id) {
		this.equipments_id = equipments_id;
	}
	
	public String getEquipment_name() {
		return equipment_name;
	}
	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
	}

	@Override
	public String toString() {
		return "Equipments [equipments_id=" + equipments_id	+ ", equipment_name=" + equipment_name + "]";
	}
	public void setStatus(String status) {
		this.Status=status;
	}
	public void setEquipments_id(String stringInToInt) {		
	}
	public Object getStatus() {
		return Status;
	}
}