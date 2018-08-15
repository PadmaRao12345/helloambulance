package com.realcom.helloambulance.mapper;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.realcom.helloambulance.pojo.Cities;

public class CityRowMapper implements RowMapper<Cities> {

	public Cities mapRow(ResultSet rs, int arg1) throws SQLException {
		Cities cities = new Cities();
		cities.setCityId(rs.getInt("cid"));
		cities.setCityName(rs.getString("cname"));
		cities.setCityStateId(rs.getString("cstate_id"));
		return cities;
		}
		}