package com.realcom.helloambulance.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.dao.AmbulanceDao;
import com.realcom.helloambulance.dao.VendorDao;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.util.ApplicationsUtil;

@Service
public class AmbulanceService {
	
	@Autowired
	private AmbulanceDao ambulanceDao;
	@Autowired
	private VendorDao vendorDao;
	
	
	public Integer getAmbulanceRegidByEmailId(HttpServletRequest request) {
		
		String emailId = ApplicationsUtil.addUserName(request);
		return ambulanceDao.getAmbulanceRegidByEmailId(emailId);
		
	}
	
	public Integer getAmbulanceRegIdByMobileNo(HttpServletRequest request) {
		String emailId = ApplicationsUtil.addUserName(request);
		String mobileNumber = ambulanceDao.getVendorMobileNumberByEmailId(emailId);
		Integer ambulance_reg_id = ambulanceDao.getAmbulanceRegIdByMobileNo(mobileNumber);
		return ambulance_reg_id;
	}
	

	//################################### Ambulance Registration ################################################
	@Transactional
	public void AmbulanceRegistration(AmbulanceRegistration ambulance,HttpServletRequest request) {
		String emailId = ApplicationsUtil.addUserName(request);
		String mobileNumber = ambulanceDao.getVendorMobileNumberByEmailId(emailId);
		ambulance.setMobile_no(mobileNumber.toString());
		ambulance.setStatus(AppConstants.STATUS_YES);
		Date date = new Date();
		ambulance.setDate_of_register(date.toString());
		ambulanceDao.AmbulanceRegistration(ambulance);
	}
	
	//***************************************** Ambulance Registration *****************************************

	// ########## Ambulance Update (Narendra) ############/////

	public AmbulanceRegistration getAmbulanceDetails(int register_ambulance_id) {
		
		return ambulanceDao.getAmbulanceDetails(register_ambulance_id);
	}

	public void updateAmbulance(AmbulanceRegistration ambulance,int register_ambulance_id) {
		
		ambulance.setOrganization_name(ambulance.getOrganization_name());
		ambulance.setVechicle_reg_no(ambulance.getVechicle_reg_no());
		ambulance.setVechicle_model(ambulance.getVechicle_model());
		ambulance.setVechicle_engine_no(ambulance.getVechicle_engine_no());
		ambulance.setVechicle_colour(ambulance.getVechicle_colour());
		ambulance.setPurchesed_from(ambulance.getPurchesed_from());
		
		ambulanceDao.updateambulance(ambulance,register_ambulance_id);
	}

	public String getEquipmentsListOfAmbulance(int ambulance_reg_id) {
		return ambulanceDao.getEquipmentsListOfAmbulance(ambulance_reg_id);
	}

	
	
	//$$$$$$$$$$$$$$$ logic  for split Equipments into individual objects (Narendra)
	public List<String> getAvailEquipmentsInAmbulance(int ambulance_reg_id) {
		 String equipmentsListOfAmbulance = ambulanceDao.getEquipmentsListOfAmbulance(ambulance_reg_id);
		 String[] equipments = equipmentsListOfAmbulance.split(",");

			ArrayList<String> equipmentList = new ArrayList<String>();

			for (int i = 0; i < equipments.length; i++) {

				equipmentList.add(equipments[i]);

			}
			return equipmentList;
	}
	
	//$$$$$$$$$  logic for adding new Hospital Equipment (Narendra)
public void updateAmbulanceEquipment(Integer equipments,int ambulance_reg_id) {
		
		String newequipment = "";
		String equipmentsListOfAmbulance = ambulanceDao.getEquipmentsListOfAmbulance(ambulance_reg_id);
		List<Equipments> equipmentList = vendorDao.getEquipmentList();
		
		for (Equipments equipments2 : equipmentList) {

			if (equipments2.getEquipments_id() == equipments) {

				newequipment = equipmentsListOfAmbulance.concat("," + equipments2.getEquipment_name());
			}
		}
		ambulanceDao.updateAmbulanceEquipment(newequipment,ambulance_reg_id);	
	}
	
	//$$$$$$$$$$$   Logic for checking Ambulance Equipment is already available or not (Narendra)
	public String check_equipment_avail_ambulance(int equipments, Integer ambulance_reg_id) {
		 String equipmentsListOfAmbulance = ambulanceDao.getEquipmentsListOfAmbulance(ambulance_reg_id);
		
		String[] equipmentsarray = equipmentsListOfAmbulance.split(",");

		String equipment = "";

		List<Equipments> equipmentList = vendorDao.getEquipmentList();

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
