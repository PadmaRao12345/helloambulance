package com.realcom.helloambulance.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.dao.VendorDao;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.Register_As;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.util.ApplicationsUtil;
//Narendra
@Service
public class VendorServices {
	
	
	@Autowired
	private VendorDao vendorDao;
	
	@Autowired
	   private PasswordEncoder passwordencoder; 
	
	
	public  Integer getVendorIdByUserName(HttpServletRequest request) {
		String emailId = ApplicationsUtil.addUserName(request);
		int vendorId = getLoginUserId(emailId);
		return vendorId;
	}
	
//vendor registration (Narendra)
	public void vendorRegistration(VendorRegistration vendor) {
		
		System.out.println(vendor.getDate_of_register());
		System.out.println(vendor.getRemarks());
		System.out.println(vendor.getVendor_status());
		
		vendor.setPassword(passwordencoder.encode(vendor.getPassword()));
		
		vendorDao.vendorregistration(vendor);
	}
	
	@Transactional(readOnly = true)
	public boolean getVendorStatus(String email, String code) {
		return vendorDao.getVendorStatus(email, code);
	}
		
	@Transactional
	public void activateGoAccount(String emailId, String code) {
		vendorDao.activateGoAccount(emailId, code);
	}
@Transactional(readOnly = true)
	public VendorRegistration getProfileDataByEmailId(String email) {
		return vendorDao.getProfileDataByEmailId(email);
	}

public boolean isEmailExist(String emailId) {
	 return vendorDao.isEmailExist(emailId);
}

public boolean isMobileExist(String mobileNumber) {
	return vendorDao.isMobileExist(mobileNumber);
}

public List<Register_As> getRegisterList(){
	
	List<Register_As> registerList = vendorDao.getRegisterAs();
	for (Register_As register_As : registerList) {
		 System.out.println(register_As.getRegister_As_Id());
		 System.out.println(register_As.getRegister_type());
	}
	return registerList;
}



public int getLoginUserId(String emailId) {
	return vendorDao.getLoginUserId(emailId);
	
}

public Boolean getDoctorStatus(int vendorId) {
	return vendorDao.getDoctorStatus(vendorId);
}

//Narendra
public String getRegistertypeById(String register_as) {
	return vendorDao.getRegisterTypeById(register_as);
}

public String getVendorRole(int vendorId) {
	return vendorDao.getvendorRole(vendorId);
}

public Boolean getambulanceStatus(int vendorId) {
	return vendorDao.getAmbulanceStatus(vendorId);
}




public List<Equipments> getEquipmentList() {
return vendorDao.getEquipmentList();

}




//To getProfileDetails to the Dao.....
@Transactional
public Map<String, Object> getProfileDetails(String emailId) {
	return vendorDao.getProfileDetails(emailId);
}





@Transactional
public List<HospitalRegistration> getHospitalProfileDetails(int vendorId) {
return vendorDao.getHospitalProfileDetails(vendorId);
}
@Transactional
public List<DoctorRegistration> getDoctorProfileDetails(int vendorId) {
return vendorDao.getDoctorProfileDetails(vendorId);
}







//#########################  Forgot Password for Vendor (Narendra) #########################################
public void UpdatePasswordByEmailForVendor(String email_id, String password) {
	String encodepassword = passwordencoder.encode(password);
	vendorDao.UpdatePasswordByEmailForVendor(email_id,encodepassword);
}

//**************************************  Forgot Password for Vendor Completed *********************************************

public String getVendorGender(int vendorId) {
return 	vendorDao.getvendorGendor(vendorId);
}



//######################## Our Ambulances in Ambulance page (Narendra) ################################
@Transactional
public List<AmbulanceRegistration> getAmbulanceProfileDetails(int vendorId) {
 List<AmbulanceRegistration> ambulanceProfileDetails = vendorDao.getAmbulanceProfileDetails(vendorId);
 
 for (AmbulanceRegistration ambulanceRegistration : ambulanceProfileDetails) {
	System.out.println(ambulanceRegistration+"hjhjhjhj");
}
return ambulanceProfileDetails;
}


public AmbulanceRegistration getAmbulanceProfileDetialsById(int register_ambulance_id) {
	 AmbulanceRegistration ambulance = vendorDao.getAmbulanceProfileDetialsById(register_ambulance_id);
if(ambulance.getType_of_ambulance().equals("1")) {
	ambulance.setType_of_ambulance("ALS");
}
else if(ambulance.getType_of_ambulance().equals("2")){
	ambulance.setType_of_ambulance("BLS");
}


return ambulance;
}
//******************************************  Our Ambulances in Ambulance page Completed *******************************

public void deleteDoctorInHospital(int register_as_doctor_id) {
vendorDao.deleteDoctorInHospital(register_as_doctor_id);	
}


	public boolean isEmailExistinAmbulance(String emailId) {
		 return vendorDao.isEmailExistinAmbulance(emailId);
	}

	//#############################  New Password For Ambulance in Hospital  (Narendra)  ##############################
	public void setPasswordForAmbulance(String email_id, String password) {
		String encodepassword = passwordencoder.encode(password);
	AmbulanceRegistration ambulance = new AmbulanceRegistration();
	ambulance.setStatus(AppConstants.STATUS_YES);
		vendorDao.setPasswordForAmbulance(email_id,encodepassword,ambulance.getStatus());
	}

	//****************************  New Password For Ambulance in Hospital Completed  *******************************
	
	public Integer getCountOfEmailInVendor(String emailId) {
return vendorDao.getCountOfEmailInVendor(emailId);		
	}

	public Integer getCountOfEmailInDoctor(String emailId) {
	return	vendorDao.getCountOfEmailInDoctor(emailId);
	}

	public Integer getCountOfEmailInAmbulance(String emailId) {
		return vendorDao.getCountOfEmailInAmbulance(emailId);
	}

	
	
	//########################### Add Multiple Ambulances in Ambulance Page (Narendra) ###############################
	public void ambulanceRegistrationInAmbulance(AmbulanceRegistration ambulance,int vendorId) {
		ambulance.setVendor_reg_id(vendorId);
		Date date=new Date();
		ambulance.setDate_of_register(date.toString());
		ambulance.setRole(AppConstants.ROLE_AMBULANCE);
vendorDao.ambulanceRegistrationInAmbulance(ambulance);		
	}
	
	public void deleteAmbulanceInAmbulance(int register_ambulance_id) {
		vendorDao.deleteAmbulanceInAmbulance(register_ambulance_id);
			

			}

}


