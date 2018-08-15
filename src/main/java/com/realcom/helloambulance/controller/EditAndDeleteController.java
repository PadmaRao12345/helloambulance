package com.realcom.helloambulance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.realcom.helloambulance.pojo.AddFamilyMembers;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.ContactUs;
import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecailization;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.RegistorType;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.UserResponse;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.services.AdminServices;
import com.realcom.helloambulance.services.UserServices;

@Controller
@RequestMapping(value = "/list")
public class EditAndDeleteController {
	@Autowired
	UserServices userServices;
	@Autowired
	AdminServices adminServices;

	// ...........EditEquipments....................//

	@RequestMapping(value = "/Edit", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody UserResponse edit(

			@RequestParam("equipments_id") String equipments_id,
			@RequestParam("equipment_name") String equipment_name) {

		Equipments equipments = new Equipments();
		equipments.setEquipments_id(Integer.parseInt(equipments_id));
		equipments.setEquipment_name(equipment_name);
		Boolean success = adminServices.edit(equipments);

		System.out.print("hi");

		UserResponse response = new UserResponse();

		if (success == true) {
			response.setSuccess(true);
			response.setMessage("Edited Successfully..!");
			return response;
		} else {
			response.setSuccess(false);
			response.setMessage("Edited Failure..!");
			return response;
		}
	}

	// ............... Delete Equipments......................//

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String EquipmentDelete(@RequestParam("equipments_id") int equipments_id) {
		Equipments equipments = new Equipments();
		equipments.setEquipments_id(equipments_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackage(equipments);
		System.out.print("gggfsdf");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/Equipments";
	}

	// ............ RegistorType Edit and Delete......................//
	@RequestMapping(value = "/EditReg", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody UserResponse regedit(@RequestParam("register_as_id") String register_as_id,
			@RequestParam("register_type") String register_type) {
		RegistorType registor = new RegistorType();
		registor.setRegister_as_id(Integer.parseInt(register_as_id));
		registor.setRegister_type(register_type);
		Boolean success = adminServices.edit(registor);
		System.out.print("hi");
		UserResponse response = new UserResponse();
		if (success == true) {
			response.setSuccess(true);
			response.setMessage("Edited Successfully..!");
			return response;
		} else {
			response.setSuccess(false);
			response.setMessage("Edited Failure..!");
			return response;
		}
	}

	@RequestMapping(value = "/deleteExistingPackages", method = RequestMethod.GET)
	public String deleteExistingPackage(@RequestParam("register_as_id") int register_as_id) {
		RegistorType registor = new RegistorType();
		registor.setRegister_as_id(register_as_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackage(registor);
		System.out.print("gggfsdf");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/Registor";
	}
	// ................. Edit and Delete DoctorDegree..................//

	@RequestMapping(value = "/EditDoctorDegree", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody UserResponse doctorDegreeedit(@RequestParam("doctor_degree_id") String doctor_degree_id,
			@RequestParam("doctor_degree") String doctor_degree) {
		DoctorDegree doctorDegree = new DoctorDegree();
		doctorDegree.setDoctor_degree_id(Integer.parseInt(doctor_degree_id));
		doctorDegree.setDoctor_degree(doctor_degree);
		Boolean success = adminServices.edit(doctorDegree);
		System.out.print("hi");
		UserResponse response = new UserResponse();
		if (success == true) {
			response.setSuccess(true);
			response.setMessage("Edited Successfully..!");
			return response;
		} else {
			response.setSuccess(false);
			response.setMessage("Edited Failure..!");
			return response;
		}
	}

	// Delete Doctor Degree..
	@RequestMapping(value = "/degree", method = RequestMethod.GET)
	public String deleteExistingPackages(@RequestParam("doctor_degree_id") int doctor_degree_id) {
		DoctorDegree Doctordegree = new DoctorDegree();
		Doctordegree.setDoctor_degree_id(doctor_degree_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackages(Doctordegree);
		System.out.print("deleted...kdsf");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/Doctor";
	}

	// ................ Edit and Delete DoctorSpecializations...................//

	@RequestMapping(value = "/EditDoctorDegreeSpecialization", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody UserResponse doctorDegreeSpecializationsedit(
			@RequestParam("doctor_specialization_id") String doctor_specialization_id,
			@RequestParam("doctor_specialization_type") String doctor_specialization_type) {
		DoctorSpecailization doctorDegreeSpecialization = new DoctorSpecailization();
		doctorDegreeSpecialization.setDoctor_specialization_id(Integer.parseInt(doctor_specialization_id));
		doctorDegreeSpecialization.setDoctor_specialization_type(doctor_specialization_type);
		Boolean success = adminServices.edit(doctorDegreeSpecialization);
		System.out.print("hi");
		UserResponse response = new UserResponse();
		if (success == true) {
			response.setSuccess(true);
			response.setMessage("Edited Successfully..!");
			return response;
		} else {
			response.setSuccess(false);
			response.setMessage("Edited Failure..!");
			return response;
		}
	}

	// Delete DoctorSpecializations...
	@RequestMapping(value = "/degreeSpecialization", method = RequestMethod.GET)
	public String deleteExistingPackagess(@RequestParam("doctor_specialization_id") int doctor_specialization_id) {
		DoctorSpecailization DoctordegreeSpecialization = new DoctorSpecailization();
		DoctordegreeSpecialization.setDoctor_specialization_id(doctor_specialization_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackagess(DoctordegreeSpecialization);
		System.out.print("deleted...kdsf");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/DoctorSpecialization";
	}

	// DELETE LISTOFUSERS.....
	@RequestMapping(value = "/deleteListUsers", method = RequestMethod.GET)
	public String deleteListUsers(@RequestParam("user_reg_id") int user_reg_id) {
		UserRegistration userReg = new UserRegistration();
		userReg.setUser_reg_id(user_reg_id);
		@SuppressWarnings("unused")
		Boolean success = userServices.deleteListUsers(userReg);
		System.out.print("gggfsdf");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/listusers";
	}

	// Delete ListOfVendors....
	@RequestMapping(value = "/deleteListVendors", method = RequestMethod.GET)
	public String deleteListVendors(@RequestParam("vendor_reg_id") int vendor_reg_id) {
		VendorRegistration vendorReg = new VendorRegistration();
		vendorReg.setVendor_id(vendor_reg_id);
		@SuppressWarnings("unused")
		Boolean success = userServices.deleteListVendors(vendorReg);
		System.out.print("gggfsdf");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/Vendors";
	}

	// DELETE ListOfComments....
	@RequestMapping(value = "/deleteListComments", method = RequestMethod.GET)
	public String deleteListComments(@RequestParam("contact_id") int contact_id) {
		ContactUs contact = new ContactUs();
		contact.setContact_id(contact_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteListComments(contact);
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/comments";
	}

	@RequestMapping(value = "/deleteAddmembers", method = RequestMethod.GET)
	public String deleteListAddMembers(@RequestParam("family_member_id") int family_member_id) {
		AddFamilyMembers addmember = new AddFamilyMembers();
		addmember.setFamily_member_id(family_member_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteAddMembers(addmember);
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/AddMembers";
	}

	// Delete Hospital
	@RequestMapping(value = "/deletehospital", method = RequestMethod.GET)
	public String HospitalDelete(@RequestParam("register_hospital_id") int register_reg_id) {
		HospitalRegistration hosptlReg = new HospitalRegistration();
		hosptlReg.setRegister_reg_id(register_reg_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackage(hosptlReg);
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/registorHospitals";
	}

	// Delete Ambulances
	@RequestMapping(value = "/deleteAmbulance", method = RequestMethod.GET)
	public String AmbulanceDelete(@RequestParam("register_ambulance_id") int register_ambulance_id) {
		AmbulanceRegistration AmbulanceReg = new AmbulanceRegistration();
		AmbulanceReg.setRegister_ambulance_id(register_ambulance_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackage(AmbulanceReg);
		System.out.print("DeleteAmbulances");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/registorAmbulances";
	}

	// DeleteDoctors
	@RequestMapping(value = "/deleteDoctors", method = RequestMethod.GET)
	public String DoctorsDelete(@RequestParam("register_as_doctor_id") int register_as_doctor_id) {
		DoctorRegistration DoctorReg = new DoctorRegistration();
		DoctorReg.setRegister_as_doctor_id(register_as_doctor_id);
		@SuppressWarnings("unused")
		Boolean success = adminServices.deleteExistingPackage(DoctorReg);
		System.out.print("Delete DoctorRegistration...");
		@SuppressWarnings("unused")
		UserResponse response = new UserResponse();
		return "redirect:../admin/registorDoctors";
	}

}
