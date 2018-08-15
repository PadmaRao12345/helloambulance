package com.realcom.helloambulance.services;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.GridDao;

@Repository(value = "gridServices")
public class GridServices {

	@Autowired
	GridDao gridDao;

	// To get the packages to the GridDao data
	@Transactional
	public Map<String, Object> getPackagesData(String searchField, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getPackagesData(searchField, searchKey, page, rows, sidx, sord);
	}

	// To get the vender data
	@Transactional
	public Map<String, Object> getVendersData(String searchField, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getVendersData(searchField, searchKey, page, rows, sidx, sord);
	}

	// To get the equipments data
	@Transactional
	public Map<String, Object> getEquipmentsData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getEquipmentsData(fieldName, searchKey, page, rows, sidx, sord);
	}

	// To get the Registors data
	public Map<String, Object> getregistorData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getregistorData(fieldName, searchKey, page, rows, sidx, sord);
	}

	// To get the Doctors Data
	public Map<String, Object> getDoctorData(String fieldName, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getDoctorData(fieldName, searchKey, page, rows, sidx, sord);
	}

	// To get the DoctorSpecialization Data..
	public Map<String, Object> getDoctorSpecializationData(String fieldName, String searchKey, int page, int rows,
			String sidx, String sord) {
		return gridDao.getDoctorSpecializationData(fieldName, searchKey, page, rows, sidx, sord);
	}

	// To get the commentsData..
	@Transactional
	public Map<String, Object> getCommentsData(String searchField, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getCommentsData(searchField, searchKey, page, rows, sidx, sord);
	}

	// Ambulance Services List
	public Map<String, Object> getAmbulanceData(String searchField, String searchParam, int page, int rows, String sidx,
			String sord) {
		return gridDao.getAmbulanceData(searchField, searchParam, page, rows, sidx, sord);
	}

	// Hospital Services List....
	public Map<String, Object> getHospitalData(String searchField, String searchParam, int page, int rows, String sidx,
			String sord) {
		return gridDao.getHospitalData(searchField, searchParam, page, rows, sidx, sord);
	}

	// Doctors Services List....
	public Map<String, Object> getDoctorsData(String searchField, String searchParam, int page, int rows, String sidx,
			String sord) {
		return gridDao.getDoctorsData(searchField, searchParam, page, rows, sidx, sord);
	}

	// AddMembersData
	public Map<String, Object> getAddMembersData(String searchField, String searchKey, int page, int rows, String sidx,
			String sord) {
		return gridDao.getAddMembersData(searchField, searchKey, page, rows, sidx, sord);
	}
}
