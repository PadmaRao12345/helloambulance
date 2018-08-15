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

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.services.AmbulancesInHospitalServices;
import com.realcom.helloambulance.services.DoctorsInHospitalServices;
import com.realcom.helloambulance.services.MailService;
import com.realcom.helloambulance.services.UploadServices;
import com.realcom.helloambulance.services.VendorServices;
 


@Controller
@RequestMapping(value = "/vendor")
public class DoctorsInHospitalController {
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
	
	//################################## Our Doctors in Hospital (Narendra)  ####################################
	@RequestMapping(value = "/ourDoctorsforHospital")
	public String ourDoctors() {
		return "ourDoctorsforHospital";
	}

	@RequestMapping(value = "/listOfDoctorsforHospital")
	public @ResponseBody List<DoctorRegistration> listOfDoctorsforHospital(HttpServletRequest request) {
		
Integer vendorId = vendorService.getVendorIdByUserName(request);
		List<DoctorRegistration> listOfDoctorsforHospital = doctorsInHospitalServices
				.listOfDoctorsforHospital(vendorId);
		return listOfDoctorsforHospital;
	}
	// *********************************  Our Doctors in Hospital completed  **************************************************
	
			// ###################################### Add Multiple Doctors in Hospital(Narendra)  ###############################
	
	@RequestMapping(value = "/docreg", method = RequestMethod.GET)
	public ModelAndView DoctorRegistration(ModelAndView model) {
		model.setViewName("docreg");
		return model;
	}

	@RequestMapping(value = "/addDoctorforhospital")
	public ModelAndView doctorRegstrationforHospital(ModelAndView model, DoctorRegistration doctor,
			HttpServletRequest request) {
		
		Integer vendorId = vendorService.getVendorIdByUserName(request);
		doctorsInHospitalServices.doctorRegstrationforHospital(doctor,vendorId);

		model.addObject("doctor", doctor);

		mailService.sendMailForDoctorPassword(doctor.getEmail_id());

		model.setViewName("docregsuccessforhospital");

		return model;

	}

	//************************************ Add Multiple Doctors in Hospital Completed **********************************************
	
	//#####################################  View profile of selected Doctor in Hospital (Narendra)  ######################################
	@RequestMapping(value = "/doctorviewprofile")
	public ModelAndView doctorViewProfileInHospital(@RequestParam("register_as_doctor_id") int register_as_doctor_id,ModelAndView model) throws UnsupportedEncodingException{
		DoctorRegistration doctorDetailsInHospitalById = doctorsInHospitalServices.getDoctorDetailsInHospitalById(register_as_doctor_id);
		System.out.println(doctorDetailsInHospitalById + "doctorDetailsInHospitalById");

		model.addObject("doctor", doctorDetailsInHospitalById);
		model.setViewName("doctorviewprofileinhospital");
		return model;
	}

	//****************************************  View profile of selected Doctor in Hospital Completed  **************************************
	
	
			//#############################  New Password For Doctor in Hospital  (Narendra)  ##############################
	
	@RequestMapping(value = "/newPasswordfordoctorInHospital/{email_id}")

	public String setPasswordfordoctorInHospital(@PathVariable String email_id, Map<String, String> model) {
		// check if the email id is valid and registered with us.
		model.put("email_id", email_id);
		return "setPasswordforDoctor";
	}

	@RequestMapping(value = "/setdoctorpasswordSuccess", method = RequestMethod.POST)
	public ModelAndView Success(ModelAndView model, @RequestParam("email_id") String email_id,
			@RequestParam("password") String password) {
		doctorsInHospitalServices.setPasswordPasswordForDoctor(email_id, password);
		model.setViewName("setpasswordforDoctorSuccess");
		return model;
	}

	//****************************  New Password For Doctor in Hospital Completed  *******************************

	//############################ Delete Doctor In Hospital Page (Narendra) ###############################
	@RequestMapping(value = "/deleteDoctorInHospital")
	public ModelAndView deleteDoctorInHospital(@RequestParam("register_as_doctor_id") int register_as_doctor_id,
			ModelAndView model) {
		doctorsInHospitalServices.deleteDoctorInHospital(register_as_doctor_id);

		model.setViewName("redirect:ourDoctorsforHospital");
		return model;
	}
	
	//********************************* Delete Doctor In Hospital Page completed  *****************************
	
	 //###########################  email exits (VIJAY)  ###################################################

	@RequestMapping(value = "/check_avail_email_in_doctor")
	@ResponseBody
	public String check_avail_email_in_doctor(@RequestParam String emailId) {
	return doctorsInHospitalServices.isEmailExistinDoctor(emailId);
		
	}

}
