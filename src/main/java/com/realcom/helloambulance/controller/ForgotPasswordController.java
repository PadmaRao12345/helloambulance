package com.realcom.helloambulance.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.services.MailService;
import com.realcom.helloambulance.services.UserServices;
import com.realcom.helloambulance.services.VendorServices;
//Narednra
@Controller
public class ForgotPasswordController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private VendorServices vendorService;
	
	@Autowired
	UserServices userService;
	
	//################################    forgot password for vendor  (Narendra)  ####################################################
	@RequestMapping(value="/forgotPasswordforvendor")
	public String forgotPasswordforvendor()
	
	{
		return "forgotPasswordforvendor";
	}
	
	

	@RequestMapping(value="/resetPasswordforvendor", method=RequestMethod.POST)
	public String resetRequestForVendor(String email_id)
	{
		//check if the email id is valid and registered with us.
		mailService.sendMailForVendorForgotpassword(email_id);
		return "checkMail";
	}
	
	
@RequestMapping(value="/newPasswordforvendor/{email_id}")
	public String resetPasswordForVendor(@PathVariable String email_id,Map<String,String> model)
	{
		//check if the email id is valid and registered with us.
		model.put("email_id", email_id);
		return "newPasswordforvendor";
	}


@RequestMapping(value = "/resetvendorpasswordSuccess", method=RequestMethod.POST)
public ModelAndView resetvendorpasswordSuccess(ModelAndView model, @RequestParam("email_id") String email_id, @RequestParam("password") String password) {

System.out.println(email_id+"email_id");
vendorService.UpdatePasswordByEmailForVendor(email_id, password); 
model.setViewName("resetvendorpasswordSuccess");
return model;
}


	//################################# Forgot Password Email exists or not for vendor  (Narendra) #######################################
	

	 @RequestMapping(value="/forgotpassword_check_availEmail_vendor")
	 @ResponseBody
	 public String forgotpassword_check_availEmail(@RequestParam String email_id) {
		 if(vendorService.isEmailExist(email_id)){
			 return "";
		 }
		 else {
			 return "A user with this emailId doesn't exist";
			 							
		 }
	 }
	 
	//******************************************* Forgot password for vendor completed ******************************************
		
	 
	//###############################################Forgot password for User ###########################################################
		@RequestMapping(value="/forgotPassword")
		public String forgotPassword()
		
		{
			return "forgotPassword";
		}
		
		
		
		@RequestMapping(value="/resetPassword", method=RequestMethod.POST)
		public String resetRequest(@RequestParam(value="email_id") String email_id)
		{
			//check if the email id is valid and registered with us.
			mailService.sendMail(email_id);
			return "checkMail";
		}
		
		@RequestMapping(value="/newPassword/{email_id}")
		
		
		public String resetPassword(@PathVariable String email_id,Map<String,String> model)
		{
			//check if the email id is valid and registered with us.
			model.put("email_id", email_id);
			return "newPassword";
		}
	@RequestMapping(value = "/success", method=RequestMethod.POST)
		public ModelAndView Success(ModelAndView model, @RequestParam("email_id") String email_id, @RequestParam("password") String password) {
		userService.UpdatePasswordByEmail(email_id, password); 
		model.setViewName("success");
		return model;
		}
	


		//################################  Forgot Password Email exists or not for user  (Narendra) #######################################


	 @RequestMapping(value="/forgotpassword_check_availEmail_user")
	 @ResponseBody
	 public String forgotpassword_check_availEmail_user(@RequestParam String email_id) {
		 
		 if(userService.isEmailExist(email_id)){
			 return "";
		 }
		 else {
			 return "A user with this emailId doesn't exist";
			 							
		 }
	 }
	 
	
	//************************************ Forgot password For User Completed *************************************


}
