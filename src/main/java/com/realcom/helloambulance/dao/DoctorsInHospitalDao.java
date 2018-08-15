package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.mapper.DoctorSpecializationRowMapper;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;
@Repository(value="doctorsInHospitalDao")
public class DoctorsInHospitalDao extends CommonDao<Object> {

	
	
	public boolean isEmailExistinDoctor(String emailId) {
		System.out.println(emailId + "email in dao");
		Integer count = jdbcTemplate.queryForObject(Queries.GET_EMAIL_EXIST_OR_NOT_DOCTOR, new Object[] { emailId },
				Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
		}
	public void deleteDoctorInHospital(int register_as_doctor_id) {
		jdbcTemplate.update(Queries.DELETE_DOCTOR_IN_HOSPITAL_PAGE,register_as_doctor_id);
	}
	//###############################New Password For Doctor in Hospital (Narendra) ##########################
	
	public void setPasswordForDoctor(String email_id,String password,String status) {
		jdbcTemplate.update(Queries.SET_PASSWORD_FOR_DOCTOR, new Object[] {password,status,email_id});
	}
	
//***********************   New Password For Doctor in Hospital Completed ***************************
	
	// ###################################### Add Multiple Doctors in Hospital(Narendra)  ###############################
		public void doctorRegstrationforHospital(DoctorRegistration doctor) {
		
			
			Object[] obj = new Object[] { doctor.getVendor_reg_id(),doctor.getDoctor_name(),doctor.getEmail_id(),doctor.getDoctor_degree(), doctor.getDoctor_specialization(),
					doctor.getHospitalname(), doctor.getExperience(), doctor.getPractice_location(), doctor.getAddress(),
					doctor.getCountry(), doctor.getState(), doctor.getCity(), doctor.getPincode(),
					doctor.getDate_of_register(),doctor.getStatus(),doctor.getGender(),doctor.getRole()};
			
			jdbcTemplate.update(Queries.SAVE_DOCTOR_REGISTRATION_FORM_FOR_HOSPITAL,obj);

			
		}
		
	public DoctorRegistration getDoctorDetailsInHospitalById(int register_as_doctor_id) {
		DoctorRegistration doctor = jdbcTemplate.query(Queries.GET_DOCTOR_PROFILE_DETAILS_IN_HOSPITAL_BY_ID, 

				new ResultSetExtractor<DoctorRegistration>() {

					@Override
							public DoctorRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
					DoctorRegistration doctor = new DoctorRegistration();
					while(rs.next()) {
						doctor.setDoctor_name(rs.getString("doctor_name"));
						doctor.setDoctor_specialization(rs.getString("doctor_specialization"));
						doctor.setExperience(rs.getString("experience"));
						doctor.setProfilepicture(rs.getBytes("profilepicture"));
						doctor.setHospitalname(rs.getString("hospital_name"));
						doctor.setGender(rs.getString("gender"));
						doctor.setCity(rs.getString("city"));
					}
						
								return doctor;
							}
				},register_as_doctor_id
				);
		return doctor;					
						}
		//***********************************  Add Multiple Doctors For Hospital Completed **********************************************************

	public List<DoctorSpecialization> getAllDoctorSpecialization(String doctor_degree_id) {
		return jdbcTemplate.query(Queries.SELECT_BY_DOCTORSPECIALIZATION,
				new DoctorSpecializationRowMapper(),doctor_degree_id);
	}
	
	//################################## Our Doctors in Hospital (Narendra)  ####################################
	
	public List<DoctorRegistration> listOfDoctorsforHospital(int vendorId) {

		List<DoctorRegistration> doctorList = jdbcTemplate.query(Queries.LIST_OF_DOCTORS_FOR_HOSPITAL,
new ResultSetExtractor<List<DoctorRegistration>>() {

	@Override
	public List<DoctorRegistration> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		ArrayList<DoctorRegistration> doctorsList = new ArrayList<DoctorRegistration>();
	
		while(rs.next()) {
		DoctorRegistration doctorRegistration = new DoctorRegistration();
		doctorRegistration.setDoctor_name(rs.getString("doctor_name"));
		doctorRegistration.setRegister_as_doctor_id(rs.getInt("register_as_doctor_id"));
		doctorRegistration.setVendor_reg_id(rs.getInt("vendor_reg_id"));
		doctorRegistration.setDoctor_degree(rs.getString("doctor_degree"));
		doctorRegistration.setDoctor_specialization(rs.getString("doctor_specialization"));
		doctorRegistration.setHospitalname(rs.getString("hospital_name"));
		doctorRegistration.setExperience(rs.getString("experience"));
		doctorRegistration.setGender(rs.getString("gender"));
		doctorRegistration.setProfilepicture(rs.getBytes("profilepicture"));
		doctorsList.add(doctorRegistration);
		
		
	}
		return doctorsList;
	}
},vendorId
				
				
		);
		return doctorList;
	}

//****************************************** Our Doctors in Hospital completed **************************************************
	
	
}
