package com.realcom.helloambulance.services;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.dao.AmbulancesInHospitalDao;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
@Service
@Repository(value="ambulancesInHospitalServices")
@Transactional
public class AmbulancesInHospitalServices {

	@Autowired
	private AmbulancesInHospitalDao ambulancesInHospitalDao;
	
	@Autowired
	   private PasswordEncoder passwordencoder; 
	//###############################   Delete Ambulance In Hospital Page(Narendra)  ##################################
		public void deleteAmbulanceInHospital(int register_ambulance_id) {
			ambulancesInHospitalDao.deleteAmbulanceInHospital(register_ambulance_id);
		

		}
	
		//#############################  New Password For Ambulance in Hospital  (Narendra)  ##############################
		public void setPasswordPasswordForAmbulance(String email_id, String password) {
			String encodepassword = passwordencoder.encode(password);
		AmbulanceRegistration ambulance = new AmbulanceRegistration();
		ambulance.setStatus(AppConstants.STATUS_YES);
		ambulancesInHospitalDao.setPasswordForAmbulance(email_id,encodepassword,ambulance.getStatus());
		}
		
		public String isEmailExistinAmbulance(String emailId) {
			
			  boolean emailExistinAmbulance = ambulancesInHospitalDao.isEmailExistinAmbulance(emailId);
			 
			 if (emailExistinAmbulance) {
					return "A user with this emailId already exists" + "In case You have forgotten the password"
							+ "Click on the forgot password link";
				} else {
					return "";
				}
		}
		//####################### Our Ambulances for Hospital  ###################################////
		public List<AmbulanceRegistration> listOfAmbulancesforHospital(int vendorId) {
			
			
		List<AmbulanceRegistration> listOfAmbulancesforHospital = ambulancesInHospitalDao.listOfAmbulancesforHospital(vendorId);

		for (AmbulanceRegistration ambulanceRegistration : listOfAmbulancesforHospital) {
			byte[] profilepicture = ambulanceRegistration.getProfilepicture();
			if(profilepicture!=null) {
			 byte[] encodeBase64 = Base64.encodeBase64(profilepicture);
			    try {
					String base64Encoded = new String(encodeBase64, "UTF-8");
					System.out.println(base64Encoded+"base64Encoded");
			ambulanceRegistration.setImage(base64Encoded);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		return listOfAmbulancesforHospital;
		}
		//####################### end Our Ambulances for Hospital  ###################################////

			
			@Transactional
			public void AmbulanceRegstrationforHospital(AmbulanceRegistration ambulance) {
				Date date=new Date();
				ambulance.setDate_of_register(date.toString());
				ambulance.setRole(AppConstants.ROLE_AMBULANCE);
				ambulancesInHospitalDao.AmbulanceRegstrationforHospital(ambulance);
			}
			//#####################################  View profile of selected Ambulance in Hospital (Narendra)  ######################################
			public AmbulanceRegistration getAmbulanceDetailsInHospitalById(int register_ambulance_id) throws UnsupportedEncodingException {
				AmbulanceRegistration ambulance = ambulancesInHospitalDao.getAmbulanceDetailsInHospitalById(register_ambulance_id);
			byte[] profilepicture = ambulance.getProfilepicture();
			if(profilepicture!=null) {
			byte[] encodeBase64 = Base64.encodeBase64(profilepicture);
			String image = new String(encodeBase64,"UTF-8");
			ambulance.setImage(image);
			}
			return ambulance;
			}
			//********************************** View profile of selected Doctor in Hospital  Completed *********************************************
			
			
			

}
