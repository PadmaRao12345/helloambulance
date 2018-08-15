package com.realcom.helloambulance.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository(value = "gridDao")
public class GridDao extends CommonDao<Object> {

	// .....................USERS Packages Details.......................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getPackagesData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName(Queries.UPDATE_PACKAGE_ENTRY_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
		return map;
	}

	// getVendorsData...
	@SuppressWarnings("unchecked")
	public Map<String, Object> getVendersData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName(Queries.UPDATE_Vendor_ENTRY_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println("#result-set-1");
		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
		return map;
	}

	// ............EQUIPMENTS Packages Details...........//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getEquipmentsData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.LIST_OF_GET_EQUIPMENTLIST);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		System.out.println(rs);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println(map);

		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());

		return map;
	}

	// ...............REGISTORTYPE Packages Details..........................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getregistorData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName(Queries.LIST_OF_ADMIN_REGISTORTYPE);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		System.out.println(rs);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println(map);
		return map;
	}

	// ..................Packages Details...................................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getCommentsData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.JQGRID_COMMENTS_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		return map;
	}

	// ......................DAO Grid Ambulances .......................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getAmbulanceData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.UPDATE_Ambulance_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println("#result-set-1");
		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
		return map;
	}

	// .............DOCTORDEGREE Packages Details....................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getDoctorData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.LIST_OF_GET_DOCTOR_DEGREE);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		System.out.println(rs);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println(map);
		return map;
	}

	// ................DOCTORSPECIALIZATIONS PackageDtls
	// ...........................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getDoctorSpecializationData(String fieldName, String searchKey, int page, int rows,
			String sidx, String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName(Queries.LIST_OF_GET_DOCTORSPECIALIZATION);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		System.out.println(rs);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println(map);
		return map;
	}

	// ..............Get The Hospitals Dtls..................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getHospitalData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.UPDATE_Hospital_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println("#result-set-1");
		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
		System.out.println("#result-set-2");
		return map;
	}

	// ...................Get the DoctorDtls........................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getDoctorsData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.UPDATE_Doctors_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println("#result-set-1");
		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
		return map;
	}

	// ................getAddMemberds ..........................//

	@SuppressWarnings("unchecked")
	public Map<String, Object> getAddMembersData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		searchKey = (searchKey == null || searchKey == "") ? "All" : ("%" + searchKey.trim() + "%");
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.UPDATE_ADDMEMBERS_DETAILS);
		Map<String, Object> rs = jdbcCall.execute(fieldName, searchKey, page, rows, sidx, sord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
		System.out.println("#result-set-1");
		map.put("totalCount",
				((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
		return map;
	}

}