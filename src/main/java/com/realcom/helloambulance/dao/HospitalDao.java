package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository
public class HospitalDao extends CommonDao<Object> {

	
	// Hospital Registration (Narendra)
		public void addHospital(HospitalRegistration hospital) {
			Object[] obj = new Object[] { hospital.getHospital_name(), hospital.getHospital_reg_no(),
					hospital.getHospital_type(), hospital.getHospital_address(), hospital.getCountry(), hospital.getState(),
					hospital.getCity(),hospital.getPincode(),hospital.getHospital_website(), hospital.getNo_of_doctors(),
					hospital.getFrom_time(), hospital.getTo_time(), hospital.getEquipments(),hospital.getVendor_reg_id(),hospital.getStatus(),hospital.getDate_of_register() };

			jdbcTemplate.update(Queries.HOSPITAL_REGISTRATION, obj);
		}

		
		public HospitalRegistration getHospitalDetails(int id) {
			//HospitalRegistration hospital = jdbcTemplate.queryForObject(Queries.GET_HOSPITAL_DETAILS, HospitalRegistration.class, id);
		//	return hospital;
			HospitalRegistration hospital = jdbcTemplate.query(Queries.GET_HOSPITAL_DETAILS, 
					
					new ResultSetExtractor<HospitalRegistration>() {

						@Override
						public HospitalRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
							HospitalRegistration hospital = new HospitalRegistration();
							while(rs.next()) {
								
								hospital.setHospital_name(rs.getString(1));
								hospital.setHospital_reg_no(rs.getString(2));
								hospital.setHospital_address(rs.getString(3));
								hospital.setCountry(rs.getString(4));
								hospital.setState(rs.getString(5));
								hospital.setCity(rs.getString(6));
								hospital.setPincode(rs.getString(7));
								hospital.setHospital_website(rs.getString(8));
								hospital.setNo_of_doctors(rs.getString(9));
								hospital.setFrom_time(rs.getString(10));
								hospital.setTo_time(rs.getString(11));
								hospital.setEquipments(rs.getString(12));
							}
							return hospital;
						}
					},id
				);
			return hospital;
		}

		public HospitalRegistration getHospitalData(int vendorId) {
			HospitalRegistration hospitaldata = jdbcTemplate.query(Queries.GET_HOSPiTAL_ALL_FIELD_DATA, 
					
					new ResultSetExtractor<HospitalRegistration>() {

						@Override
						public HospitalRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
							HospitalRegistration hospital = new HospitalRegistration();
							while (rs.next()) {
								hospital.setRegister_reg_id(rs.getInt(1));
								hospital.setVendor_reg_id(rs.getInt(2));

								hospital.setHospital_name(rs.getString(3));
								hospital.setHospital_reg_no(rs.getString(4));
								hospital.setHospital_type(rs.getString(5));
								hospital.setHospital_website(rs.getString(6));
								hospital.setNo_of_doctors(rs.getString(7));
								hospital.setEquipments(rs.getString(8));
								hospital.setHospital_address(rs.getString(9));
								hospital.setCountry(rs.getString(10));
								hospital.setState(rs.getString(11));
								hospital.setCity(rs.getString(12));
								hospital.setPincode(rs.getString(13));
								hospital.setDate_of_register(rs.getString(14));
								hospital.setStatus(rs.getString(15));
								hospital.setFrom_time(rs.getString(16));
								hospital.setTo_time(rs.getString(17));

							}
							return hospital;
						}
					},vendorId
					);
			return hospitaldata;
			
		}
		//Update Hospital details
		public void updateHospitalDetails(HospitalRegistration hospital,int vendorId) {
			Object[] obj=new Object[] {hospital.getHospital_name(),hospital.getHospital_website(),hospital.getNo_of_doctors(),hospital.getFrom_time(),hospital.getTo_time(),vendorId};
			jdbcTemplate.update(Queries.UPDATE_HOSPITAL_DETAILS,obj);
		}
		public String getEquipmentsListOfHospital(int vendorId) {

			return jdbcTemplate.queryForObject(Queries.GET_EQUIPMENTS_LIST_OF_PERTICULAR_HOSPITAL, String.class, vendorId);
		}

		public void updateEquipment(String newequipment,int vendorid) {
			jdbcTemplate.update(Queries.UPDATE_EQUIPMENT_IN_HOSPITAL, newequipment,vendorid);
		}

		//Get Equipment List(Narendra)
		public List<Equipments> getEquipmentList() {
			List<Equipments> equipmentList = jdbcTemplate.query(Queries.GET_EQUIPMENT_lIST, 
					
					new RowMapper<Equipments>() {

						@Override
						public Equipments mapRow(ResultSet rs, int rowNum) throws SQLException {
							
							Equipments equipments = new Equipments();
							equipments.setEquipments_id(rs.getInt(1));
							equipments.setEquipment_name(rs.getString(2));
							return equipments;
						}
					}
					);
			
			return equipmentList;
		}

}
