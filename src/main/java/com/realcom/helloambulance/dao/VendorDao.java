package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.mapper.DoctorDegreeRowMapper;
import com.realcom.helloambulance.mapper.DoctorSpecializationRowMapper;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.Register_As;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository
public class VendorDao extends CommonDao<Object> {


	// vendor registration(Narendra)
	public void vendorregistration(VendorRegistration vendor) {

		/*
		 * String register_as = vendor.getRegister_as(); String
		 * role="ROLE_VENDOR,ROLE_"+register_as+""; String role="ROLE_VENDOR";
		 * vendor.setRole(role);
		 */
		Object[] obj = new Object[] { vendor.getName(), vendor.getEmail_id(), vendor.getMobile_no(),
				vendor.getPassword(), vendor.getDate_of_birth(), vendor.getGender(), vendor.getBlood_group(),
				vendor.getRegister_as(), vendor.getDate_of_register(), vendor.getRemarks(), vendor.getVendor_status(),
				vendor.getOtp(), vendor.getRole()

		};

		jdbcTemplate.update(Queries.SAVE_VENDOR_REGISTRATION_FORM, obj);
	}

	@SuppressWarnings("deprecation")
	public boolean getVendorStatus(String email, String code) {
		int status = jdbcTemplate.queryForInt(Queries.GET_VENDER_STATUS, new Object[] { email, code });

		if (status != 0) {
			return true;
		} else {
			return false;
		}
	}

	public VendorRegistration getProfileDataByEmailId(String email) {
		return jdbcTemplate.queryForObject(Queries.GET_VENDER_PROFILE_DETAILS_BY_EMAILID, new Object[] { email },
				new BeanPropertyRowMapper<VendorRegistration>(VendorRegistration.class));
	}

	public void activateGoAccount(String emailId, String code) {
		jdbcTemplate.update(Queries.ACTIVATE_VENDOR_GOACCOUNT, new Object[] { emailId, code });

	}

	// Email exists or not (Narendra)
	public boolean isEmailExist(String emailId) {
		System.out.println(emailId + "email in dao");
		Integer count = jdbcTemplate.queryForObject(Queries.GET_EMAIL_EXIST_OR_NOT_VENDOR, new Object[] { emailId },
				Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}

	// mobile number exists or not (Narendra)
	public boolean isMobileExist(String mobileNumber) {
		Integer count = jdbcTemplate.queryForObject(Queries.SELECT_MOBILE_EXIST_FOR_VENDOR,
				new String[] { mobileNumber }, Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}
//retrive register as list (Narendra)
	public List<Register_As> getRegisterAs() {

		List<Register_As> register_list = jdbcTemplate.query(Queries.GET_REGISTER_AS_LIST, new RowMapper<Register_As>() {

			@Override
			public Register_As mapRow(ResultSet rs, int rowNum) throws SQLException {
				Register_As register_As = new Register_As();
					register_As.setRegister_As_Id(rs.getInt(1));
					register_As.setRegister_type(rs.getString(2));

				return register_As;
			}
		});
		return register_list;
	}
	
	public List<DoctorSpecialization> getAllDoctorSpecialization(String doctor_degree_id) {
		return jdbcTemplate.query(Queries.SELECT_BY_DOCTORSPECIALIZATION,
				new DoctorSpecializationRowMapper(),doctor_degree_id);
	}
	
	public List<DoctorDegree> getAllDoctorDegree() {
		 List<DoctorDegree> degreelist = jdbcTemplate.query(Queries.SELECT_BY_DOCTORDEGREE, new DoctorDegreeRowMapper());
		 System.out.println(degreelist+"degree list");
return degreelist;
	}
//Narendra

	public int getLoginUserId(String emailId) {
		return jdbcTemplate.queryForObject(Queries.GET_LOGIN_USER_ID,Integer.class,emailId);
		//jdbcTemplate.queryForInt(Queries.GET_LOGIN_USER_ID, emailId, Integer.class);
	}

	
	public Boolean getDoctorStatus(int vendorId) {
	Integer count = jdbcTemplate.queryForObject(Queries.GET_DOCTOR_STATUS,Integer.class, vendorId);
	if(count==1)
			return true;
		else 
			return false;
					
	}

	//Narendra
	public String getRegisterTypeById(String register_as) {
		
		String registerType = jdbcTemplate.queryForObject(Queries.GET_REGISTERTYPE_BY_ID, String.class, register_as);
	return registerType;
	}

	public String getvendorRole(int vendorId) {
		return jdbcTemplate.queryForObject(Queries.GET_VENDOR_ROLE_BY_ID, String.class, vendorId);
	}

	public Boolean getAmbulanceStatus(int vendorId) {
		Integer count = jdbcTemplate.queryForObject(Queries.GET_AMBULANCE_STATUS,Integer.class, vendorId);
		if(count==1)
				return true;
			else 
				return false;
		
		
	}

	public Boolean getHospitalStatus(int vendorId) {
		Integer count = jdbcTemplate.queryForObject(Queries.GET_HOSPITAL_STATUS,Integer.class, vendorId);
		if(count==1)
				return true;
			else 
				return false;
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
	

	

	
		// VENDOR PROFIILE DETAILS

		@SuppressWarnings("unchecked")
		public Map<String, Object> getProfileDetails(String emailId) {
			SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
					.withProcedureName(Queries.GET_VENDOR_PROFILE_DETAILS);
			Map<String, Object> inParam = new HashMap<String, Object>();

			inParam.put("emailID", emailId);
			Map<String, Object> resultSet = simpleJdbcCall.execute(inParam);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("profileDetails", (List<Map<String, Object>>) resultSet.get("#result-set-1"));
			System.out.println(map + "data");
			return map;
		}

	
		public List<DoctorRegistration> getDoctorProfileDetails(int vendorId) {
			List<DoctorRegistration> doctor = jdbcTemplate.query(Queries.GET_DOCTOR_PROFILE_DETAILS,
					
					new RowMapper<DoctorRegistration>() {

				

						@Override
						public DoctorRegistration mapRow(ResultSet rs, int rowNum) throws SQLException {
							DoctorRegistration  doctordetails = new DoctorRegistration();
							
	/*						doctordetails.setRegister_as_doctor_id(rs.getInt());
	*/						doctordetails.setVendor_reg_id(rs.getInt(1));
							doctordetails.setDoctor_degree(rs.getString(2));
							doctordetails.setDoctor_specialization(rs.getString(3));
							doctordetails.setHospitalname(rs.getString(4));
							doctordetails.setExperience(rs.getString(5));
							doctordetails.setPractice_location(rs.getString(6));
							doctordetails.setAddress(rs.getString(7));
							doctordetails.setCountry(rs.getString(8));
							doctordetails.setState(rs.getString(9));
							doctordetails.setCity(rs.getString(10));
							doctordetails.setPincode(rs.getString(11));
							
							System.out.println(doctordetails+"dao doctor details");
							return doctordetails;
						}
					},vendorId
				);
			
			return doctor;
			
		}
		
		public List<HospitalRegistration> getHospitalProfileDetails(int vendorId) {
			List<HospitalRegistration> hospital = jdbcTemplate.query(Queries.GET_HOSPITAL_PROFILE_DETAILS,
					
					new RowMapper<HospitalRegistration>() {

				
						@Override
						public HospitalRegistration mapRow(ResultSet rs, int rowNum) throws SQLException {
							HospitalRegistration  hospitaldetails = new HospitalRegistration();
	/*		,hos.hospital_reg_no,hos.hospital_type,hos.hospital_website,hos.no_of_doctors,hos.equipments,hos.hospital_address,c.name,s.name,ci.name,hos.pincode from register_as_hospital hos,countries c ,states s,cities ci where hos.vendor_reg_id=?  and c.id=hos.country and s.id=hos.state and ci.id= hos.city 	
	*//*						hospitaldetails.setRegister_reg_id(rs.getInt(1));
					*/	hospitaldetails.setVendor_reg_id(rs.getInt(1));
						hospitaldetails.setHospital_name(rs.getString(2));
							hospitaldetails.setHospital_reg_no(rs.getString(3));
							hospitaldetails.setHospital_type(rs.getString(4));
							hospitaldetails.setHospital_website(rs.getString(5));
							hospitaldetails.setNo_of_doctors(rs.getString(6));
							hospitaldetails.setEquipments(rs.getString(7));
							hospitaldetails.setHospital_address(rs.getString(8));
							hospitaldetails.setFrom_time(rs.getString(13));
							hospitaldetails.setTo_time(rs.getString(14));
							hospitaldetails.setCountry(rs.getString(9));
							hospitaldetails.setState(rs.getString(10));
							hospitaldetails.setCity(rs.getString(11));
							hospitaldetails.setPincode(rs.getString(12));
							
							System.out.println(hospitaldetails+"dao hospital details");
							return hospitaldetails;
						}
					},vendorId
				);
			
			return hospital;
			}

		public Map<String, Object> getPackagesData(String fieldName, String searchkey, int pages, int rows, String sidx,
				String sord) {
			System.out.println(searchkey + " " + pages + " " + rows + " " + sidx + " " + sord + " " + fieldName);
			searchkey = (searchkey == null || searchkey == "") ? "All" : ("%" + searchkey.trim() + "%");
			System.out.println(searchkey + " " + pages + " " + rows + " " + sidx + " " + sord + "" + fieldName);
			System.out.println(searchkey);
		
			// To create the simpleJdbcCall object..
			SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
					.withProcedureName(Queries.UPDATE_AMBULANCE_ENTRY_DETAILS);
			System.out.println("executed..");
			
			// To call to the execute()..
			Map<String, Object> rs = jdbcCall.execute(fieldName, searchkey, pages, rows, sidx, sord);
			for (Entry<String, Object> map : rs.entrySet()) {
				System.out.println(map.getKey());
				System.out.println(map.getValue());
			}
			
			// create the map object..
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			// put the values in map object..
			
			map.put("rows", (List<Map<String, Object>>) rs.get("#result-set-1"));
			System.out.println("#result-set-1");
			map.put("totalCount",
					((Long) ((List<Map<String, Object>>) rs.get("#result-set-2")).get(0).get("total_count")).intValue());
			System.out.println("#result-set-2");
			for (Entry<String, Object> map1 : map.entrySet()) {
				System.out.println(map1.getKey());
				System.out.println(map1.getValue());
			}
			return map;
		}
		
		
				
			//####################################  Forgot Password for Vendor (Narendra) ###################################			
							
				public void UpdatePasswordByEmailForVendor(String email_id, String encodepassword) {
								
					jdbcTemplate.update(Queries.RESET_PASSWORD_FOR_VENDOR, new Object[] {encodepassword,email_id});
							}
				//*************************************** Forgot Password For Vendor Completed *******************************************

				public String  getvendorGendor(int vendorId) {
					return jdbcTemplate.queryForObject(Queries.Get_vendor_Gendor_By_VendorID, String.class,vendorId);
				}
				
	//############################# Our Ambulance In Ambulance Page (Narendra)  ###############################
	
	public List<AmbulanceRegistration> getAmbulanceProfileDetails(int vendorId) {
		List<AmbulanceRegistration> ambulance = jdbcTemplate.query(Queries.GET_AMBULANCE_PROFILE_DETAILS,
				
				new RowMapper<AmbulanceRegistration>() {

			

					@Override
					public AmbulanceRegistration mapRow(ResultSet rs, int rowNum) throws SQLException {
						AmbulanceRegistration  ambulancedetails = new AmbulanceRegistration();
						
					ambulancedetails.setRegister_ambulance_id(rs.getInt(1));
					ambulancedetails.setVendor_reg_id(rs.getInt(2));
						ambulancedetails.setOrganization_name(rs.getString(3));
						String type_of_ambulance = rs.getString(4);
						if(type_of_ambulance.equals("1"))
							ambulancedetails.setType_of_ambulance("ALS");
						if(type_of_ambulance.equals("2"))
						ambulancedetails.setType_of_ambulance("BLS");
						ambulancedetails.setPurchesed_from(rs.getString(5));
						ambulancedetails.setVechicle_model(rs.getString(6));
						ambulancedetails.setVechicle_reg_no(rs.getString(7));
						ambulancedetails.setVechicle_engine_no(rs.getString(8));
						ambulancedetails.setVechicle_colour(rs.getString(9));
						ambulancedetails.setEquipments(rs.getString(10));
						ambulancedetails.setAddress(rs.getString(11));
						ambulancedetails.setCountry(rs.getString(12));
						ambulancedetails.setState(rs.getString(13));
						ambulancedetails.setCity(rs.getString(14));
						ambulancedetails.setPincode(rs.getString(15));
						ambulancedetails.setGender(rs.getString("gender"));
						
						return ambulancedetails;
					}
				},vendorId
			);
		
		return ambulance;
		
	}
	

	public AmbulanceRegistration getAmbulanceProfileDetialsById(int register_ambulance_id) {
		AmbulanceRegistration ambulance = jdbcTemplate.query(Queries.GET_AMBULANCE_DETAILS_BY_AMBULANCEID,

				new ResultSetExtractor<AmbulanceRegistration>() {

					@Override
					public AmbulanceRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
						AmbulanceRegistration ambulance = new AmbulanceRegistration();
						while (rs.next()) {
ambulance.setOrganization_name(rs.getString("organization_name"));
ambulance.setType_of_ambulance(rs.getString("type_of_ambulance"));
ambulance.setVechicle_colour(rs.getString("vechicle_colour"));
ambulance.setVechicle_engine_no(rs.getString("vechicle_engine_no"));
ambulance.setVechicle_reg_no(rs.getString("vechicle_reg_no"));
ambulance.setVechicle_model(rs.getString("vechicle_model"));
ambulance.setEquipments(rs.getString("equipments"));
						}
						return ambulance;
					}
				},register_ambulance_id);
		return ambulance;
	}

	public void deleteDoctorInHospital(int register_as_doctor_id) {
		jdbcTemplate.update(Queries.DELETE_DOCTOR_IN_HOSPITAL_PAGE,register_as_doctor_id);
	}
	
	//******************************** Our Ambulance In Ambulance Page Completed ************************************

public Integer getCountOfEmailInVendor(String emailId) {
return jdbcTemplate.queryForObject(Queries.GET_COUNT_OF_EMAILID_IN_VENDORTABLE, Integer.class, emailId);	
}

public Integer getCountOfEmailInDoctor(String emailId) {
	return jdbcTemplate.queryForObject(Queries.GET_COUNT_OF_EMAILID_IN_DOCTORTABLE, Integer.class, emailId);	
}

public Integer getCountOfEmailInAmbulance(String emailId) {
	return jdbcTemplate.queryForObject(Queries.GET_COUNT_OF_EMAILID_IN_AMBULANCETABLE, Integer.class, emailId);
}

public void ambulanceRegistrationInAmbulance(AmbulanceRegistration ambulance) {
	
	Object[] obj = new Object[] { ambulance.getRegister_ambulance_id(), ambulance.getVendor_reg_id(),
			ambulance.getType_of_ambulance(), ambulance.getPurchesed_from(), ambulance.getVechicle_model(),
			ambulance.getVechicle_reg_no(), ambulance.getVechicle_engine_no(), ambulance.getVechicle_colour(),
			ambulance.getEquipments(), ambulance.getAddress(), ambulance.getCountry(), ambulance.getState(),
			ambulance.getCity(), ambulance.getPincode(), ambulance.getDate_of_register(), ambulance.getStatus(),
			ambulance.getName(), ambulance.getEmail_id(), ambulance.getPassword(), ambulance.getProfilepicture(),
			ambulance.getGender(),ambulance.getRole() };
	jdbcTemplate.update(Queries.SAVE_AMBULANCE_REGISTRATION_FORM_FOR_AMBULANCE, obj);
}

public void deleteAmbulanceInAmbulance(int register_ambulance_id) {
jdbcTemplate.update(Queries.DELETE_AMBULANCE_IN_AMBULANCE_PAGE,register_ambulance_id);
}


//#############################  New Password For Ambulance in Hospital  (Narendra)  ##############################
public void setPasswordForAmbulance(String email_id, String password,String status) {
	jdbcTemplate.update(Queries.SET_PASSWORD_FOR_AMBULANCE, new Object[] {password,status,email_id});
	
}
//****************************  New Password For Ambulance in Hospital Completed  *******************************

//Email exists or not in ambulance (vijay)
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

}
