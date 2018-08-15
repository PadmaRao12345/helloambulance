package com.realcom.helloambulance.mapper;

	import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.realcom.helloambulance.pojo.DoctorSpecialization;

public class DoctorSpecializationRowMapper implements RowMapper<DoctorSpecialization> {

	

		
		public DoctorSpecialization mapRow(ResultSet rs, int arg1) throws SQLException {
			DoctorSpecialization doctorSpecialization = new DoctorSpecialization();
			doctorSpecialization.setDoctor_specialization_id(rs.getInt("doctor_specialization_id"));
			doctorSpecialization.setDoctor_specialization_type(rs.getString("doctor_specialization_type"));
			return doctorSpecialization;
		}
	}


