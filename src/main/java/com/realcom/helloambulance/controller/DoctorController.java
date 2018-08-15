package com.realcom.helloambulance.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.services.DoctorService;
import com.realcom.helloambulance.services.VendorServices;
import com.realcom.helloambulance.util.ApplicationsUtil;
@Controller
@RequestMapping("/vendor")
public class DoctorController {

	@Autowired
	VendorServices vendorService;
	@Autowired
	private DoctorService doctorService;

	//################################# Doctor Registration (Narendra) ###########################################
	@RequestMapping(value = "/doctorsuccess", method = RequestMethod.POST)
	public ModelAndView DoctorRegistration(DoctorRegistration doctor, ModelAndView model, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		doctor.setVendor_reg_id(vendorId);
		
		doctorService.DoctorRegistrtaion(doctor);

		model.setViewName("doctorsuccess");
		return model;
	}

	@RequestMapping(value = "/loadDoctorSpecialization", headers = "Accept=*/*", method = RequestMethod.GET)
	public @ResponseBody List<DoctorSpecialization> loadDoctorSpecialization(
			@RequestParam("doctor_degree_id") String doctor_degree_id) {
		List<DoctorSpecialization> doctorSpecializationlist = doctorService.getAllDoctorSpecialization(doctor_degree_id);
		return doctorSpecializationlist;
	}

	@RequestMapping(value = "/loadDoctorDegree", method = RequestMethod.GET)
	public @ResponseBody List<DoctorDegree> loadDoctorDegree() {
		List<DoctorDegree> allDoctorDegree = doctorService.getAllDoctorDegree();
		return allDoctorDegree;
	}
	
	//******************************** Doctor Registration Completed ***************************
	
	
	// ################# Update Doctor Details (Narendra) #####################
	@RequestMapping(value = "doctorUpdatePage")
	public String doctorUpdatePage(DoctorRegistration doctor, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		DoctorRegistration doctorDetails = doctorService.getDoctorDetails(vendorId);

		request.setAttribute("doctor", doctorDetails);

		return "doctorUpdatePage";

	}

	@RequestMapping(value = "/updateDoctor", method = RequestMethod.POST)
	public String updateDoctor(DoctorRegistration doctor, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		doctorService.updateDoctor(doctor, vendorId);

		return "doctorUpdateSuccess";
	}

	// Add new Doctor Specialization (Narendra)

	@RequestMapping(value = "/addNewDoctorSpecialization")
	public String addNewDoctorSpecialization(HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		List<String> specializationsList = doctorService.getdoctorSpecializations(vendorId);

		request.setAttribute("specializationsList", specializationsList);

		return "addNewDoctorSpecialization";
	}

	@RequestMapping(value = "/addDoctorSpecialization", method = RequestMethod.POST)
	public String addDoctorSpecialization(Integer specialization, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		doctorService.updateDoctorSpecialization(specialization, vendorId);

		return "redirect:addNewDoctorSpecialization";
	}

	
	//code for Doctor Specialization available or not (Narendra)
	@RequestMapping(value = "/check_specialization_avail_doctor")
	@ResponseBody
	public String check_specialization_avail_doctor(@RequestParam int specialization, HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);
		
		return doctorService.check_specialization_avail_doctor(vendorId, specialization);
		



	}

	@RequestMapping(value = "/loadDoctorSpecializationbydegree", headers = "Accept=*/*", method = RequestMethod.GET)
	public @ResponseBody List<DoctorSpecialization> loadDoctorSpecializationbydegree(HttpServletRequest request) {

		Integer vendorId = vendorService.getVendorIdByUserName(request);

		Integer doctorDegree = doctorService.getDoctorDegreeByvendorId(vendorId);

		List<DoctorSpecialization> doctorSpecializationlist = doctorService.getAllDoctorSpecialization(doctorDegree.toString());

		return doctorSpecializationlist;
	}
	// ******************** Update Doctor Details Completed ********************
}
