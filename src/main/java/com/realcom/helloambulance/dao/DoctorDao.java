package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.mapper.DoctorDegreeRowMapper;
import com.realcom.helloambulance.mapper.DoctorSpecializationRowMapper;
import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository
public class DoctorDao extends CommonDao<Object> {

	// ######################################### Doctor Registration ###########################################
	public void DoctorRegistration(DoctorRegistration doctor) {

		Object[] obj = new Object[] { doctor.getDoctor_degree(), doctor.getDoctor_specialization(),
				doctor.getHospitalname(), doctor.getExperience(), doctor.getPractice_location(), doctor.getAddress(),
				doctor.getCountry(), doctor.getState(), doctor.getCity(), doctor.getPincode(),
				doctor.getDate_of_register(), doctor.getVendor_reg_id(), doctor.getStatus() };
		jdbcTemplate.update(Queries.SAVE_DOCTOR_REGISTRATION_FORM, obj);

	}

	// ******************************** Doctor Registration ********************************************

	public List<DoctorSpecialization> getAllDoctorSpecialization(String doctor_degree_id) {
		return jdbcTemplate.query(Queries.SELECT_BY_DOCTORSPECIALIZATION, new DoctorSpecializationRowMapper(),
				doctor_degree_id);
	}

	public List<DoctorDegree> getAllDoctorDegree() {
		List<DoctorDegree> degreelist = jdbcTemplate.query(Queries.SELECT_BY_DOCTORDEGREE, new DoctorDegreeRowMapper());
		System.out.println(degreelist + "degree list");
		return degreelist;
	}

	
	//######## Doctor Update (Narendra) ###################
	
			public DoctorRegistration getDoctorDetails(int vendorId) {
				DoctorRegistration doctor = jdbcTemplate.query(Queries.GET_DOCTOR_DETAILS,
						
						
						new ResultSetExtractor<DoctorRegistration>() {

							@Override
							public DoctorRegistration extractData(ResultSet rs)
									throws SQLException, DataAccessException {
								
								DoctorRegistration doctor = new DoctorRegistration();
								while(rs.next()) {
									doctor.setHospitalname(rs.getString("hospital_name"));
									doctor.setExperience(rs.getString("experience"));
									doctor.setPractice_location(rs.getString("practice_location"));
									doctor.setDoctor_degree(rs.getString(4));
									//doctor.setDoctor_degree(rs.getString(4));
									doctor.setAddress(rs.getString("address"));
									doctor.setCountry(rs.getString(6));
									doctor.setState(rs.getString(7));
									doctor.setCity(rs.getString(8));
									doctor.setPincode(rs.getString("pincode"));
								}
								return doctor;
							}
						}, vendorId);
				return doctor;
			}

			public void updateDoctor(DoctorRegistration doctor, int vendorId) {
				Object[] obj=new Object[] {doctor.getHospitalname(),doctor.getExperience(),doctor.getPractice_location(),vendorId};
				jdbcTemplate.update(Queries.UPDATE_DOCTOR_DETAILS_BY_VENDORID, obj);
			}

			public Integer getDoctorDegreeByvendorId(int vendorId) {
				return jdbcTemplate.queryForObject(Queries.GET_DOCTORDEGREE_BY_VENDOR_ID, Integer.class, vendorId);
			}

			public String getdoctorSpecializationById(int vendorId) {
				return jdbcTemplate.queryForObject(Queries.GET_DOCTOR_SPECIALIZATION_BY_VENDORID, String.class, vendorId);
			}

			public void updateDoctorSpecialization(String doctorSpecialization, int vendorId) {
				jdbcTemplate.update(Queries.UPDATE_DOCTOR_SPECIALIZATION, doctorSpecialization,vendorId);			
			}
}
