package com.realcom.helloambulance.services;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.dao.DoctorsInHospitalDao;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;

@Service
@Repository(value = "doctorsInHospitalServices")
@Transactional

public class DoctorsInHospitalServices {
	@Autowired
	private DoctorsInHospitalDao doctorsInHospitalDao;

	@Autowired
	private PasswordEncoder passwordencoder;

	
	public void deleteDoctorInHospital(int register_as_doctor_id) {
		doctorsInHospitalDao.deleteDoctorInHospital(register_as_doctor_id);
	}

	public String isEmailExistinDoctor(String emailId) {
		// TODO Auto-generated method stub
	  boolean emailExistinDoctor = doctorsInHospitalDao.isEmailExistinDoctor(emailId);
	  if (emailExistinDoctor) {
			return "A user with this emailId already exists" + "In case You have forgotten the password"
					+ "Click on the forgot password link";
		} else {
			return "";
		}
	}
	// ############################# New Password For Doctor in Hospital (Narendra)
	// ##############################

	public void setPasswordPasswordForDoctor(String email_id, String password) {
		String encodepassword = passwordencoder.encode(password);
		DoctorRegistration doctor=new DoctorRegistration();
		doctor.setStatus(AppConstants.STATUS_YES);
		doctorsInHospitalDao.setPasswordForDoctor(email_id, encodepassword,doctor.getStatus());
	}

	// ##################################### View profile of selected Doctor in Hospital (Narendra) ######################################
	public DoctorRegistration getDoctorDetailsInHospitalById(int register_as_doctor_id)
			throws UnsupportedEncodingException {
		DoctorRegistration doctor = doctorsInHospitalDao.getDoctorDetailsInHospitalById(register_as_doctor_id);
		byte[] profilepicture = doctor.getProfilepicture();
		if (profilepicture != null) {
			byte[] encodeBase64 = Base64.encodeBase64(profilepicture);
			String image = new String(encodeBase64, "UTF-8");
			doctor.setImage(image);
		}
		return doctor;
	}

	// ####################################### Multiple Doctors Registration for Hospital (Narendra) ################################
	public void doctorRegstrationforHospital(DoctorRegistration doctor,Integer vendorId) {
		
		doctor.setVendor_reg_id(vendorId);
		doctor.setRole(AppConstants.ROLE_DOCTOR);
		Date date = new Date();
		doctor.setDate_of_register(date.toString());
		// code for convert doctor specializations based on specialization id
		List<DoctorSpecialization> specializationList = doctorsInHospitalDao
				.getAllDoctorSpecialization(doctor.getDoctor_degree());
		StringBuffer output = new StringBuffer();

		String doctor_specialization = doctor.getDoctor_specialization();
		System.out.println(doctor_specialization + "doctor_specialization");
		String[] doctor_specializationArray = doctor_specialization.split(",");

		Integer[] intarray = new Integer[doctor_specializationArray.length];

		for (int i = 0; i < doctor_specializationArray.length; i++) {

			intarray[i] = Integer.parseInt(doctor_specializationArray[i]);

		}
		for (DoctorSpecialization doctorSpecialization : specializationList) {

			for (Integer specialization : intarray) {

				if (doctorSpecialization.getDoctor_specialization_id() == specialization) {

					String doctor_specialization_type = doctorSpecialization.getDoctor_specialization_type();

					output.append(doctor_specialization_type + ",");
				}
			}
		}

		int lastIndex = output.lastIndexOf(",");

		String specialization = output.deleteCharAt(lastIndex).toString();

		doctor.setDoctor_specialization(specialization);

		
		doctorsInHospitalDao.doctorRegstrationforHospital(doctor);
	}

	public List<DoctorRegistration> listOfDoctorsforHospital(int vendorId) {

		List<DoctorRegistration> listOfDoctorsforHospital = doctorsInHospitalDao.listOfDoctorsforHospital(vendorId);

		for (DoctorRegistration doctorRegistration : listOfDoctorsforHospital) {
			byte[] profilepicture = doctorRegistration.getProfilepicture();
			if (profilepicture != null) {
				byte[] encodeBase64 = Base64.encodeBase64(profilepicture);
				try {
					String base64Encoded = new String(encodeBase64, "UTF-8");
					System.out.println(base64Encoded + "base64Encoded");
					doctorRegistration.setImage(base64Encoded);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		return listOfDoctorsforHospital;
	}
}
