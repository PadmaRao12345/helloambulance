package com.realcom.helloambulance.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import org.springframework.util.SystemPropertyUtils;

import com.realcom.helloambulance.mapper.BloodGroupRowMapper;
import com.realcom.helloambulance.mapper.CityRowMapper;
import com.realcom.helloambulance.mapper.StateRowMapper;
import com.realcom.helloambulance.pojo.BloodGroup;
import com.realcom.helloambulance.pojo.Cities;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.States;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

//List Of Users(Rakesh)//
@Repository(value = "userDao")
public class UserDao extends CommonDao<Object> {
	// To get the UserRegistration.
	public void ListOfUserRegistration(UserRegistration user) {
		// print to the user
		System.out.println(user);
		Object[] obj = new Object[] { user.getName(), user.getMobile_number(), user.getEmail_id(), user.getPassword(),
				user.getDate_of_birth(), user.getGender(), user.getBlood_group(), user.getCountry(), user.getState(),
				user.getCity(), user.getPincode(), user.getUser_status(), user.getRole(), user.getOtp(),
				user.getRemarks(), user.getDate_of_register() };
		jdbcTemplate.update(Queries.LIST_OF_USER_REGISTRATION, obj);
	}
	// vijay..(User_Reg)
	public void saveUserRegistraion(UserRegistration user) {
		System.out.println(user);
		Object[] obj = new Object[] { user.getName(), user.getMobile_number(), user.getEmail_id(), user.getPassword(),
				user.getDate_of_birth(), user.getGender(), user.getBlood_group(), user.getCountry(), user.getState(),
				user.getCity(), user.getPincode(), user.getUser_status(), user.getRole(), user.getOtp(),
				user.getRemarks(), user.getDate_of_register() };
		jdbcTemplate.update(Queries.SAVE_USER_REGISTRATION_FORM, obj);
		@SuppressWarnings("unused")
		Object[] obj1 = new Object[] { user.getName(), user.getMobile_number(), user.getEmail_id(), user.getPassword(),
				user.getDate_of_birth(), user.getGender(), user.getBlood_group(), user.getCountry(), user.getState(),
				user.getCity(), user.getPincode(), user.getUser_status(), user.getRole(), user.getOtp(),
				user.getRemarks(), user.getDate_of_register() };
		jdbcTemplate.update(Queries.SAVE_USER_REGISTRATION_FORM1, user.getEmail_id());

	}
	// List of all states
	public List<States> getAllStates(String countryId) {
		return jdbcTemplate.query(Queries.SELECT_STATES_BY_COUNTRY, new Object[] { countryId }, new StateRowMapper());
	}
	public List<Cities> getAllCities(String stateId) {
		return jdbcTemplate.query(Queries.SELECT_CITY_BY_STATE, new Object[] { stateId }, new CityRowMapper());
	}
	public List<BloodGroup> getAllBloodGroup() {
		return jdbcTemplate.query(Queries.SELECT_BY_BLOODGROUP, new BloodGroupRowMapper());
	}
	/************************* email already exits ******************************/
	public Boolean isEmailExist(String emailId) {
		Integer count = jdbcTemplate.queryForObject(Queries.SELECT_EMAIL_EXIST, new String[] { emailId },
				Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}
	/************************* mobile already exits ******************************/
	public Boolean isMobileExist(String mobileNumber) {
		Integer count = jdbcTemplate.queryForObject(Queries.SELECT_MOBILE_EXIST, new String[] { mobileNumber },
				Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}
	// end--vijay..(User_Reg)
	// ..........................LISTOFUSERS......................................//

	// variable NoOfRecords
	int noOfRecords;
	// To create the list().
	public List<UserRegistration> list() {
		// To get the listusers from queries.
		List<UserRegistration> listusers = jdbcTemplate.query(Queries.LIST_OF_USER_REGISTRATION,
				new RowMapper<UserRegistration>() {
					@Override
					public UserRegistration mapRow(ResultSet rs, int rowNum) throws SQLException {
						// To create UserRegistration object.
						UserRegistration us = new UserRegistration();
						// get the user_registration dtls.
						us.setUser_reg_id(rs.getInt("user_reg_id"));
						us.setName(rs.getString("full_name"));
						us.setMobile_number(rs.getString("mobile_number"));
						us.setEmail_id(rs.getString("email_id"));
						us.setPassword(rs.getString("password"));
						us.setDate_of_birth(rs.getString("date_of_birth"));
						us.setGender(rs.getString("gender"));
						us.setBlood_group(rs.getString("blood_group"));
						us.setCountry(rs.getString("country"));
						us.setState(rs.getString("state"));
						us.setCity(rs.getString("city"));
						us.setPincode(rs.getString("pincode"));
						us.setUser_status(rs.getInt("user_status"));
						us.setRole(rs.getString("role"));
						us.setOtp(rs.getString("otp"));
						us.setRemarks(rs.getInt("remarks"));
						us.setDate_of_register(rs.getString("date_of_register"));
						// print the no.of UserRegistration
						System.out.println(us);
						// stored to the us
						return us;
					}
				});
		// get the listofusers size
		noOfRecords = listusers.size();
		// print the noOfRecords
		System.out.println(noOfRecords);
		// return to the listofusers
		return listusers;
	}
	// get the noOfRecords
	public int getNoOfRecords() {
		// return to the noOfRecords
		return noOfRecords;
	}
    //Delete ListUsers In Grid.....
	public Boolean deleteListUsers(UserRegistration userReg) {
		Object[] deleteListUsers = new Object[] { userReg.getUser_reg_id() };
		try {
			if (userReg.getUser_reg_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_ListUsers_FORM, deleteListUsers);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// end --List Of Users(Rakesh)//
	public UserRegistration getProfileDataByEmailId(String email) {
		return jdbcTemplate.queryForObject(Queries.GET_PROFILE_DETAILS_BY_EMAILID, new Object[] { email },
				new BeanPropertyRowMapper<UserRegistration>(UserRegistration.class));
	}
	public void activateGoAccount(String emailId, String code) {
		jdbcTemplate.update(Queries.ACTIVATE_GOACCOUNT, new Object[] { emailId, code });
	}
	@SuppressWarnings("deprecation")
	public boolean getGoUserStatus(String emailId, String code) {
		int userStatus = jdbcTemplate.queryForInt(Queries.USER_STATUS, new Object[] { emailId, code });
		if (userStatus != 0) {
			return true;
		} else {
			return false;
		}
	}

	// .................. FORGOTPASSWORD DAO............................//
	public void UpdatePasswordByEmail(String email_id, String password) {
		System.out.println(email_id);
		Object[] obj = new Object[] { password, email_id };
		System.out.println(obj);
		jdbcTemplate.update(Queries.UPDATE_FORGOTPWD_DETAILS, obj);
	}
	// End ForgotPassword Dao...

	/*// ................ CHANGE PASSWORD ................................//
	public void changePassword(String emailId, String password, UserRegistration user) {
		Object[] obj = new Object[] { password, emailId };
		jdbcTemplate.update(Queries.CHANGE_PASSWORD, obj);
	}*/
	// ........... get profile Details by using EmailId userViewProfile...........//
	@SuppressWarnings("unchecked")
	public Map<String, Object> getProfileDetails(String emailId) {
		// To Create object for SimpleJdbc
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName(Queries.GET_USER_PROFILE_DETAILS);
		Map<String, Object> inParam = new HashMap<String, Object>();
		inParam.put("emailId", emailId);
		Map<String, Object> resultSet = simpleJdbcCall.execute(inParam);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("profileDetails", (List<Map<String, Object>>) resultSet.get("#result-set-1"));
		return map;
	}
		// ............. get Profile Details by using IdAdminViewProfile...........//
		public UserRegistration getProfileDetailsbyid(String user_reg_id) {
			UserRegistration user = jdbcTemplate.query(Queries.GET_USER_DETAILS_FOR_SELECTED_USER_IN_ADMIN,
					
					new ResultSetExtractor<UserRegistration>() {
						@Override
						public UserRegistration extractData(ResultSet rs) throws SQLException, DataAccessException {
							UserRegistration user = new UserRegistration();
							while(rs.next()) {
								user.setUser_reg_id(rs.getInt("user_reg_id"));
								user.setName(rs.getString("name"));
								user.setMobile_number(rs.getString("mobile_number"));
								user.setEmail_id(rs.getString("email_id"));
								user.setDate_of_birth(rs.getString("date_of_birth"));
								user.setGender(rs.getString("gender"));
								user.setBlood_group(rs.getString("blood_group"));
								user.setCountry(rs.getString("country"));
								user.setState(rs.getString("state"));
								user.setCity(rs.getString("city"));										
							}
							return user;
						}
					},user_reg_id
					);
			System.out.println("user"+user);
			return user;
			}
// ................................ LISTOFVENDORS .....................................//
	public List<VendorRegistration> vendor() {
		List<VendorRegistration> registrations = jdbcTemplate.query(Queries.LIST_OF_Vendors,
				new RowMapper<VendorRegistration>() {
					@Override
					public VendorRegistration mapRow(ResultSet rs, int rowNum) throws SQLException {
						VendorRegistration registration = new VendorRegistration();
						registration.setVendor_id(rs.getInt("vender_reg_id"));
						registration.setName(rs.getString("name"));
						registration.setMobile_no(rs.getString("mobile_no"));
						registration.setEmail_id(rs.getString("email_id"));
						registration.setPassword(rs.getString("password"));
						registration.setDate_of_birth(rs.getString("date_of_birth"));
						registration.setGender(rs.getString("gender"));
						registration.setBlood_group(rs.getString("blood_group"));
						registration.setRegister_as(rs.getString("register_as"));
						registration.setRole(rs.getString("role"));
						registration.setVendor_status(rs.getString("Vendor_status"));
						registration.setRemarks(rs.getString("remarks"));
						registration.setDate_of_register(rs.getString("date_of_register"));
						registration.setOtp(rs.getString("otp"));
						return registration;
					}
				});
		return registrations;
	}
	// VendorProfileDtls Dao.....
	@SuppressWarnings("unchecked")
	public Map<String, Object> getVendorProfileDetailsbyid(int rid) {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName(Queries.GET_Vendor_PROFILE);
		Map<String, Object> inParam = new HashMap<String, Object>();
		inParam.put("regId", rid);
		Map<String, Object> resultSet = simpleJdbcCall.execute(inParam);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("profileDetails", (List<Map<String, Object>>) resultSet.get("#result-set-1"));
		return map;
	}
//Delete ListVendors.... 
	public Boolean deleteListVendors(VendorRegistration vendorReg) {
		Object[] deleteListVendors = new Object[] { vendorReg.getVendor_id() };
		try {
			if (vendorReg.getVendor_id() != 0) {
				jdbcTemplate.update(Queries.DELETE_ListVendors_FORM, deleteListVendors);
			} else {
				System.out.println("Error to Delete");
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// .................................END	LISTOFVENDORS...................................//

	// ############ User update (vijay) #############
	public int getLoginUserId(String emailId) {
		return jdbcTemplate.queryForObject(Queries.GET_LOGIN_USER_ID_DETAILS, Integer.class, emailId);
	}
	//..............ViewProfile DAO by using UserId..................//
	public UserRegistration getUserDetails(int userId) {
		UserRegistration user = jdbcTemplate.query(Queries.GET_USER_DETAILS,
				new ResultSetExtractor<UserRegistration>() {
					@Override
					public com.realcom.helloambulance.pojo.UserRegistration extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						UserRegistration user = new UserRegistration();
						while (rs.next()) {
							user.setUser_reg_id(rs.getInt("user_reg_id"));
							user.setName(rs.getString("name"));
							user.setMobile_number(rs.getString("mobile_number"));
							user.setEmail_id(rs.getString("email_id"));
							user.setDate_of_birth(rs.getString("date_of_birth"));
							user.setGender(rs.getString("gender"));
							user.setBlood_group(rs.getString("blood_group"));
							user.setCountry(rs.getString(8));
							user.setState(rs.getString(9));
							user.setCity(rs.getString(10));
							user.setPincode(rs.getString("pincode"));
						}
						return user;
					}
				},userId);
		return user;
	}
	//UpdateUser
	public void updateUser(UserRegistration user, int userid) {
		System.out.println("ambulance update");
		Object[] obj = new Object[] { user.getName(), user.getMobile_number(), user.getEmail_id(),
				user.getDate_of_birth(), user.getGender(), user.getBlood_group(), userid};
		jdbcTemplate.update(Queries.UPDATE_USER_BY_USERID, obj);
	}

	// ################## Change password user(Narendra) ##################
	public void changePassword(String emailId, String password) {
		Object[] obj = new Object[] { password, emailId };
		jdbcTemplate.update(Queries.CHANGE_PASSWORD, obj);
	}
	public Boolean checkOldpassword(String encodepassword, String email_Id) {
		Integer count = jdbcTemplate.queryForObject(Queries.CHECK_OLD_PASSWORD,
				new Object[] { encodepassword, email_Id }, Integer.class);
		if (count == 1) {
			return true;
		} else {
			return false;
		}
	}
	public String getPasswordByuserid(String email_Id) {
		return jdbcTemplate.queryForObject(Queries.GET_PASSWORD_BY_USER_ID, String.class, email_Id);
	}
	// ############## user change password completed ####################
	public List<States> getStates() {
		return jdbcTemplate.query(Queries.SELECT_BY_STATES,
				new ResultSetExtractor<List<States>>() {
					@Override
					public List<States> extractData(ResultSet rs) throws SQLException, DataAccessException {
					ArrayList<States> stateslist = new ArrayList<States>();
						while(rs.next()) {
						States states = new States();
						states.setStateId(rs.getInt(1));
						states.setStateName(rs.getString(2));
				stateslist.add(states);
					}	
						return stateslist;
					}
				}
				);
	}
	public List<DoctorSpecialization> getAllSpecialization() {
		return jdbcTemplate.query(Queries.SELECT_BY_Specialization,
				new ResultSetExtractor<List<DoctorSpecialization>>() {
			@Override
			public List<DoctorSpecialization> extractData(ResultSet rs) throws SQLException, DataAccessException {
			ArrayList<DoctorSpecialization> specializationlist = new ArrayList<DoctorSpecialization>();
				while(rs.next()) {
					DoctorSpecialization specialization = new DoctorSpecialization();
					specialization.setDoctor_specialization_id(rs.getInt(1));
					specialization.setDoctor_specialization_type(rs.getString(2));
					specializationlist.add(specialization);
			}	
				return specializationlist;
			}
		}
		);
	}
	public byte[] slideData() {
		 byte[] img = jdbcTemplate.queryForObject(Queries.retrieve_slides_FROM_UPLOAD_SLIDES, new RowMapper<byte[] >() {
			@Override
			public byte[] mapRow(ResultSet rs, int rowNum) throws SQLException {
            	byte[]  fg= rs.getBytes("slide_name");
            	System.out.println(fg+"dao retrieve SLIDE");
                return fg;
			}
        }
			  );
        return img;
    }
	public byte[] slideData2() {
		 byte[] img = jdbcTemplate.queryForObject(Queries.retrieve_slides2_FROM_UPLOAD_SLIDES, new RowMapper<byte[] >() {
				@Override
				public byte[] mapRow(ResultSet rs, int rowNum) throws SQLException {	
	            	byte[]  fg= rs.getBytes("slide_name");
	            	System.out.println(fg+"dao retrieve SLIDE");
	                return fg;
				}
		 }
				  );
	        return img;
	    }
	public byte[] slideData3() {
		 byte[] img = jdbcTemplate.queryForObject(Queries.retrieve_slides3_FROM_UPLOAD_SLIDES, new RowMapper<byte[] >() {
				@Override
				public byte[] mapRow(ResultSet rs, int rowNum) throws SQLException {
					
	            	byte[]  fg= rs.getBytes("slide_name");
	            	System.out.println(fg+"dao retrieve SLIDE");
	                return fg;
				}
	        }
				  );
	        return img;
	    }
	public byte[] slideData4() {
		 byte[] img = jdbcTemplate.queryForObject(Queries.retrieve_slides4_FROM_UPLOAD_SLIDES, new RowMapper<byte[] >() {
				@Override
				public byte[] mapRow(ResultSet rs, int rowNum) throws SQLException {
					
	            	byte[]  fg= rs.getBytes("slide_name");
	            	System.out.println(fg+"dao retrieve SLIDE");
	                return fg;
				}
	        }
				  );
	        return img;
	    }
	// ################## Get user Gender ##################
	public String getuserGenderById(int id) {
		String gender = jdbcTemplate.queryForObject(Queries.GET_USER_GENDER_BY_ID, String.class,id);
		return gender;
	}
	public List<HospitalRegistration> loadHospitalByCity(String cityId) {
List<HospitalRegistration> hospitalList = jdbcTemplate.query(Queries.LOAD_HOSPITALNAMES_BASED_ON_CITY, 
		new RowMapper<HospitalRegistration>() {

			@Override
			public HospitalRegistration mapRow(ResultSet rs, int rowNum) throws SQLException {
				HospitalRegistration hospital = new HospitalRegistration();
				hospital.setVendor_reg_id(rs.getInt(1));
				hospital.setHospital_name(rs.getString(2));
				//String hospitalName=rs.getString(1);
				return hospital;
			}
		},cityId
		);
return hospitalList;		
	}
	
/*	public List<DoctorRegistration> listOfDoctorsforHospital(int vendorId,String specialization) {
	
		jdbcTemplate.query(Queries.LIST_OF_DOCTORS_FOR_USER_HOSPITAL_WISE, 
				
				new PreparedStatementSetter() {
					
					@Override
					public void setValues(PreparedStatement ps) throws SQLException {
						ps.setInt(parameterIndex, x);
					}
				}
				
				, rowMapper);
		return null;
	}*/
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> listOfDoctorsforHospital(Integer vendorId,String specialization) {
		System.out.println(vendorId+"vendorid"+specialization+"specialization in dao");
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_doctordetails_by_specialization");
		
		HashMap<String, Object> inParam = new HashMap<String, Object>();
		inParam.put("vendorId", vendorId);
		inParam.put("specialization", specialization);
		Map<String, Object> resultSet = simpleJdbcCall.execute(inParam);
		Map<String, Object> map = new HashMap<String, Object>();
	map.put("listofDotors", (List<Map<String, Object>>) resultSet.get("#result-set-1"));
System.out.println("map :"+map);
		return map;
	}
	
	/*public List<DoctorRegistration> listOfDoctorsforHospital(int vendorId,String specialization) {
		System.out.println(specialization+"    specializationin dao");
Object[] obj=new Object[] {vendorId,specialization};
//Queries.LIST_OF_DOCTORS_FOR_USER_HOSPITAL_WISE,
String query="SELECT * register_as_doctor where vendor_reg_id="+vendorId+" and doctor_specialization like "+specialization+"";
		List<DoctorRegistration> doctorList = jdbcTemplate.query(query,
new ResultSetExtractor<List<DoctorRegistration>>() {

	@Override
	public List<DoctorRegistration> extractData(ResultSet rs)
			throws SQLException, DataAccessException {
		ArrayList<DoctorRegistration> doctorsList = new ArrayList<DoctorRegistration>();
	
		while(rs.next()) {
		DoctorRegistration doctorRegistration = new DoctorRegistration();
		doctorRegistration.setDoctor_name(rs.getString("doctor_name"));
		doctorRegistration.setRegister_as_doctor_id(rs.getInt("register_as_doctor_id"));
		doctorRegistration.setVendor_reg_id(rs.getInt("vendor_reg_id"));
		doctorRegistration.setDoctor_degree(rs.getString("doctor_degree"));
		doctorRegistration.setDoctor_specialization(rs.getString("doctor_specialization"));
		doctorRegistration.setHospitalname(rs.getString("hospital_name"));
		doctorRegistration.setExperience(rs.getString("experience"));
		doctorRegistration.setGender(rs.getString("gender"));
		doctorRegistration.setProfilepicture(rs.getBytes("profilepicture"));
		doctorsList.add(doctorRegistration);
		
		
	}
		return doctorsList;
	}
}
				
		);
		return doctorList;
	}*/

}

	