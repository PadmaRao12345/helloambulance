package com.realcom.helloambulance.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.realcom.helloambulance.pojo.States;

public class StateRowMapper implements RowMapper<States> {

	public States mapRow(ResultSet rs, int arg1) throws SQLException {
		States states = new States();
		states.setStateId(rs.getInt("sid"));
		states.setStateName(rs.getString("sname"));
		states.setCountryId(rs.getString("scountry_id"));
		return states;
	}
}
