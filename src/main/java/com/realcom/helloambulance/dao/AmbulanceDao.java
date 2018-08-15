package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository
public class AmbulanceDao extends CommonDao<Object>{

	
	// ambulance reg(vijay)
			public void AmbulanceRegistration(AmbulanceRegistration ambulance) {
				System.out.println(ambulance);
				Object[] obj = new Object[] { ambulance.getMobile_no(), ambulance.getVendor_reg_id(),
						ambulance.getOrganization_name(), ambulance.getType_of_ambulance(), ambulance.getPurchesed_from(),
						ambulance.getVechicle_model(), ambulance.getVechicle_reg_no(), ambulance.getVechicle_engine_no(),
						ambulance.getVechicle_colour(), ambulance.getEquipments(), ambulance.getAddress(),
						ambulance.getCountry(), ambulance.getState(), ambulance.getCity(), ambulance.getPincode(),
						ambulance.getDate_of_register(), ambulance.getStatus() };
				jdbcTemplate.update(Queries.SAVE_AMBULANCE_REGISTRATION_FORM, obj);
			}

			public Integer getAmbulanceRegidByEmailId(String emailId) {
				return jdbcTemplate.queryForObject(Queries.GET_AMBULANCE_REGID_BY_EMAILID, Integer.class, emailId);
			}

			public String getVendorMobileNumberByEmailId(String emailId) {
				return jdbcTemplate.queryForObject(Queries.GET_VENDOR_MOBILENO_BY_EMAILID, String.class, emailId);
			}

			public Integer getAmbulanceRegIdByMobileNo(String mobileNumber) {
				return jdbcTemplate.queryForObject(Queries.get_AMBULANCE_REGID_BY_MOBILE_NUM, Integer.class, mobileNumber);
			}
			
			
			//############ Ambulance update  (Narednra) #############
			public AmbulanceRegistration getAmbulanceDetails(int register_ambulance_id) {
				AmbulanceRegistration ambulance = jdbcTemplate.query(Queries.GET_AMBULANCE_DETAILS,
						
						new ResultSetExtractor<AmbulanceRegistration>() {

							@Override
							public com.realcom.helloambulance.pojo.AmbulanceRegistration extractData(ResultSet rs)
									throws SQLException, DataAccessException {
								AmbulanceRegistration ambulance = new AmbulanceRegistration();
								while(rs.next()) {
									ambulance.setRegister_ambulance_id(rs.getInt("register_ambulance_id"));
									ambulance.setOrganization_name(rs.getString("organization_name"));
									ambulance.setPurchesed_from(rs.getString("purchesed_from"));
									ambulance.setVechicle_model(rs.getString("vechicle_model"));
									ambulance.setVechicle_engine_no(rs.getString("vechicle_engine_no"));
									ambulance.setVechicle_reg_no(rs.getString("vechicle_reg_no"));
									ambulance.setVechicle_colour(rs.getString("vechicle_colour"));
									ambulance.setAddress(rs.getString("address"));
									ambulance.setCountry(rs.getString(8));
									ambulance.setState(rs.getString(9));
									ambulance.setCity(rs.getString(10));
									ambulance.setPincode(rs.getString("pincode"));
								}
								
								return ambulance;
							}
						}, 
						
						register_ambulance_id);
				
				return ambulance;
			}

			public void updateambulance(AmbulanceRegistration ambulance, int register_ambulance_id) {
				System.out.println("ambulance update");
				Object[] obj= new Object[] {
						ambulance.getOrganization_name(),ambulance.getVechicle_reg_no(),ambulance.getVechicle_model(),ambulance.getVechicle_engine_no(),ambulance.getVechicle_colour(),ambulance.getPurchesed_from(),register_ambulance_id
						
				};
				jdbcTemplate.update(Queries.UPDATE_AMBULANCE_BY_VENDORID, obj);
			}

			public String getEquipmentsListOfAmbulance(int ambulance_reg_id) {
				return jdbcTemplate.queryForObject(Queries.GET_EQUIPMENTS_LIST_OF_PERTICULAR_AMBULANCE, String.class, ambulance_reg_id);
			}

			public void updateAmbulanceEquipment(String newequipment, int ambulance_reg_id) {
				jdbcTemplate.update(Queries.UPDATE_EQUIPMENT_IN_AMBULANCE, newequipment,ambulance_reg_id);
			}

}
