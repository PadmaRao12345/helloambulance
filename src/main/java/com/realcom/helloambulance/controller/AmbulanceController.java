package com.realcom.helloambulance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.services.AmbulanceService;
import com.realcom.helloambulance.services.VendorServices;

@Controller
@RequestMapping("/vendor")
public class AmbulanceController {
	@Autowired
	VendorServices vendorService;
	@Autowired
	private AmbulanceService ambulanceService;
	
	
	// ###############Ambulance Registration (Narendra) ######################
		@RequestMapping(value = "/ambulancesuccess", method = RequestMethod.POST)
		public ModelAndView AmbulanceRegistration(AmbulanceRegistration ambulance, ModelAndView model,
				HttpServletRequest request) {
		
			Integer vendorId = vendorService.getVendorIdByUserName(request);
			ambulance.setVendor_reg_id(vendorId);
			
			ambulanceService.AmbulanceRegistration(ambulance,request);

			model.setViewName("ambulancesuccess");
			return model;
		} 

		@RequestMapping(value = "ambulanceSuccesspage")
		public String ambulanceSuccesspage() {
			return "ambulancesuccess";
		}

		// ************** Ambulance Registration Completed *****************

		// ################# Update Ambulance Details (Narendra) #################

		@RequestMapping(value = "ambulanceUpdatePage")
		public String ambulanceUpdatePage(@RequestParam("register_ambulance_id") int register_ambulance_id,HttpServletRequest request) {

			AmbulanceRegistration ambulancedetails = ambulanceService.getAmbulanceDetails(register_ambulance_id);

			request.setAttribute("ambulance", ambulancedetails);

			return "ambulanceUpdatePage";

		}

		@RequestMapping(value = "/updateAmbulance", method = RequestMethod.POST)
		public String updateAmbulance(@RequestParam("register_ambulance_id") int register_ambulance_id, AmbulanceRegistration ambulance, HttpServletRequest request) {

			ambulanceService.updateAmbulance(ambulance, register_ambulance_id);
			return "ambulanceUpdateSuccess";
		}

		// add equipments for ambulance
		@RequestMapping(value = "addNewAmbulanceEquipments")
		public String addAmbulanceEqipments(HttpServletRequest request) {

			Integer ambulance_reg_id = ambulanceService.getAmbulanceRegIdByMobileNo(request);

			List<String> equipmentList = ambulanceService.getAvailEquipmentsInAmbulance(ambulance_reg_id);

			request.setAttribute("equipmentList", equipmentList);

			return "addNewAmbulanceEquipments";
		}
		
	@RequestMapping(value = "/addAmbulanceEquipment", method = RequestMethod.POST)
	public String addAmbulanceEquipment(Integer equipments, HttpServletRequest request) {

		Integer ambulance_reg_id = ambulanceService.getAmbulanceRegIdByMobileNo(request);

		ambulanceService.updateAmbulanceEquipment(equipments, ambulance_reg_id);

		return "redirect:addNewAmbulanceEquipments";
	}

		// ********* Check Equipment available or not for Ambulance ***********
	@RequestMapping(value = "/check_equipment_avail_ambulance")
	@ResponseBody
	public String check_equipment_avail_ambulance(@RequestParam int equipments, HttpServletRequest request) {

		// int vendorId = vendorService.getVendorIdByUserName(request);
		Integer ambulance_reg_id = ambulanceService.getAmbulanceRegIdByMobileNo(request);
		return ambulanceService.check_equipment_avail_ambulance(equipments, ambulance_reg_id);

	}

		// ***************** Ambulance Update Completed Succesfully   ********************
	
		
}
