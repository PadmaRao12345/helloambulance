package com.realcom.helloambulance.dao;

import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository
public class ChangePasswordDao extends CommonDao<Object> {
	
	//##################### Change Vendor Password (Narendra)######################
	public void changehospitalPassword(int vendorId, String password) {
		jdbcTemplate.update(Queries.CHANGE_HOPSITAL_PASSWORD, new Object[] {password,vendorId});
	}

	public String getPasswordByuseridforvendor(String email_Id) {
		return jdbcTemplate.queryForObject(Queries.GET_PASSWORD_BY_USER_ID_VENDOR, String.class, email_Id);
	}

	
	//******************************  Change password Completed   *************************************	
	
	// ################## Change password user(Narendra) ##################

		public void changePasswordForUser(String emailId, String password) {

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
		
}
