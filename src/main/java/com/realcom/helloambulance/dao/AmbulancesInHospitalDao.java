package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;
@Repository(value="ambulancesInHospitalDao")
public class AmbulancesInHospitalDao extends CommonDao<Object> {

	
	//###############################   Delete Ambulance In Hospital Page(Narendra)  ##################################
	public void deleteAmbulanceInHospital(int register_ambulance_id) {
	jdbcTemplate.update(Queries.DELETE_AMBULANCE_IN_HOSPITAL_PAGE,register_ambulance_id);
	}

	//#############################  New Password For Ambulance in Hospital  (Narendra)  ##############################
	public void setPasswordForAmbulance(String email_id, String password,String status) {
		jdbcTemplate.update(Queries.SET_PASSWORD_FOR_AMBULANCE, new Object[] {password,status,email_id});
		
	}
	

	// Email exists or not in ambulance (vijay)
	public boolean isEmailExistinAmbulance(String emailId) {
	System.out.println(emailId + "email in dao");
	Integer count = jdbcTemplate.queryForObject(Queries.GET_EMAIL_EXIST_OR_NOT_AMBULANCE, new Object[] { emailId },
			Integer.class);
	if (count == 1) {
		return true;
	} else {
		return false;
	}
	}
	public void AmbulanceRegstrationforHospital(AmbulanceRegistration ambulance) {
		Object[] obj = new Object[] { ambulance.getRegister_ambulance_id(), ambulance.getVendor_reg_id(),
				ambulance.getType_of_ambulance(), ambulance.getPurchesed_from(), ambulance.getVechicle_model(),
				ambulance.getVechicle_reg_no(), ambulance.getVechicle_engine_no(), ambulance.getVechicle_colour(),
				ambulance.getEquipments(), ambulance.getAddress(), ambulance.getCountry(), ambulance.getState(),
				ambulance.getCity(), ambulance.getPincode(), ambulance.getDate_of_register(), ambulance.getStatus(),
				ambulance.getName(), ambulance.getEmail_id(), ambulance.getPassword(), ambulance.getProfilepicture(),
				ambulance.getGender(),ambulance.getRole() };
		jdbcTemplate.update(Queries.SAVE_AMBULANCE_REGISTRATION_FORM_FOR_HOSPITAL, obj);

		}

		public AmbulanceRegistration getAmbulanceDetailsInHospitalById(int register_ambulance_id) {

		AmbulanceRegistration ambulance = jdbcTemplate.query(Queries.GET_AMBULANCE_PROFILE_DETAILS_IN_HOSPITAL_BY_ID,

				new ResultSetExtractor<AmbulanceRegistration>() {

					@Override
					public AmbulanceRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
						AmbulanceRegistration ambulance = new AmbulanceRegistration();
						while (rs.next()) {
							ambulance.setName(rs.getString("name"));
							ambulance.setType_of_ambulance(rs.getString("type_of_ambulance"));
							ambulance.setPurchesed_from(rs.getString("purchesed_from"));
							ambulance.setVechicle_reg_no(rs.getString("vechicle_reg_no"));
							ambulance.setVechicle_engine_no(rs.getString("vechicle_engine_no"));
							ambulance.setVechicle_colour(rs.getString("vechicle_colour"));
							ambulance.setEmail_id(rs.getString("email_id"));
							ambulance.setEquipments(rs.getString("equipments"));
							ambulance.setAddress(rs.getString("address"));
							ambulance.setProfilepicture(rs.getBytes("profile_picture"));
						//	ambulance.setState(rs.getString("state"));
							ambulance.setCity(rs.getString(11));
						}

						return ambulance;
					}
				}, register_ambulance_id);
		return ambulance;
		}


		
		
//////////////############################Ambulances in hospital (vijay)#######################///////////
public List<AmbulanceRegistration> listOfAmbulancesforHospital(int vendorId) {

List<AmbulanceRegistration> AmbulanceList = jdbcTemplate.query(Queries.LIST_OF_AMBULANCES_FOR_HOSPITAL,
	new ResultSetExtractor<List<AmbulanceRegistration>>() {

		@Override
		public List<AmbulanceRegistration> extractData(ResultSet rs)
				throws SQLException, DataAccessException {
			ArrayList<AmbulanceRegistration> AmbulanceList = new ArrayList<AmbulanceRegistration>();

			while (rs.next()) {
				AmbulanceRegistration AmbulanceRegistration = new AmbulanceRegistration();
				AmbulanceRegistration.setRegister_ambulance_id(rs.getInt("register_ambulance_id"));
				AmbulanceRegistration.setVendor_reg_id(rs.getInt("vendor_reg_id"));
				/*
				 * String type_of_ambulance = rs.getString(3); if(type_of_ambulance.equals("1"))
				 * AmbulanceRegistration.setType_of_ambulance("ALS");
				 * if(type_of_ambulance.equals("2"))
				 * AmbulanceRegistration.setType_of_ambulance("BLS");
				 */
				AmbulanceRegistration.setType_of_ambulance(rs.getString("type_of_ambulance"));
				AmbulanceRegistration.setPurchesed_from(rs.getString("purchesed_from"));
				AmbulanceRegistration.setVechicle_model(rs.getString("vechicle_model"));
				AmbulanceRegistration.setVechicle_reg_no(rs.getString("vechicle_reg_no"));
				AmbulanceRegistration.setVechicle_engine_no(rs.getString("vechicle_engine_no"));
				AmbulanceRegistration.setVechicle_colour(rs.getString("vechicle_colour"));
				AmbulanceRegistration.setEquipments(rs.getString("equipments"));
				AmbulanceRegistration.setAddress(rs.getString("address"));
				AmbulanceRegistration.setCountry(rs.getString("country"));
				AmbulanceRegistration.setState(rs.getString("state"));
				AmbulanceRegistration.setCity(rs.getString("city"));
				AmbulanceRegistration.setPincode(rs.getString("pincode"));
				AmbulanceRegistration.setState(rs.getString("status"));
				AmbulanceRegistration.setName(rs.getString("name"));
				AmbulanceRegistration.setEmail_id(rs.getString("email_id"));
				AmbulanceRegistration.setPassword(rs.getString("password"));
				AmbulanceRegistration.setProfilepicture(rs.getBytes("profile_picture"));
				AmbulanceRegistration.setGender(rs.getString("gender"));
				AmbulanceList.add(AmbulanceRegistration);

			}
			return AmbulanceList;
		}
	}, vendorId

);
return AmbulanceList;
}

}
