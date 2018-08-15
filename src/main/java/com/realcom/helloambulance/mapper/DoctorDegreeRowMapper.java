package com.realcom.helloambulance.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.realcom.helloambulance.pojo.DoctorDegree;

public class DoctorDegreeRowMapper implements RowMapper<DoctorDegree> {

	
	public DoctorDegree mapRow(ResultSet rs, int arg1) throws SQLException {
		DoctorDegree doctordegree = new DoctorDegree();
		doctordegree.setDoctor_degree_id(rs.getInt("doctor_degree_id"));
		doctordegree.setDoctor_degree(rs.getString("doctor_degree"));
		return doctordegree;
	}
}
