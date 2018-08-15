package com.realcom.helloambulance.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.dao.HospitalDao;
import com.realcom.helloambulance.dao.VendorDao;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;

@Service
public class HospitalService {
	
	@Autowired
	private VendorDao vendorDao;
	@Autowired
	private HospitalDao hospitalDao;

//####################### Hospital Registration (Narendra)  #######################################
	public void addHospital(HospitalRegistration hospital) {
		
		hospital.setStatus(AppConstants.STATUS_YES);
		Date date=new Date();
		
		hospital.setDate_of_register(date.toString());
		
		hospitalDao.addHospital(hospital);	
	}
	
	//******************************Hospital Registration Completed ********************************
	
	//########################  Hospital Update (Narendra)##########################################
	public void updateHospital(HospitalRegistration hospital,int vendorid) {

		hospitalDao.updateHospitalDetails(hospital,vendorid);
	}

	public HospitalRegistration getHospitalDetails(int id) {
		
		return hospitalDao.getHospitalDetails(id);
		
	}

	public HospitalRegistration gethospitalData(int vendorId) {
		return hospitalDao.getHospitalData(vendorId);
	}

	public String getEquipmentsListOfHospital(int vendorId) {
		return hospitalDao.getEquipmentsListOfHospital(vendorId);
	}
	
	//$$$$$$$$$$$$$$$ logic  for split Equipments into individual objects (Narendra)
	public List<String> getAvailEquipmentsHospital(int vendorId) {
		 String equipmentsListOfHospital = hospitalDao.getEquipmentsListOfHospital(vendorId);
		 String[] equipments = equipmentsListOfHospital.split(",");

			ArrayList<String> equipmentList = new ArrayList<String>();

			for (int i = 0; i < equipments.length; i++) {

				equipmentList.add(equipments[i]);
			}
			return equipmentList;
	}
	
	
	//$$$$$$$$$  logic for adding new Hospital Equipment (Narendra)
	public void updateEquipment(Integer equipments,int vendorid) {
		String newequipment = "";
		String equipmentsListOfHospital = hospitalDao.getEquipmentsListOfHospital(vendorid);
		List<Equipments> equipmentList = hospitalDao.getEquipmentList();
		
		for (Equipments equipments2 : equipmentList) {

			if (equipments2.getEquipments_id() == equipments) {

				newequipment = equipmentsListOfHospital.concat("," + equipments2.getEquipment_name());
			}
		}
		
		hospitalDao.updateEquipment(newequipment,vendorid);
	}
	
	public Boolean gethospitalStatus(int vendorId) {
		Boolean hospitalStatus = vendorDao.getHospitalStatus(vendorId);
		System.out.println(hospitalStatus+"hospitalStatus");
		return hospitalStatus;
	}
	
	public List<Equipments> getEquipmentList() {
		return hospitalDao.getEquipmentList();

		}
	
	
	////$$$$$$$$$$$   Logic for checking Hospital Equipment is already available or not (Narendra)
	public String check_equipment_avail_hospital(int equipments, Integer vendorId) {
		String equipmentsListOfHospital = hospitalDao.getEquipmentsListOfHospital(vendorId);
		
		String[] equipmentsarray = equipmentsListOfHospital.split(",");

		String equipment = "";

		List<Equipments> equipmentList = hospitalDao.getEquipmentList();

		for (Equipments equipments2 : equipmentList) {

			if (equipments2.getEquipments_id() == equipments) {

				equipment = equipments2.getEquipment_name();
			}
		}
		int count = 0;

		for (int i = 0; i < equipmentsarray.length; i++) {

			if (equipmentsarray[i].equals(equipment)) {

				count = 1;

			}
		}

		if (count == 0) {

			return "";

		} else {

			return "Equipment with this name already exists " + "please select another Equipment ";

		}
	}
	
	

}
