
package com.realcom.helloambulance.services;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.UserDao;
import com.realcom.helloambulance.pojo.BloodGroup;
import com.realcom.helloambulance.pojo.Cities;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.States;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;

//User Services(Rakesh)
@Repository(value = "userServices")
@Transactional
public class UserServices {
	@Autowired
	UserDao userDao;
	@Autowired
	private PasswordEncoder passwordencoder;

	@Transactional
	public void ListOfUserRegistration(UserRegistration user) {
		userDao.ListOfUserRegistration(user);
	}
	// TO GET THE USER DAO LIST
	@Transactional
	public List<UserRegistration> list() {
		return userDao.list();
	}
	// to get the no.ofRecords from userDao.
	public int getNoOfRecords() {
		return userDao.getNoOfRecords();
	}
	// Delete ListUsers...
	public Boolean deleteListUsers(UserRegistration userReg) {
		return userDao.deleteListUsers(userReg);
	}
  
	// ........................VENDORS to the UseDao................//
	public List<VendorRegistration> Vendor() {
		List<VendorRegistration> Vendor = userDao.vendor();
		System.out.println(Vendor);
		return userDao.vendor();
	}
	// .........................ForgotPasswordServices....................//
	@Transactional
	public void UpdatePasswordByEmail(String email_id, String password) {
		String encodepassword = passwordencoder.encode(password);
		userDao.UpdatePasswordByEmail(email_id, encodepassword);
	}
	/*// change password....
	@Transactional
	public void changePassword(String emailId, String password, UserRegistration user) {
		user.setPassword(passwordencoder.encode(user.getPassword()));
		userDao.changePassword(emailId, password, user);
	}*/
	// To get the GetProfile Details in Admin
	public UserRegistration getProfileDetailsbyid(String user_reg_id) {
		UserRegistration user = userDao.getProfileDetailsbyid(user_reg_id);
		return user;
	}
	// To getProfileDetails to the Dao.....
	// AdminViewProfile Dtls......
	@Transactional
	public Map<String, Object> getProfileDetails(String emailId) {
		return userDao.getProfileDetails(emailId);
	}
	
	
	// to get the userDao list
	@Transactional
	public void saveUserRegistraion(UserRegistration user) {
		user.setPassword(passwordencoder.encode(user.getPassword()));
		userDao.saveUserRegistraion(user);
	}
	@Transactional(readOnly = true)
	public List<Cities> getAllCities(String StateId) {
		return userDao.getAllCities(StateId);
	}
	@Transactional(readOnly = true)
	public List<States> getAllStates(String CountryId) {
		return userDao.getAllStates(CountryId);
	}
	@Transactional(readOnly = true)
	public List<BloodGroup> getAllBloodGroup() {
		return userDao.getAllBloodGroup();
	}
	/*********************
	 * mailid exits
	 *********************************************/
	@Transactional
	public Boolean isEmailExist(String emailId) {
		return userDao.isEmailExist(emailId);
	}

	////////////////////.............. mobile exits..........////////////
	@Transactional
	public Boolean isMobileExist(String mobileNumber) {
		return userDao.isMobileExist(mobileNumber);
	}
	@Transactional(readOnly = true)
	public UserRegistration getProfileDataByEmailId(String email) {
		return userDao.getProfileDataByEmailId(email);
	}
	@Transactional(readOnly = true)
	public boolean getUserStatus(String email, String code) {
		return userDao.getGoUserStatus(email, code);
	}
	@Transactional
	public void activateGoAccount(String emailId, String code) {
		userDao.activateGoAccount(emailId, code);
	}
    //DeleteListVendors UserServices
	public Boolean deleteListVendors(VendorRegistration vendorReg) {
		return userDao.deleteListVendors(vendorReg);
	}
	
   
    //getLoginuserId....
	public int getLoginUserId(String emailId) {
		return userDao.getLoginUserId(emailId);
	}
   //getUserDetails.....
	public UserRegistration getUserDetails(int userId) {
		return userDao.getUserDetails(userId);
	}
   //updateUser
	public void updateUser(UserRegistration user, int userid) {
		user.setName(user.getName());
		user.setMobile_number(user.getMobile_number());
		user.setEmail_id(user.getEmail_id());
		user.setDate_of_birth(user.getDate_of_birth());
		user.setGender(user.getGender());
		user.setBlood_group(user.getBlood_group());
		userDao.updateUser(user, userid);
	}

	// ############### Change password user(Narendra) ##################
	@Transactional
	public void changePassword(String emailId, String password) {
		String encodepassword = passwordencoder.encode(password);
		userDao.changePassword(emailId, encodepassword);
	}
	public boolean checkOldpassword(String old_password, String email_Id) {
		String encodepassword = userDao.getPasswordByuserid(email_Id);
		boolean matches = passwordencoder.matches(old_password, encodepassword);
		userDao.checkOldpassword(encodepassword, email_Id);
		return matches;
	}

	// ############### Change user password completed ###############s
	@Transactional(readOnly = true)
	public List<States> getStates() {
		return userDao.getStates();
	}
	@Transactional(readOnly = true)
	public List<DoctorSpecialization> getAllSpecialization() {
		return userDao.getAllSpecialization();
	}
	//TO get the slides
	public byte[] getSlide() {
		return userDao.slideData();
	}
	public byte[] getSlide2() {
		return userDao.slideData2();
	}
	public byte[] getSlide3() {
		return userDao.slideData3();
	}
	public byte[] getSlide4() {
		return userDao.slideData4();
	}

	// ############### Get User Gender ###############s
  	public String getuserGender(int id) {
		return userDao.getuserGenderById(id);
	}
	public List<HospitalRegistration> loadHospitalsByCity(String cityId) {
		return userDao.loadHospitalByCity(cityId);
	}
	
	
	/*public List<DoctorRegistration> listOfDoctorsforHospital(int vendorId,Integer specialization) {
		List<DoctorSpecialization> specializationList = userDao.getAllSpecialization();
		String specializationType=null;
		for (DoctorSpecialization doctorSpecialization : specializationList) {
			if(doctorSpecialization.getDoctor_specialization_id()==specialization) {
				specializationType=doctorSpecialization.getDoctor_specialization_type();
			}
		}
		specializationType="'%"+specializationType+"%'";
		System.out.println(specializationType+"specializationType in service");
		List<DoctorRegistration> listOfDoctorsforHospital = userDao.listOfDoctorsforHospital(vendorId,specializationType);

		for (DoctorRegistration doctorRegistration : listOfDoctorsforHospital) {
			byte[] profilepicture = doctorRegistration.getProfilepicture();
			if (profilepicture != null) {
				byte[] encodeBase64 = Base64.encodeBase64(profilepicture);
				try {
					String base64Encoded = new String(encodeBase64, "UTF-8");
					System.out.println(base64Encoded + "base64Encoded");
					doctorRegistration.setImage(base64Encoded);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		return listOfDoctorsforHospital;
	}*/
	public Map<String,Object> listOfDoctorsforHospital(Integer vendorId,Integer specialization) {
		List<DoctorSpecialization> specializationList = userDao.getAllSpecialization();
		String specializationType=null;
		if(specialization!=null) {
		for (DoctorSpecialization doctorSpecialization : specializationList) {
			if(doctorSpecialization.getDoctor_specialization_id()==specialization) {
				specializationType=doctorSpecialization.getDoctor_specialization_type();
			}
		}
		}
		if(specialization==null) {
			specializationType="";	
		}
		if(vendorId==null) {
			vendorId=0;
		}
	
		
		return userDao.listOfDoctorsforHospital(vendorId,specializationType);
	}
  	
}

