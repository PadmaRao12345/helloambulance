package com.realcom.helloambulance.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.ChangePasswordDao;

@Service
public class ChangePasswordService {
	
	
	@Autowired
	private ChangePasswordDao changePasswordDao;
	@Autowired
	PasswordEncoder passwordencoder;
	
	//##################### Change Vendor Password (Narendra)######################
	public void changeVendorPassword(int vendorId, String password) {
		changePasswordDao.changehospitalPassword(vendorId,passwordencoder.encode(password));
	}

	//Logic for Check old password entered is match with Password in DataBase Or Not (Narendra)
	public String checkOldpassword(String old_password, String email_Id) {
		String encodepassword = changePasswordDao.getPasswordByuseridforvendor(email_Id);
		boolean matches = passwordencoder.matches(old_password, encodepassword);
		System.out.println(encodepassword+"encodepassword");
		System.out.println(matches);
		
		if (matches== false) {
			return "incorrect password";

		} else {
			return "";
		}
	}

	//************************************ Change password Completed ********************************************

	
	//############### Change password for user(Narendra)  ##################
	
	
			@Transactional
			public void changePasswordForUser(String emailId, String password) {
				String encodepassword = passwordencoder.encode(password);

				changePasswordDao.changePasswordForUser(emailId, encodepassword);
			}
				
			
			public String checkOldpasswordForUser(String old_password, String email_Id) {

				String encodepassword = changePasswordDao.getPasswordByuserid(email_Id);

				boolean matches = passwordencoder.matches(old_password, encodepassword);
				if (matches== false) {
					return "incorrect password";

				} else {
					return "";
				}

			//	userDao.checkOldpassword(encodepassword, email_Id);

			}
			
			
			
			
			
			
				//############### Change user password completed ###############s
			

}
