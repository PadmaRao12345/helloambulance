package com.realcom.helloambulance.mapper;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.realcom.helloambulance.pojo.BloodGroup;

public class BloodGroupRowMapper implements RowMapper<BloodGroup> {
	public BloodGroup mapRow(ResultSet rs, int arg1) throws SQLException {
		BloodGroup BloodGroup = new BloodGroup();
		BloodGroup.setBloodGroupId(rs.getInt("bloodGroupId"));
		BloodGroup.setBloodGroupName(rs.getString("bloodGroupName"));
		return BloodGroup;
	}

}