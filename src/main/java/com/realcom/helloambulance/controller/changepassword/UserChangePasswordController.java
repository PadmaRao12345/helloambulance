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
import com.realcom.helloambulance.util.ApplicationsUtil;

@Controller
@RequestMapping(value = "/user")
public class UserChangePasswordController {
	
	@Autowired
	private ChangePasswordService changePasswordService;
	
	
	// ############# Change password (Narendra) #####################

	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword(HttpServletRequest request) {

		return "changePassword";

	}

	@RequestMapping(value = "/success", method = RequestMethod.POST)
	public ModelAndView success(ModelAndView model, @RequestParam("password") String password,
			HttpServletRequest request) {

		String emailId = ApplicationsUtil.addUserName(request);

		changePasswordService.changePasswordForUser(emailId, password);

		model.setViewName("success");
		return model;
	}

	@RequestMapping(value = "/check_oldpassword_user")
	@ResponseBody
	public String check_oldpassword_user(@RequestParam String old_password, HttpServletRequest request) {
		String Email_Id = ApplicationsUtil.addUserName(request);
		return changePasswordService.checkOldpasswordForUser(old_password, Email_Id);
		
	}

	//#################### Change password Completed #################
	

}
