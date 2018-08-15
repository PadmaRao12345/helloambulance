package com.realcom.helloambulance.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.services.AmbulancesInHospitalServices;
import com.realcom.helloambulance.services.DoctorsInHospitalServices;
import com.realcom.helloambulance.services.MailService;
import com.realcom.helloambulance.services.UploadServices;
import com.realcom.helloambulance.services.VendorServices;

@Controller
@RequestMapping(value = "/vendor")

public class AmbulancesInHospitalController {
	@Autowired
	DoctorsInHospitalServices doctorsInHospitalServices;
	@Autowired
	AmbulancesInHospitalServices ambulancesInHospitalServices;
	@Autowired
	private MailService mailService;
	@Autowired
	PasswordEncoder passwordencoder;
	@Autowired
	UploadServices uploadServices;

	@Autowired
	private VendorServices vendorService;
	

	//################################## Our Ambulances in Hospital (vijay)  ####################################//
	
	@RequestMapping(value = "/ourAmbulancesforHospital", method = RequestMethod.GET) // to vendor log out
	public ModelAndView ourAmbulances(ModelAndView model) {
		model.setViewName("ourAmbulancesforHospital");
		return model;
	}
	@RequestMapping(value = "/listOfAmbulancesforHospital")
	public @ResponseBody List<AmbulanceRegistration> listOfAmbulancesforHospital(HttpServletRequest request) {
		Integer vendorId = vendorService.getVendorIdByUserName(request);
		List<AmbulanceRegistration> listOfAmbulancesforHospital = ambulancesInHospitalServices.listOfAmbulancesforHospital(vendorId);
		return listOfAmbulancesforHospital;
	}
	
	@RequestMapping(value = "/ambregforhospital") // to vendor log out
	public ModelAndView AmbulanceRegistrationForHospital(ModelAndView model) {
		model.setViewName("ambregforhospital");
		return model;
	}
	
	//###############################   Delete Ambulance In Hospital Page(Narendra)  ##################################
	@RequestMapping("/deleteAmbulanceInHospital")
	public ModelAndView deleteAmbulanceInHospital(@RequestParam("register_ambulance_id") int register_ambulance_id,
			ModelAndView model) {
		ambulancesInHospitalServices.deleteAmbulanceInHospital(register_ambulance_id);
		model.setViewName("redirect:ourAmbulancesforHospital");
		return model;
	}

	
	
	// ###################################### Add Multiple Ambulance in Hospital(vijay)  ###############################
	@RequestMapping(value = "/addAmbulancesforhospital", method = RequestMethod.POST)
	public ModelAndView AmbulanceRegstrationforHospital(ModelAndView model, AmbulanceRegistration ambulance,
			HttpServletRequest request) {
		Integer vendorId = vendorService.getVendorIdByUserName(request);
		ambulance.setVendor_reg_id(vendorId);

		ambulancesInHospitalServices.AmbulanceRegstrationforHospital(ambulance);

		model.addObject("ambulance", ambulance);

		mailService.sendMailForAmbulancPassword(ambulance.getEmail_id());

		model.setViewName("ambregsuccessforhospital");
		return model;
	}

	@RequestMapping(value = "ambregsuccessforhospital")
	public String ambregsuccessforhospital() {
		return "ambregsuccessforhospital";
	}

	//#####################################  View profile of selected Ambulance in Hospital (vijay)  ######################################
	@RequestMapping(value = "/ambulancesviewprofileinhospital")
	public ModelAndView ambulanceViewProfileInHospital(@RequestParam("register_ambulance_id") int register_ambulance_id,
			ModelAndView model) throws UnsupportedEncodingException {
		AmbulanceRegistration ambulanceDetailsInHospitalById = ambulancesInHospitalServices.getAmbulanceDetailsInHospitalById(register_ambulance_id);

		model.addObject("ambulance", ambulanceDetailsInHospitalById);
		model.setViewName("ambulancesviewprofileinhospital");
		return model;
	}

	//****************************************  View profile of selected Ambulance in Hospital Completed  **************************************
	

	 //################################   email exits in ambulance(VIJAY) ########################################
	@RequestMapping(value = "/check_avail_email_in_ambulance")
	@ResponseBody
	public String check_avail_email_in_ambulance(@RequestParam String emailId) {

		return ambulancesInHospitalServices.isEmailExistinAmbulance(emailId);
		
	}

	
	//#############################  New Password For Ambulance in Hospital  (Narendra)  ##############################
	@RequestMapping(value = "/newPasswordforAmbulanceInHospital/{email_id}")

	public String newPasswordforAmbulanceInHospital(@PathVariable String email_id, Map<String, String> model) {
		// check if the email id is valid and registered with us.
		model.put("email_id", email_id);
		return "setPasswordforAmbulance";
	}

	@RequestMapping(value = "/setAmbulancepasswordSuccess", method = RequestMethod.POST)
	public ModelAndView setAmbulancepasswordSuccess(ModelAndView model, @RequestParam("email_id") String email_id,
			@RequestParam("password") String password) {
		ambulancesInHospitalServices.setPasswordPasswordForAmbulance(email_id, password);
		model.setViewName("setpasswordforAmbulanceSuccess");
		return model;
	}
	
	//****************************  New Password For Ambulance in Hospital Completed  *******************************

}
