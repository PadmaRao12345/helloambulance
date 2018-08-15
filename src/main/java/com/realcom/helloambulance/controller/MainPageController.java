package com.realcom.helloambulance.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulace.constants.AppConstants;
import com.realcom.helloambulance.pojo.BloodGroup;
import com.realcom.helloambulance.pojo.Cities;
import com.realcom.helloambulance.pojo.Mail;
import com.realcom.helloambulance.pojo.Register_As;
import com.realcom.helloambulance.pojo.States;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.services.ContactServices;
import com.realcom.helloambulance.services.Mailer;
import com.realcom.helloambulance.services.UserServices;
import com.realcom.helloambulance.services.VendorServices;
import com.realcom.helloambulance.util.ApplicationUtil;
import com.realcom.helloambulance.util.ApplicationsUtil;

@Controller
public class MainPageController {


	// vijay
	@Autowired
	Mailer emailMail;

	// Narendra
	@Autowired
	private VendorServices vendorServices;

	@Autowired
	ApplicationsUtil ApplicationsUtil;

	@Autowired
	ContactServices contactServices;

	// Rakesh
	@Autowired
	UserServices userServices;

	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(Locale locale, Model model,HttpSession httpsession) throws UnsupportedEncodingException {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		

		byte[] blob =userServices.getSlide();
		  byte[] encodeBase64 = Base64.encodeBase64(blob);
		    String base64Encoded = new String(encodeBase64, "UTF-8");
	System.out.println(base64Encoded+"slid from controller");
		  httpsession.setAttribute("slide1", base64Encoded);
		  
		  byte[] blob2 =userServices.getSlide2();
		  byte[] encodeBase642 = Base64.encodeBase64(blob2);
		    String base64Encoded2 = new String(encodeBase642, "UTF-8");
	System.out.println(base64Encoded2+"slid2 from controller");
		  httpsession.setAttribute("slide2", base64Encoded2);
		  
		  byte[] blob3 =userServices.getSlide3();
		  byte[] encodeBase643 = Base64.encodeBase64(blob3);
		    String base64Encoded3 = new String(encodeBase643, "UTF-8");
	System.out.println(base64Encoded3+"slid3 from controller");
		  httpsession.setAttribute("slide3", base64Encoded3);
		  
	  

	
	  byte[] blob4 =userServices.getSlide4();
	  byte[] encodeBase644 = Base64.encodeBase64(blob4);
	    String base64Encoded4 = new String(encodeBase644, "UTF-8");
System.out.println(base64Encoded4+"slid4 from controller");
	  httpsession.setAttribute("slide4", base64Encoded4);
	  
  
return "main-page";
	}

	/*@RequestMapping(value = "/")
	public ModelAndView slides(ModelAndView model,HttpSession session,HttpServletRequest request,HttpSession httpsession) throws UnsupportedEncodingException {
	
	byte[] blob =userServices.getSlide(1);
	  byte[] encodeBase64 = Base64.encodeBase64(blob);
	    String base64Encoded = new String(encodeBase64, "UTF-8");
System.out.println(base64Encoded+"slid from controller");
	  httpsession.setAttribute("PIC", base64Encoded);
	  
	  model.setViewName("main-page");
		return model;
	}*/
	
	

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public ModelAndView userLogin(ModelAndView model) {
		model.setViewName("user-page");
		return model;
	}

	@RequestMapping(value = "/userlogout")
	public ModelAndView userLogout(ModelAndView model) {
		model.setViewName("userlogout");
		return model;
	}

	@RequestMapping(value = "/about_us")
	public ModelAndView aboutUs(ModelAndView model) {
		model.setViewName("about-us");
		return model;
	}

	@RequestMapping(value = "/vendor/login", method = RequestMethod.POST)
	public ModelAndView vendorLogin(ModelAndView model) {
		model.setViewName("vendorhomepage");
		return model;
	}

	@RequestMapping(value = "/vendorlogout")
	public ModelAndView vendorLogout(ModelAndView model) {
		model.setViewName("vendorlogout");
		return model;
	}

	/*
	 * @RequestMapping(value = "/vendorlogout") public ModelAndView
	 * userLogoutSuccess(ModelAndView model) { model.setViewName("userlogout");
	 * return model; }
	 */
	@RequestMapping(value = "/vendorlogin")
	public ModelAndView vendorlogin(ModelAndView model) {
		model.setViewName("vendorlogin");
		return model;
	}
	
	//////////////////////slides in mainpage (vijay)//////////////////////////
/*	@RequestMapping(value = "/",method=RequestMethod.POST)
    public ModelAndView slides(HttpServletRequest request,MainpageSlides uploadSlides, final @RequestParam CommonsMultipartFile[] attachFileObj) {
	 String slider_id = ApplicationsUtil.addUserName(request);
		System.out.println(slider_id);
		System.out.println("varma method");
		int id = uploadServices.GetId(slider_id);
		System.out.println(id);

		
		Boolean userExist = uploadServices.UserExistOrNot(id);
	 String slide_name = request.getParameter("slide_name");
		

	 if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
            for (CommonsMultipartFile aFile : attachFileObj) {
                if(aFile.isEmpty()) {
                    continue;
                } else {
                	System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
                    if (!aFile.getOriginalFilename().equals("")) {
                    	//UploadImage uploadimage = new UploadImage();
                    	
                     
                    	uploadSlides.setSlide_name(aFile.getBytes());
                    	uploadSlides.setSlide_caption(slide_caption);
                    	uploadSlides.setslide_button(slide_button);//for getting foreign key
                    	uploadSlides.setslide_order(slide_order);
                        // Calling The database Method To Save The Uploaded File In The Db
                    	if(userExist!=true) {
                     uploadServices.saveUploadImage(uploadSlides);
                    	}if(userExist==true) {
                    		 uploadServices.UpdateUploadImage(uploadSlides,id);
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
     
         ModelAndView modelViewObj = new ModelAndView("success","messageObj","Thank You! The File(s) Is Successfully Uploaded!");
 	     
 	        return  modelViewObj; 

 }
*/
	///////////////////////////////////////----------------------------////////////////////////////
	@RequestMapping("/registration")
	public ModelAndView vendorRegisterpage(ModelAndView model) {

		System.out.println("hii");
		model.setViewName("vendorregister");
		return model;
	}

	@RequestMapping("/vendorRegistration")
	public ModelAndView vendorRegister(VendorRegistration vendor, ModelAndView model) {

		// vendor.setVendor_status("1");
		vendor.setRemarks("0");

		Date date = new Date();
		vendor.setDate_of_register(date.toString());

		vendor.setOtp(ApplicationUtil.generateCode());
		System.out.println("otp " + vendor.getOtp());
		System.out.println(vendor.getRegister_as() + "register as");

		String registertype = vendorServices.getRegistertypeById(vendor.getRegister_as());
		vendor.setRole("ROLE_VENDOR,ROLE_" + registertype.toUpperCase());
		vendor.setRegister_as(registertype.toUpperCase());

		/* List<Register_As> registerList = vendorServices.getRegisterList(); */
		/*
		 * for (Register_As register_As : registerList) {
		 * 
		 * if(Integer.parseInt(vendor.getRegister_as())==register_As.getRegister_As_Id()
		 * ) {
		 * vendor.setRole("ROLE_VENDOR,ROLE_"+register_As.getRegister_type().toUpperCase
		 * ()); vendor.setRegister_as(register_As.getRegister_type().toUpperCase()); }
		 * 
		 * }
		 */
		System.out.println(vendor.getRole() + "role in controller");
		/* String register_as = vendor.getRegister_as(); */
		/*
		 * vendor.setRole(AppConstants.ROLE_VENDOR);
		 * if(vendor.getRegister_as().equals("0"))
		 * vendor.setRole(AppConstants.ROLE_DOCTOR);
		 * if(vendor.getRegister_as().equals("1"))
		 * vendor.setRole(AppConstants.ROLE_AMBULANCE);
		 * if(vendor.getRegister_as().equals("2"))
		 * vendor.setRole(AppConstants.ROLE_HOSPITAL);
		 * 
		 */
		if (vendor.getRegister_as().equals("0"))
			vendor.setRegister_as("DOCTOR");
		if (vendor.getRegister_as().equals("1"))
			vendor.setRegister_as("AMBULANCE");
		if (vendor.getRegister_as().equals("2"))
			vendor.setRegister_as("HOSPITAL");

		vendorServices.vendorRegistration(vendor);
		System.out.println(vendor);

		model.addObject("vendor", vendor);
		model.setViewName("vendorAccontActivate");

		Mail mail = new Mail();
		mail.setMailFrom("SUBWAYTRAFFIC");
		mail.setMailTo(vendor.getEmail_id());
		mail.setMailSubject("Activate Account-HelloAmbulance.com");
		mail.setTemplateName("activateVendorAccount.vm");
		emailMail.welcomevendorEmail(mail, vendor);

		return model;
	}

	// *********** Activate vendor Account(Narednra) **********###########

	@RequestMapping(value = "/activateVendor-account", method = RequestMethod.POST)
	public ModelAndView activateVendorAccount(@RequestParam("email") String email,
			@RequestParam("oneTimePassword") String oneTimePassword) {

		System.out.println(" in activate account");
		if (vendorServices.getVendorStatus(email, oneTimePassword)) {
			vendorServices.activateGoAccount(email, oneTimePassword);
			// UserRegistration user = new UserRegistration();
			VendorRegistration vendor = vendorServices.getProfileDataByEmailId(email);
			Mail mail = new Mail();
			mail.setMailFrom("HELLOAMBULANCE");
			mail.setMailTo(vendor.getEmail_id());
			mail.setMailSubject("WELCOME TO Hello Ambulance");
			mail.setTemplateName("welcome_vendor.vm");
			emailMail.welcomevendorEmail(mail, vendor);
			return new ModelAndView("vendoractivationsuccess");
		} else {
			return new ModelAndView("redirect:linkexpired");
		}
	}

	// ****************Email exists or not for vendor (Narendra)************

	@RequestMapping(value = "/check_availEmail_vendor")
	@ResponseBody
	public String check_availEmail(@RequestParam String email_id) {
		if (vendorServices.isEmailExist(email_id)) {
			return "A user with this emailId already exists " + "In case You have forgotten the password "
					+ "Click on the forgot password link";
		} else {
			return "";
		}
	}

	// *************Mobile exists or not for vendor(Narendra) ***********
	@RequestMapping(value = "/check_mobile_avail_vendor")
	@ResponseBody
	public String check_mobile_avail_vendor(@RequestParam String mobile_no) {
		if (vendorServices.isMobileExist(mobile_no)) {
			return "A user with this mobilenumber already exists " + "please enter another mobile number ";
		} else {
			return "";
		}
	}

	// *******************************

	// get Register_as List (Narendra )
	@RequestMapping(value = "/loadRegisterAsList", headers = "Accept=*/*", method = RequestMethod.GET)
	public @ResponseBody List<Register_As> getRegisterAsList() {
		System.out.println("hii register");
		return vendorServices.getRegisterList();

	}

	// *******************************

	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public ModelAndView adminLogin(ModelAndView model) {
		model.setViewName("adminhomepage");
		return model;
	}

	@RequestMapping(value = "/adminlogout", method = RequestMethod.POST)
	public ModelAndView adminLogout(ModelAndView model) {
		model.setViewName("main-page");
		return model;
	}

	@RequestMapping(value = "/adminlogin")
	public ModelAndView adminlogin(ModelAndView model) {
		model.setViewName("adminlogin");
		return model;
	}

	// errorpages-varma

	@RequestMapping(value = "/userlogin/error") // to show the user error page
	public ModelAndView userloginerror(ModelAndView model) {
		model.setViewName("user-error");
		return model;
	}

	@RequestMapping(value = "/vendorlogin/error") // to show the vendor error page
	public ModelAndView vendorloginerror(ModelAndView model) {
		model.setViewName("vendor-error");
		return model;
	}

	@RequestMapping(value = "/adminlogin/error") // to show the admin error page
	public ModelAndView adminloginerror(ModelAndView model) {
		model.setViewName("admin-error");
		return model;
	}

	@RequestMapping("403")
	public String ge403denied() {
		return "redirect:login?denied";

	}

	@RequestMapping("/errors/404")
	protected String error404() {
		return "404";
	}

	@RequestMapping("/errors/500")
	protected String error500() {
		return "500";
	}

	// (vijay)...county_state_city_bloodgroup
	@RequestMapping(value = "/loadStates", headers = "Accept=*/*", method = RequestMethod.GET)
	public @ResponseBody List<States> loadStates(@RequestParam("countryId") String countryId) {
		return userServices.getAllStates(countryId);
	}

	@RequestMapping(value = "/loadCities", headers = "Accept=*/*", method = RequestMethod.GET)
	public @ResponseBody List<Cities> loadCities(@RequestParam("stateId") String stateId) {
		System.out.println();
		return userServices.getAllCities(stateId);

	}

	@RequestMapping(value = "/loadBloodGroup", headers = "Accept=*/*", method = RequestMethod.GET)
	public @ResponseBody List<BloodGroup> loadBloodGroup() {
		return userServices.getAllBloodGroup();
	}

	// county_state_city_bloodgroup(end)

	/**************************************
	 * email exits (VIJAY)
	 ********************************************/

	@RequestMapping(value = "/check_avail")
	@ResponseBody
	public String check_avail(@RequestParam String emailId) {
		if (userServices.isEmailExist(emailId)) {
			return "A user with this emailId already exists" + "In case You have forgotten the password"
					+ "Click on the forgot password link";
		} else {
			return "";
		}
	}

	/**************************************
	 * check_mobile_avail(VIJAY)
	 ********************************************/

	@RequestMapping(value = "/check_mobile_avail")
	@ResponseBody
	public String check_mobile_avail(@RequestParam String mobileNumber) {
		if (userServices.isMobileExist(mobileNumber)) {
			return "A user with this mobilenumber already exists" + "In case You have forgotten the password"
					+ "Click on the forgot password link";
		} else {
			return "";
		}
	}

	// radharukmini

	@RequestMapping(value = "/contact-us")
	public ModelAndView contactUs(ModelAndView model) {
		model.setViewName("contact-us");
		return model;

	}
	// contact us data insertion ///

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String ContactUs(@Validated com.realcom.helloambulance.pojo.ContactUs contact, Model model) {
		Date date = new Date();
		contact.setDate_of_message(date.toString());
		System.out.println(contact.getName());
		System.out.println(contact.getEmail());
		System.out.println(contact.getMessage());

		contactServices.saveContactUs(contact);

		return "main-page";

	}

	@RequestMapping(value = "/usersuccess", method = RequestMethod.POST)
	public ModelAndView saveUserRegistration(@ModelAttribute("user") UserRegistration user, ModelAndView model) {
		/*
		 * @SuppressWarnings("static-access")
		 * 
		 * @RequestMapping(value = "/main-page", method = RequestMethod.POST) public
		 * UserRegistration user(@Validated
		 * com.realcom.helloambulance.pojo.UserRegistration user,Model model) {
		 */

		// Date date=new Date();
		// user.setDate_of_register(date.toString());

		// Users_Status//
		/*
		 * user.setUser_status("1"); user.setRemarks("0");
		 */
		// password encryption and decryption//
		/*
		 * String Password=ApplicationsUtil.getPwd(); String
		 * encPwd=ApplicationUtil.doEncode(Password); user.setPassword(encPwd);
		 */

		/* genrate otp */

		user.setDate_of_register(ApplicationUtil.dateFormatLong());
		user.setRole(AppConstants.ROLE_USER);
		// user.setPassword(ApplicationUtil.encodeInBCryptPasswordEncoder(user.getPassword()));
		user.setOtp(ApplicationUtil.generateCode());
		user.setUser_status(ApplicationUtil.stringToInt(AppConstants.STATUS_NO));
		user.setRemarks(ApplicationUtil.stringToInt(AppConstants.MSG));

		// String otp=ApplicationsUtil.getToken();
		// user.setOtp(otp);

		System.out.println(user.getName());
		System.out.println(user.getMobile_number());
		System.out.println(user.getEmail_id());
		System.out.println(user.getPassword());
		System.out.println(user.getDate_of_birth());
		System.out.println(user.getGender());
		System.out.println(user.getBlood_group());
		System.out.println(user.getCountry());
		System.out.println(user.getState());
		System.out.println(user.getCity());
		System.out.println(user.getPincode());
		System.out.println(user.getUser_status());
		System.out.println(user.getOtp());
		System.out.println(user.getRole());
		System.out.println(user.getRemarks());
		System.out.println(user.getDate_of_register());
		userServices.saveUserRegistraion(user);

		/*
		 * model.addAttribute("name", user.getName());
		 * model.addAttribute("mobile_number", user.getMobile_number());
		 * model.addAttribute("email_id", user.getEmail_id());
		 * model.addAttribute("password", user.getPassword());
		 * model.addAttribute("date_of_birth", user.getDate_of_birth());
		 * model.addAttribute("gender", user.getGender());
		 * model.addAttribute("blood_group", user.getBlood_group());
		 * model.addAttribute("country", user.getCountry()); model.addAttribute("state",
		 * user.getState()); model.addAttribute("city", user.getCity());
		 * model.addAttribute("pincode", user.getPincode());
		 * model.addAttribute("user_status", user.getUser_status());
		 * model.addAttribute("otp", user.getOtp()); model.addAttribute("role",
		 * user.getRole()); model.addAttribute("remarks", user.getRemarks());
		 * model.addAttribute("date_of_register", user.getDate_of_register());
		 */

		Mail mail = new Mail();
		mail.setMailFrom("SUBWAYTRAFFIC");
		mail.setMailTo(user.getEmail_id());
		mail.setMailSubject("Activate Account-HelloAmbulance.com");
		mail.setTemplateName("activateAccount.vm");
		emailMail.welcomeEmail(mail, user);
		model.setViewName("usersuccess");
		return model;
	}

	// Activate Account
	@RequestMapping(value = "/activate-account", method = RequestMethod.POST)
	public ModelAndView activateAccount(@RequestParam("email") String email,
			@RequestParam("oneTimePassword") String oneTimePassword) {
		if (userServices.getUserStatus(email, oneTimePassword)) {
			userServices.activateGoAccount(email, oneTimePassword);
			UserRegistration user = new UserRegistration();
			user = userServices.getProfileDataByEmailId(email);
			Mail mail = new Mail();
			mail.setMailFrom("HELLOAMBULANCE");
			mail.setMailTo(user.getEmail_id());
			mail.setMailSubject("WELCOME TO HELLOAMBULANCE");
			mail.setTemplateName("welcome.vm");
			emailMail.welcomeEmail(mail, user);
			return new ModelAndView("activationsuccess");
		} else {
			return new ModelAndView("redirect:linkexpired");
		}
	}

	// Activation Success
	/*
	 * @RequestMapping(value = "/activationsuccess") public ModelAndView
	 * activationSuccess() { return new ModelAndView("activationsuccess"); }
	 */
	/**************************************
	 * user updated profile
	 ***************************/

	/*
	 * @RequestMapping(value = "UserUpdatePage") public String
	 * UserUpdatePage(HttpServletRequest request) { String emailId =
	 * ApplicationsUtil.addUserName(request); int userId =
	 * userServices.getLoginUserId(emailId);
	 * 
	 * UserRegistration ambulancedetails = userServices.getUserDetails(userId);
	 * 
	 * request.setAttribute("ambulance", ambulancedetails);
	 */
	/*
	 * return "UserUpdatePage";
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value = "/updateUser", method = RequestMethod.POST) public
	 * String updateAmbulance(AmbulanceRegistration ambulance, HttpServletRequest
	 * request) {
	 * 
	 * String emailId = ApplicationsUtil.addUserName(request);
	 * 
	 * int vendorId = userServices.getLoginUserId(emailId);
	 * 
	 * userServices.updateAmbulance(ambulance, vendorId);
	 * 
	 * return "UpdateSuccess"; }
	 */

	@RequestMapping(value = "/trielmap") /////end,start,search priovided view page
	public ModelAndView examplemap(ModelAndView model) throws IOException {
	  model.setViewName("googlemap"); 
	  return model; 
	  }
	
/*	@RequestMapping(value = "/current_location") 
	public ModelAndView currentlocation(ModelAndView model) throws IOException {
	  model.setViewName("currentlocation"); 
	  return model; 
	  }
	*/
	
	
}
