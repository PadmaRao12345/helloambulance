
package com.realcom.helloambulance.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.VendorUploadImage;
import com.realcom.helloambulance.services.HospitalService;
import com.realcom.helloambulance.services.MailService;
import com.realcom.helloambulance.services.UploadServices;
import com.realcom.helloambulance.services.VendorServices;
import com.realcom.helloambulance.util.ApplicationsUtil;

@Controller
@RequestMapping(value = "/vendor")
public class VendorHomePageController {

	@Autowired
	VendorServices vendorServices;
	@Autowired
	private MailService mailService;
	@Autowired
	PasswordEncoder passwordencoder;
	@Autowired
	UploadServices uploadServices;
	@Autowired
	private HospitalService hospitalService;
	// ################ Vendor After Login (Narendra) ######################
	@RequestMapping(value = "/")
	public ModelAndView vendorhomepage(ModelAndView model, HttpServletRequest request, HttpSession httpsession)
			throws UnsupportedEncodingException {

		String emailId = ApplicationsUtil.addUserName(request);
		Integer vendorcount = vendorServices.getCountOfEmailInVendor(emailId);
		Integer doctorcount = vendorServices.getCountOfEmailInDoctor(emailId);
		Integer ambulanceCount = vendorServices.getCountOfEmailInAmbulance(emailId);
		System.out.println("vendorcount" + vendorcount);
		System.out.println("doctorcount" + doctorcount);
		System.out.println("ambulanceCount" + ambulanceCount);
		if (vendorcount == 1) {
			int vendorId = vendorServices.getLoginUserId(emailId);
			String vendorGender = vendorServices.getVendorGender(vendorId);
			String vendorRole = vendorServices.getVendorRole(vendorId);

			String[] role = vendorRole.split("_");

			String roleas = role[2];

			String image = null;
			/// for profile pic
			Boolean vendorExist = uploadServices.DoctorExistOrNot(vendorId);
			if (vendorExist != false) {
				byte[] blob = uploadServices.getImagevendordoctor(vendorId);
				byte[] encodeBase64 = Base64.encodeBase64(blob);
				image = new String(encodeBase64, "UTF-8");
				System.out.println(image + "image from controller");
				httpsession.setAttribute("image", image);
				model.setViewName("vendoras" + roleas.toLowerCase());
			}
			/// end pic
			else {
				model.setViewName("vendoras" + roleas.toLowerCase());
			}
			httpsession.setAttribute("gender", vendorGender);
			return model;
		}

		if (doctorcount == 1) {
			model.setViewName("doctorpage");
		}

		if (ambulanceCount == 1) {
			model.setViewName("ambulancepage");
		}
		return model;
	}

	@RequestMapping(value = "/vendor/logout", method = RequestMethod.POST) // to vendor log out
	public ModelAndView vendorLogout(ModelAndView model) {
		model.setViewName("main-page");
		return model;
	}

	

	@RequestMapping(value = "/hosreg", method = RequestMethod.POST) // to vendor log out
	public ModelAndView HospitalRegistration(ModelAndView model) {
		model.setViewName("hosreg");
		return model;
	}

	
	@RequestMapping(value = "/ambulance_registration", method = RequestMethod.GET) // to vendor log out
	public ModelAndView AmbulanceRegistrationforambulance(ModelAndView model) {
		model.setViewName("ambulance_registration");
		return model;
	}

	// ############## open Vendor page Based On Role when Login (Narendra)  #####################
	 

	@RequestMapping(value = "/registration")
	public ModelAndView DoctorRegistration(ModelAndView model, HttpServletRequest request) {

		String emailId = ApplicationsUtil.addUserName(request);

		int vendorId = vendorServices.getLoginUserId(emailId);
System.out.println(vendorId+"vendorId");
		String vendorRole = vendorServices.getVendorRole(vendorId);

		if (vendorRole.equals(AppConstants.ROLE_DOCTOR)) {

			Boolean doctorStatus = vendorServices.getDoctorStatus(vendorId);

			if (doctorStatus == true) {

				model.setViewName("vendorasdoctor");

			} else

				model.setViewName("doctor_registration");
		}

		if (vendorRole.equals(AppConstants.ROLE_AMBULANCE)) {

			Boolean doctorStatus = vendorServices.getambulanceStatus(vendorId);

			if (doctorStatus == true) {

				model.setViewName("vendorasambulance");

			} else

				model.setViewName("ambulance_registration");
		}

		if (vendorRole.equals(AppConstants.ROLE_HOSPITAL)) {
			Boolean doctorStatus = hospitalService.gethospitalStatus(vendorId);

			if (doctorStatus == true) {

				model.setViewName("vendorashospital");

			} else {
				model.setViewName("hospital_registration");
			}
		}

		return model;
	}


	// ################# Get Profile Details (Vijay) ####################
	@RequestMapping(value = "/getProfileDetails", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getProfileDetails(HttpServletRequest request) {
		Principal principal = request.getUserPrincipal();
		System.out.println(principal.getName());
		Map<String, Object> obj = vendorServices.getProfileDetails(principal.getName());
		System.out.println(obj + "in controller");
		request.setAttribute("profile", obj);
		return obj;
	}


	@RequestMapping(value = "/DoctorProfile") // to map add user family or frndslist (viewpage)
	public ModelAndView getDoctorProfileDetails(ModelAndView model, HttpSession httpsession,
			HttpServletRequest request) {

		String emailId = ApplicationsUtil.addUserName(request);
		System.out.println(emailId + "vendorcontroller");
		int vendorId = vendorServices.getLoginUserId(emailId);
		List<DoctorRegistration> doctordetails = vendorServices.getDoctorProfileDetails(vendorId);
		System.out.println(doctordetails + "doctor details");
		httpsession.setAttribute("Doctordetails", doctordetails);

		model.setViewName("DoctorProfile");
		return model;
	}

	@RequestMapping(value = "/HospitalProfile") // to map add user family or frndslist (viewpage)
	public ModelAndView getHospitalProfileDetails(ModelAndView model, HttpSession httpsession,
			HttpServletRequest request) {

		String emailId = ApplicationsUtil.addUserName(request);
		System.out.println(emailId + "vendorcontroller");
		int vendorId = vendorServices.getLoginUserId(emailId);
		List<HospitalRegistration> hospitaldetails = vendorServices.getHospitalProfileDetails(vendorId);
		System.out.println(hospitaldetails + "hospital details");
		httpsession.setAttribute("Hospitaldetails", hospitaldetails);

		model.setViewName("HospitalProfile");
		return model;
	}


	//////////////////////////Doctor Extra Details(vijay)////////////
	@RequestMapping(value = "/add_details", method = RequestMethod.GET) // to vendor log out
	public ModelAndView addDoctorDetails(ModelAndView model) {
		model.setViewName("add_details");
		return model;
	}
	@RequestMapping(value = "/upload_profile_pic_Doctor") 
	public ModelAndView UploadImageDoctor(ModelAndView model) throws IOException {
	  model.setViewName("upload-profile-pic"); 
	  return model; 
	  }
	
/*	@RequestMapping(value = "/upload_profile_pic_Ambulance") 
	public ModelAndView UploadImageAmbulance(ModelAndView model) throws IOException {
	  model.setViewName("upload-image"); 
	  return model; 
	  }
	@RequestMapping(value = "/upload_profile_pic_Hospital") 
	public ModelAndView UploadImagehospital(ModelAndView model) throws IOException {
	  model.setViewName("upload-profile"); 
	  return model; 
	  }*/
	
	
	 @RequestMapping(value = "/uploadfile",method=RequestMethod.POST)
	    public ModelAndView saveUploadImage(HttpServletRequest request,VendorUploadImage uploadimage, final @RequestParam CommonsMultipartFile[] attachFileObj) {
		 String Email_Id = ApplicationsUtil.addUserName(request);
			System.out.println(Email_Id);
			System.out.println("varma method");
			

			int vendorId = vendorServices.getLoginUserId(Email_Id);
;
			System.out.println(vendorId);

			
			Boolean userExist = uploadServices.DoctorExistOrNot(vendorId);
		 String image_name = request.getParameter("image_name");
			
	
		 if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
	            for (CommonsMultipartFile aFile : attachFileObj) {
	                if(aFile.isEmpty()) {
	                    continue;
	                } else {
	                	System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
	                    if (!aFile.getOriginalFilename().equals("")) {
	                    	//UploadImage uploadimage = new UploadImage();
	                     
	                    	uploadimage.setFile_name(aFile.getOriginalFilename());
	                    	uploadimage.setImageName(image_name);
	                    	uploadimage.setVendor_id(vendorId);//for getting foreign key
	                    	uploadimage.setData(aFile.getBytes());
	                        // Calling The database Method To Save The Uploaded File In The Db
	                    	if(userExist!=true) {
	                     uploadServices.saveDoctorUploadImage(uploadimage);
	                    	}if(userExist==true) {
	                    		 uploadServices.UpdateDoctorUploadImage(uploadimage,vendorId);
	                    	}
	                          System.out.println("ok " );
	                    }else {
	                        System.out.println("error");
	                 	   
	                    }
	                 }

	                 System.out.println("File Is Successfully Uploaded.... \n");

	             }

	         } else {
	         	
	         }
	     
	         ModelAndView modelViewObj = new ModelAndView("uploadsuccess");
	 	     
	 	        return  modelViewObj; 

	 }

		
		//################################## Our Ambulances In Ambulance Page(view profile & Edit Profile)  (Narendra) ############################################ 

		@RequestMapping(value = "/listof-Ambulances") 
		public ModelAndView getAmbulanceProfileDetails(ModelAndView model) {
			model.setViewName("listofAmbulances");
			return model;
		}

		
		@RequestMapping(value = "/listOfAmbulanceForAmbulance")
		public @ResponseBody List<AmbulanceRegistration> getAmbulanceListByVendorId(HttpServletRequest request) {
			String emailId = ApplicationsUtil.addUserName(request);
			int vendorId = vendorServices.getLoginUserId(emailId);
			List<AmbulanceRegistration> ambulancedetails = vendorServices.getAmbulanceProfileDetails(vendorId);
			return ambulancedetails;
		}
		
		
		@RequestMapping(value="/getAmbulanceProfileDetialsById")
		public ModelAndView getAmbulanceDetialsInAmbulancePage(@RequestParam("register_ambulance_id") int register_ambulance_id,ModelAndView model) {
		AmbulanceRegistration ambulance = vendorServices.getAmbulanceProfileDetialsById(register_ambulance_id);
		System.out.println("ambulance"+ambulance);
		ambulance.setRegister_ambulance_id(register_ambulance_id);
		model.addObject("ambulance", ambulance);
		model.setViewName("ambulanceprofiledetails");
		return model;
		}

	
		 
		//**************************************   Our Ambulances In Ambulance Page Completed *********************************************
		
//############################ Add Multiple Ambulances In Ambulance Page (Narendra) ###############################

@RequestMapping(value = "/ambreg", method = RequestMethod.GET) // to vendor log out
public ModelAndView AmbulanceRegistration(ModelAndView model) {
	model.setViewName("ambreg");
	return model;
}


@RequestMapping(value="/addAmbulancesforAmbulance",method=RequestMethod.POST)
public String  ambulanceRegistrationInAmbulance(AmbulanceRegistration ambulance,HttpServletRequest request) {
	System.out.println(ambulance+"ambulance");
	String emailId = ApplicationsUtil.addUserName(request);
	int vendorId = vendorServices.getLoginUserId(emailId);
	
	vendorServices.ambulanceRegistrationInAmbulance(ambulance,vendorId);
	mailService.sendMailForAmbulancPasswordInAmbulance(ambulance.getEmail_id());
	return "hospitalSuccess";
}

@RequestMapping(value="ambulanceSuccessInAmbulance")
public String ambulanceSuccessInAmbulance() {
	return "ambulanceSuccessInAmbulance";
}

//*******************************  Add Multiple Ambulances In Ambulance Page  **********************************

//############################  New Password For Ambulance in AmbulancePage (Narendra)  ################################

@RequestMapping(value="/newPasswordforAmbulanceInAmbulance/{email_id}")
public String newPasswordforAmbulanceInAmbulance(@PathVariable String email_id,Map<String,String> model)
{
	//check if the email id is valid and registered with us.
	model.put("email_id", email_id);
	return "setPasswordforAmbulanceInAmbulance";
}



@RequestMapping(value = "/setAmbulancepasswordInAmbulanceSuccess", method=RequestMethod.POST)
public ModelAndView setAmbulancepasswordInAmbulanceSuccess(ModelAndView model, @RequestParam("email_id") String email_id, @RequestParam("password") String password) {
vendorServices.setPasswordForAmbulance(email_id, password); 
model.setViewName("setpasswordforAmbulanceSuccess");
return model;
}

//************************************** New Password For Ambulance in AmbulancePage Completed ***************************

//################################## Delete Selected Ambulance in Ambulance Page (Narendra)  #########################
@RequestMapping("/deleteAmbulanceInAmbulance")
public ModelAndView deleteAmbulanceInAmbulance(@RequestParam("register_ambulance_id") int register_ambulance_id,ModelAndView model) {
	vendorServices.deleteAmbulanceInAmbulance(register_ambulance_id);
	model.setViewName("redirect:ourAmbulancesforHospital");
	return model;
}


}