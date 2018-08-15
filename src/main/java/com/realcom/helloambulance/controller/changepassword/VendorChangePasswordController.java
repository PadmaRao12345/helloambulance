package com.realcom.helloambulance.controller.changepassword;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.services.ChangePasswordService;
import com.realcom.helloambulance.services.VendorServices;
import com.realcom.helloambulance.util.ApplicationsUtil;

@Controller
@RequestMapping("/vendor")
public class VendorChangePasswordController {
	
	@Autowired
	private ChangePasswordService changePasswordService;
	@Autowired
	private VendorServices vendorService;


	
	// ##################### Change vendor Password (Narendra)######################
		@RequestMapping(value = "/changevendorPassword")
		public ModelAndView changeVendorPassword(ModelAndView model, HttpServletRequest request) {
			int vendorId = vendorService.getVendorIdByUserName(request);

			String vendorRole = vendorService.getVendorRole(vendorId);

			String[] role = vendorRole.split("_");

			String roleas = role[2];

			model.setViewName("change" + roleas.toLowerCase() + "password");

			return model;
		}

		@RequestMapping(value = "/changevendorPasswordsuccess", method = RequestMethod.POST)

		public ModelAndView success(ModelAndView model, @RequestParam("password") String password,HttpServletRequest request) {
			int vendorId = vendorService.getVendorIdByUserName(request);
			
			changePasswordService.changeVendorPassword(vendorId,password);

			model.setViewName("vendorpasswordchangesuccess");

			return model;
		}

		
		@RequestMapping(value = "/check_oldpassword_hospital")
		@ResponseBody
		public String check_oldpassword_Vendor(@RequestParam String old_password, HttpServletRequest request) {
			
			String Email_Id = ApplicationsUtil.addUserName(request);
			
			return changePasswordService.checkOldpassword(old_password, Email_Id);
			
		}
		
		// ********************************* change vendor password competed *********************************


}
