package com.realcom.helloambulance.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.dao.DoctorDao;
import com.realcom.helloambulance.dao.VendorDao;
import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;

@Service
public class DoctorService {

	@Autowired
	private DoctorDao doctorDao;
	@Autowired
	private VendorDao vendorDao;
	@Autowired
	private PasswordEncoder passwordencoder;
	//private HttpServletRequest request;

	//######################################### Doctor Registration  ###########################################
	@Transactional
	public void DoctorRegistrtaion(DoctorRegistration doctor) {
		String specialization = convertSpecializationIdToName(doctor);
		doctor.setDoctor_specialization(specialization);

		
		doctor.setStatus(AppConstants.STATUS_YES);

		Date date = new Date();
		doctor.setDate_of_register(date.toString());
		doctorDao.DoctorRegistration(doctor);
	}

	
	//************************************** Doctor Registration Completed *************************************
	
	//$$$$$$$$$$$$$$$$$$$  Code For Converting Doctor Specialization Id into Corresponding Specialization Name  (Narendra) $$$$$$$$$$$$$$$$$$$$$$$$$
	public String convertSpecializationIdToName(DoctorRegistration doctor) {

		List<DoctorSpecialization> specializationList = doctorDao.getAllDoctorSpecialization(doctor.getDoctor_degree());

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
		String specializationName = doctor.getDoctor_specialization();

		return specializationName;

	}
//*************************************************completed ********************************************
	@Transactional(readOnly = true)
	public List<DoctorSpecialization> getAllDoctorSpecialization(String doctor_degree_id) {
		return doctorDao.getAllDoctorSpecialization(doctor_degree_id);
	}

	@Transactional(readOnly = true)
	public List<DoctorDegree> getAllDoctorDegree() {
		return doctorDao.getAllDoctorDegree();
	}
	
	
	//#############Doctor Update (Narendra) ##############

	public DoctorRegistration getDoctorDetails(int vendorId) {
		return doctorDao.getDoctorDetails(vendorId);
	}

	public void updateDoctor(DoctorRegistration doctor, int vendorId) {
		doctorDao.updateDoctor(doctor,vendorId);
	}

	public Integer getDoctorDegreeByvendorId(int vendorId) {
		return doctorDao.getDoctorDegreeByvendorId(vendorId);
	}

	public String getdoctorSpecializationById(int vendorId) {
	return doctorDao.getdoctorSpecializationById(vendorId);	
	}
	
	//$$$$$$$$$$$$$$$ logic  for split specializations into individual objects (Narendra)
	public List<String> getdoctorSpecializations(int vendorId) {
		String doctorSpecialization = doctorDao.getdoctorSpecializationById(vendorId);
		
		String[] specializations = doctorSpecialization.split(",");

		ArrayList<String> specializationsList = new ArrayList<String>();

		for (int i = 0; i < specializations.length; i++) {

			specializationsList.add(specializations[i]);
		}
		return specializationsList;
		}

	
	
	public void updateDoctorSpecialization(Integer specialization, int vendorId) {
		//$$$$$$$$$  logic for adding new doctor specialization (Narendra)
		String newspecialization = "";
		Integer doctorDegree = doctorDao.getDoctorDegreeByvendorId(vendorId);
		List<DoctorSpecialization> doctorSpecializationlist=doctorDao.getAllDoctorSpecialization(doctorDegree.toString());
		String doctorSpecialization=doctorDao.getdoctorSpecializationById(vendorId);
		
		for (DoctorSpecialization specializationName : doctorSpecializationlist) {

			if (specializationName.getDoctor_specialization_id() == specialization) {

				newspecialization = doctorSpecialization
						.concat("," + specializationName.getDoctor_specialization_type());

			}
		}
		doctorDao.updateDoctorSpecialization(newspecialization,vendorId);
	}
	
	
	
	//$$$$$$$$$$$   Logic for checking doctor specialization is already available or not (Narendra)
	public String check_specialization_avail_doctor(Integer vendorId,Integer specialization) {
		

		Integer doctorDegree = doctorDao.getDoctorDegreeByvendorId(vendorId);

		String doctorSpecialization = doctorDao.getdoctorSpecializationById(vendorId);

		String[] specializationarray = doctorSpecialization.split(",");
		String specializations = "";

		List<DoctorSpecialization> doctorSpecializationlist = doctorDao.getAllDoctorSpecialization(doctorDegree.toString());

		for (DoctorSpecialization specialization2 : doctorSpecializationlist) {

			if (specialization2.getDoctor_specialization_id() == specialization) {

				specializations = specialization2.getDoctor_specialization_type();
			}
		}
		int count = 0;

		for (int i = 0; i < specializationarray.length; i++) {

			if (specializationarray[i].equals(specializations)) {

				count = 1;
			}
		}

		if (count == 0) {

			return "";
		} else {

			return "specialization with this name already exists " + "please select another specialization ";

		}
		
		
	}

	public Map<String, Object> getPackagesData(String fieldName, String searchkey, int pages, int rows, String sidx,
			String sord) {
		
		return vendorDao.getPackagesData(fieldName,searchkey, pages,  rows,  sidx, sord);
	}

}
