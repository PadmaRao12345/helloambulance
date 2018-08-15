package com.realcom.helloambulance.mapper;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.realcom.helloambulance.pojo.Countries;

public class CountryRowMapper implements RowMapper<Countries> {

public Countries mapRow(ResultSet rs, int arg1) throws SQLException {
Countries countries = new Countries();
countries.setCountry_id(rs.getInt("id"));
countries.setname(rs.getString("name"));
countries.setsortname(rs.getString("sortname"));
countries.setphonecode(rs.getInt("phonecode"));
return countries;
}
}
