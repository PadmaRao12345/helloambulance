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

import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.services.HospitalService;
import com.realcom.helloambulance.services.VendorServices;

@Controller
@RequestMapping("/vendor")
public class HospitalController {

	@Autowired
	VendorServices vendorService;
	@Autowired
	private HospitalService hospitalService;
	
	// ############ Hospital Registration (Narendra) #######################
		@RequestMapping(value = "/hospitalregistration",method=RequestMethod.POST)
		public String hospitalRegistration(ModelAndView model, HospitalRegistration hospital, HttpServletRequest request) {

			Integer vendorId = vendorService.getVendorIdByUserName(request);

			hospital.setVendor_reg_id(vendorId);

			hospitalService.addHospital(hospital);

			return "hospitalSuccess";

		}

		@RequestMapping(value = "hospitalsuccess")
		public String hospitalSuccess() {
			return "hospitalSuccess";
		}
		// ***************** Hospital Registration Completed *****************

	
		// ################## Update Hospital Details (Narendra) #######################

		@RequestMapping(value = "/hospitalupdatePage")
		public String hospitalUpdatePage(HttpServletRequest request) {

			Integer vendorId = vendorService.getVendorIdByUserName(request);

			HospitalRegistration hospitalDetails = hospitalService.getHospitalDetails(vendorId);

			request.setAttribute("hospital", hospitalDetails);

			if ((hospitalService.gethospitalStatus(vendorId)) == true)

				return "hospitalupdatePage";
			else {
				return "vendorashospital";
			}
		}

		@RequestMapping(value = "/updateHospital")
		public String updateHospitalDetails(HospitalRegistration hospital, HttpServletRequest request) {

			Integer vendorId = vendorService.getVendorIdByUserName(request);

			hospitalService.updateHospital(hospital, vendorId);

			return "updateHospitalDetails";
		}

		// Add Equipments for Hospital(Narendra)
	@RequestMapping(value = "addNewEquipments")
	
	public String addHospitalEqipments(HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		List<String> equipmentList = hospitalService.getAvailEquipmentsHospital(vendorId);

		request.setAttribute("equipmentList", equipmentList);

		return "addHospitalEquipments";
	}

	@RequestMapping(value = "/addEquipment", method = RequestMethod.POST)
	
	public String addEquipment(Integer equipments, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		hospitalService.updateEquipment(equipments, vendorId);

		return "redirect:addNewEquipments";
	}

	// *************Equipment exists or not for vendor(Narendra) ***********

	@RequestMapping(value = "/check_equipment_avail_hospital")
	@ResponseBody
	public String check_equipment_avail_hospital(@RequestParam int equipments, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		String check_equipment_avail_hospital = hospitalService.check_equipment_avail_hospital(equipments, vendorId);

		return check_equipment_avail_hospital;

	}

		// Get Equipment List
		@RequestMapping(value = "/getEquipmentList", headers = "Accept=*/*", method = RequestMethod.GET)
		public @ResponseBody List<Equipments> getEquipmentList() {

			return hospitalService.getEquipmentList();
		}

		// ******************************** Hospital Update Completed ********************************************
}
