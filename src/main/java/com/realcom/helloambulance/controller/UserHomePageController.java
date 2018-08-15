package com.realcom.helloambulance.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.AddFamilyMembers;
import com.realcom.helloambulance.pojo.DoctorSpecialization;
import com.realcom.helloambulance.pojo.EmergencyBook;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.Mail;
import com.realcom.helloambulance.pojo.States;
import com.realcom.helloambulance.pojo.UploadImage;
import com.realcom.helloambulance.pojo.UserLoginHistory;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.services.AddMemberServices;
import com.realcom.helloambulance.services.EmergencyBookServices;
import com.realcom.helloambulance.services.LocationServices;
import com.realcom.helloambulance.services.Mailer;
import com.realcom.helloambulance.services.UploadServices;
import com.realcom.helloambulance.services.UserLoginHistoryServices;
import com.realcom.helloambulance.services.UserServices;
import com.realcom.helloambulance.util.ApplicationsUtil;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;

@Controller
@RequestMapping(value = "/user")
public class UserHomePageController {
	@Autowired
	Mailer emailMail;
	@Autowired
	UserServices userServices;
	@Autowired
	UserLoginHistoryServices userloginHistoryServices;
	@Autowired
	AddMemberServices addmemberservices;
	@Autowired
	PasswordEncoder passwordencoder;
	@Autowired
	UploadServices uploadServices;
	@Autowired
	LocationServices locationservices;
	@Autowired
	EmergencyBookServices emergencybookservices;
	
	/*@Autowired
	private DoctorsInHospitalServices doctorsInHospitalServices;*/
	/*private static final Logger logger = LoggerFactory.getLogger(UserHomePageController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "main-page";
	}*/

	
	@RequestMapping(value = "/")
	public ModelAndView welcomepage(ModelAndView model) {
		model.setViewName("welcome-page");
		return model;
	}

	
	@RequestMapping(value = "/user-page")
	public ModelAndView aboutUs(ModelAndView model, HttpSession session, HttpServletRequest request,
			HttpSession httpsession) throws UnsupportedEncodingException {
		System.out.println("hiii in controller");
		String Email_Id = ApplicationsUtil.addUserName(request);
		int id = userloginHistoryServices.GetId(Email_Id);
		String gender = userServices.getuserGender(id);
		List<AddFamilyMembers> listaddmembers = addmemberservices.listaddmembers(id);
	
		httpsession.setAttribute("members", listaddmembers);
		httpsession.setAttribute("gender", gender);
		Boolean userExist = uploadServices.UserExistOrNot(id);
		String base64Encoded=null;
		if(userExist!=false) {
			byte[] blob =uploadServices.getImage(id);
			  byte[] encodeBase64 = Base64.encodeBase64(blob);
			   base64Encoded = new String(encodeBase64, "UTF-8");
			  httpsession.setAttribute("PIC", base64Encoded);
			  model.setViewName("user-page");
			}
		else {
			httpsession.setAttribute("PIC", base64Encoded);
		model.setViewName("user-page");
		}
		return model;
	}
	
	
	
	@RequestMapping(value = "/Login_history")
	public ModelAndView LoginHistory(ModelAndView model,HttpSession session,UserLoginHistory userhistory,HttpServletRequest request) {
		

		UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
		Browser browser = userAgent.getBrowser();
		String Email_Id = ApplicationsUtil.addUserName(request);
		//String Emai_Id = ApplicationsUtil.addUserName(request);
		System.out.println(Email_Id);
		int id = userloginHistoryServices.GetId(Email_Id);
		System.out.println(id);

			userhistory.setReg_id(id);//for getting foreign key
			Date date = new Date();
			String SessionId = session.getId();
			
					
			if (SessionId != null && SessionId != " ") {
			userhistory.setLogin_time(date.toString());
			String ip = ApplicationsUtil.getRemortIP(request).toString();
			userhistory.setIp_address(ApplicationsUtil.getRemortIP(request));
			userhistory.setAgent(browser.getManufacturer().name());
			userhistory.setDevice(userAgent.getOperatingSystem().toString());
			userhistory.setBrowser(userAgent.getBrowser().toString());
			userhistory.setSession_id(SessionId);
			
			userhistory.setMac_address(ApplicationsUtil.getMACAddress(ip));
			userhistory.setVersion_model(userAgent.getBrowserVersion().toString());
			userloginHistoryServices.saveLoginUserHistoryServices(userhistory);
			}
		model.setViewName("redirect:/user/");
		return model;
	}
	
	@RequestMapping(value = "/timelogout", method = RequestMethod.GET)
	@ResponseBody
	public void UserhistoryLogout(HttpServletRequest request,HttpSession session) {
	String Session = session.getId();
	//String SessionId = 
	System.out.println(Session);
	Date date = new Date();

	String time = (date.toString());
	userloginHistoryServices.UpdateLogoutTime(time, Session);
	}
	
	
	
	
	
	
	@RequestMapping(value = "/current_location") ////////////current location sharing
	public ModelAndView  currentlocation(ModelAndView model) throws IOException {
	  model.setViewName("currentlocation"); 
	  return model; 
	  }
	
	
	@RequestMapping(value = "/LonLat") //////////to store lan,lon in database from the above view page(current location) 
	public  ModelAndView lonlat(@RequestParam("latitude") String latitude,@RequestParam("longitude") String longitude,ModelAndView model,EmergencyBook emergencybook,HttpServletRequest request,HttpSession session) throws IOException {
	  System.out.println(latitude+"latitude"+longitude+"longitude"  +"controller");
	 /* System.out.println(longitude+"longitude controller");*/
/*	  String Email_Id = ApplicationsUtil.addUserName(request);
		int id = userloginHistoryServices.GetId(Email_Id);
		Boolean user_id_existornot = locationservices.GetId(id);
		System.out.println("controller UserIdExistorNot"+user_id_existornot);*/
		String Session = session.getId();
		System.out.println("session controller when current location"+Session);
		if(Session!=null) {
	  
	  emergencybook.setLatitude(latitude);
	  emergencybook.setLongitude(longitude);
	
	  System.out.println("controller emergencybook lanlot values"+emergencybook);
	  locationservices.LatLon(emergencybook,Session);
	  
	  model.setViewName("currentlocation"); 
	  
		}
	  return model ; 
	  }
	
	@RequestMapping(value = "/Emergency_Book") /////emergency book view page
	public ModelAndView AutoCopmleteAddress(ModelAndView model) throws IOException {
	  model.setViewName("emergency_book_view"); 
	  return model; 
	  }
	
	
	
	@RequestMapping(value = "/emergencybook", method = RequestMethod.POST) /////sending booking details to database
	public ModelAndView emergencybook(ModelAndView model,EmergencyBook emergencybook,HttpServletRequest request,HttpSession session) throws IOException {
		System.out.println("emergencybook main controller working");
		Date date=new Date();
		String Email_Id = ApplicationsUtil.addUserName(request);
		int id = userloginHistoryServices.GetId(Email_Id);
		System.out.println("user id in controller emergency book "+id);
		String SessionId = session.getId();
		emergencybook.setSession_id(SessionId);
		
		emergencybook.setUser_id(id);
		emergencybook.setDate(date.toString());
		
		emergencybook.getUser_id();
		emergencybook.getAddress();
		emergencybook.getStreet();
		emergencybook.getCity();
		emergencybook.getState();
		emergencybook.getZipcode();
		emergencybook.getCountry();
		emergencybook.getMobile();
		emergencybook.getDate();
		emergencybook.getSession_id();
		
		System.out.println("controller emergency book insert"+emergencybook);
		emergencybookservices.emergencybook(emergencybook);
		
	  model.setViewName("EmergencyBooksuccess"); 
	  return model; 
	  
	  }
	
	
	
	
	
	@RequestMapping(value = "/emergency_booking_success") /////emergency book view page
	public ModelAndView emergencebooksuccess(ModelAndView model) throws IOException {
	  model.setViewName("Emergence_book_success"); 
	  return model; 
	  }
	
	
//login-security-varma

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)// to user log in validation
	public ModelAndView userLogin(ModelAndView model) {
		model.setViewName("user-page");
		return model;
		}

	@RequestMapping(value = "/user/logout", method = RequestMethod.POST)//to user logout
	public ModelAndView userLogout(ModelAndView model) {
		model.setViewName("main-page");
		return model;
		}
	
	@RequestMapping(value = "/about_us")
	public ModelAndView about(ModelAndView model) {
		model.setViewName("about-us");
		return model;
	}

	@RequestMapping(value = "/Blogs", method = RequestMethod.GET) // to vendor log out
	public ModelAndView Blogs(ModelAndView model) {
		model.setViewName("Blogs");
		return model;
	}
	@RequestMapping(value = "/vendor/login", method = RequestMethod.POST) //to vendor login validation
	public ModelAndView vendorLogin(ModelAndView model) {
		model.setViewName("vendorhomepage");
		return model;
		}
	@RequestMapping(value = "/vendor/logout", method = RequestMethod.POST)// to vendor log out
	public ModelAndView vendorLogout(ModelAndView model) {
		model.setViewName("main-page");
		return model;
		}
	 
	@RequestMapping(value = "/vendorlogin") //to vendor log in
	public ModelAndView vendorlogin(ModelAndView model) {
		model.setViewName("vendorlogin");
		return model;
	}
	
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)// to admin login validaton
	public ModelAndView adminLogin(ModelAndView model) {
		model.setViewName("adminhomepage");
		return model;
		}
	@RequestMapping(value = "/adminlogout", method = RequestMethod.POST) //to admin log out
	public ModelAndView adminLogout(ModelAndView model) {
		model.setViewName("main-page");
		return model;
		}
	@RequestMapping(value = "/adminlogin")//to admin login
	public ModelAndView adminlogin(ModelAndView model) {
		model.setViewName("adminlogin");
		return model;
	}
	 //login-security-end-varma
	@RequestMapping(value = "/getProfileDetails", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getProfileDetails(HttpServletRequest request){
		Principal principal = request.getUserPrincipal();
		System.out.println(principal.getName());
		Map<String, Object> obj = userServices.getProfileDetails(principal.getName());
		System.out.println(obj);
		return obj;
	}	
	@RequestMapping(value = "/Addmembers") //to map add user family or frnds (viewpage)
	public ModelAndView Addfamilyfriends(ModelAndView model) {
		model.setViewName("AddfamilyMembers");
		return model;
	}

	@RequestMapping(value = "/Addmemberuser", method = RequestMethod.POST)
	public  ModelAndView AddFamilyfriendsMembers(AddFamilyMembers add ,ModelAndView model,HttpServletRequest request ){
		String Email_Id = ApplicationsUtil.addUserName(request);
		System.out.println(Email_Id);
		System.out.println("varma method");
		int id = addmemberservices.GetId(Email_Id);
		System.out.println(id);

			add.setUser_id(id);//for getting foreign key
			Date date = new Date();
		
		add.setDate_of_register(date.toString());
		
		String userName = addmemberservices.getUserName(add.getUser_id());
		System.out.println(userName+"username");
	//UserRegistration userRegistration = new UserRegistration();
	//userRegistration.setName(userName);
		String username="hello"+userName;
		model.addObject("userreg", username);
	
		
		System.out.println(add.getUser_id());
		System.out.println(add.getRelation_type());
		System.out.println(add.getName());
		System.out.println(add.getGender());
		System.out.println(add.getDate_of_birth());
		System.out.println(add.getMobile_number());
		System.out.println(add.getBlood_group());
		System.out.println(add.getEmail_id());
		System.out.println(add.getWilling_to_donate_blood());
		System.out.println(add.getNotify_blood_request());
		System.out.println(add.getLast_donated_date());
		System.out.println(add.getWilling_to_donate_organs());
		System.out.println(add.getAddress());
		System.out.println(add.getCountry());
		System.out.println(add.getState());
		System.out.println(add.getCity());
		System.out.println(add.getPincode());
		System.out.println(add.getDesignation());
		System.out.println(add.getMarital_status());
		System.out.println(add.getFood_habit());
		System.out.println(add.getDate_of_register());
		
		addmemberservices.addMembersUserMethodService(add);
		
		
		Mail mail = new Mail();
		mail.setMailFrom("SUBWAYTRAFFIC");
		mail.setMailTo(add.getEmail_id());
		mail.setMailSubject(userName  +"Added you as a member");
		mail.setTemplateName("AddedAsMember.vm");
		
		emailMail.welcomeEmail(mail, add);	
		
		//model.setViewName("AddedAsmember");
		
		return  new ModelAndView("AddedAsmember");
		
		
	}
	
	
	
	/**************************************  addmembers  email exits (varma)  ********************************************/

	@RequestMapping(value="/check_avail_mail_addedmember")
	@ResponseBody
	public String check_avail(@RequestParam String emailId,HttpServletRequest request) {
		String Email_Id = ApplicationsUtil.addUserName(request);
		System.out.println(Email_Id);
		System.out.println("varma method");
		  int id = addmemberservices.GetId(Email_Id);
		System.out.println(id+"emailexisted");
		Boolean emailExist = addmemberservices.isEmailExist(emailId,id);
		System.out.println(emailExist+"boolean");
	if(addmemberservices.isEmailExist(emailId,id)){
	return "A user with this emailId already exists"
	+"In case You have forgotten the password"
	+"Click on the forgot password link";
	}
	else {
	return "";
	}
	}
	/**************************************   addmembers  check_mobile_avail(VIJAY) ********************************************/

	@RequestMapping(value="/check_mobile_avail_addedmember")
	@ResponseBody
	public String check_mobile_avail(@RequestParam String mobileNumber, HttpServletRequest request) {
		String Email_Id = ApplicationsUtil.addUserName(request);
		System.out.println(Email_Id);
		System.out.println("varma method");
		int id = addmemberservices.GetId(Email_Id);
		System.out.println(id+"mobilexisted");
		if(addmemberservices.isMobileExist(mobileNumber,id)){
	return "A user with this mobilenumber already exists"
	+"In case You have forgotten the password"
	+"Click on the forgot password link";
	}
	else {
	return "";
	}
	}
	/**************************************  to map add user family or frndslist (viewpage) ********************************************/

	@RequestMapping(value = "/friendslist") //to map add user family or frndslist (viewpage)
	public ModelAndView friendslist(ModelAndView model) {
		
		model.setViewName("friendlist");
		return model;
	}
	/**************************************  to map particular user and particular family or frnds details (viewpage) ********************************************/

	@RequestMapping(value = "profiledetailsAddMembers/{family_member_id}") //to map add user family or frndslist (viewpage)
	public ModelAndView friendsprofiledetails(@PathVariable("family_member_id") String name, ModelAndView model,HttpSession httpsession) {
		System.out.println(name+"path variable");
		
		 List<AddFamilyMembers> addmembersdetails = addmemberservices.addmembersdetails(name);
		 System.out.println(addmembersdetails+"details add members");
		 httpsession.setAttribute("membersdetails", addmembersdetails);
		 
		 
		
		model.setViewName("friendDetails");
		return model;
	}

	/**************************************  to map particular user and particular family or frnds update (viewpage) ********************************************/

	/*@RequestMapping(value = "deletemember/{id}", method = RequestMethod.POST) //to map add user family or frndslist (viewpage)
	public void updatemember(@PathVariable("id") String id) {
		System.out.println(id+"path variable");
		
		 addmemberservices.UpdateMember(id);

		
		
		
	}*/

	
	/**************************************  particular family or frnds update (viewpage) ***************************/

	@RequestMapping(value = "deletemember/{id}") //to map add user family or frndslist (viewpage)
	public String deletemember(@PathVariable("id") String id) {
		System.out.println(id+"path variable");
		
		 addmemberservices.UpdateMember(id);
		return "memberdeleted" ;
		  
		  
		
	
	}

	/**************************************  particular family or frnds update (viewpage) ***************************/

	@RequestMapping(value = "updatemember/{id}") //to map add user family or frndslist (viewpage)
	public ModelAndView updatemember(@PathVariable("id") int id,ModelAndView model,HttpSession httpsession) {
		System.out.println(id+"path variable");
		
	    List<AddFamilyMembers> editMember = addmemberservices.EditMember(id);
	    System.out.println(editMember);
	    httpsession.setAttribute("showdetails",editMember);
	    model.setViewName("EditmemberPage");
		return model;
		  
	}

	@RequestMapping(value = "upadatememberprofile/{id}") //to map add user family or frndslist (viewpage)
	public ModelAndView editmember(@PathVariable("id") int id,ModelAndView model,HttpSession httpsession,AddFamilyMembers addmember) {
		System.out.println(id+"path variable");
		
		System.out.println(addmember);
		
	     addmemberservices.updateMemberprofile(id,addmember);
	  /*  System.out.println(editMember);
	    httpsession.setAttribute("showdetails",editMember);*/
	    model.setViewName("updatesuccess");
		return model;
		  
	}

	/**************************************  user updated profile***************************/

	@RequestMapping(value = "UserUpdatePage")
	public String UserUpdatePage(HttpServletRequest request) {

		String emailId = ApplicationsUtil.addUserName(request);
		int userId = userServices.getLoginUserId(emailId);

		UserRegistration userdetails = userServices.getUserDetails(userId);

		request.setAttribute("user", userdetails);

		return "UserUpdatePage";

	}
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(UserRegistration user, HttpServletRequest request) {

		String emailId = ApplicationsUtil.addUserName(request);

		int userId = userServices.getLoginUserId(emailId);

		userServices.updateUser(user, userId);

		return "UserUpdateSuccess";
	}

		
		
		@RequestMapping(value = "/upload_image") 
		public ModelAndView saveUploadImage(ModelAndView model) throws IOException {
		  model.setViewName("upload-image"); 
		  return model; 
		  }
	
	 @RequestMapping(value = "/uploadfile",method=RequestMethod.POST)
	    public ModelAndView saveUploadImage(HttpServletRequest request,UploadImage uploadimage, final @RequestParam CommonsMultipartFile[] attachFileObj,ModelAndView model) {
		 String Email_Id = ApplicationsUtil.addUserName(request);
			System.out.println(Email_Id);
			System.out.println("varma method");
			int id = addmemberservices.GetId(Email_Id);
			System.out.println(id);

			
			Boolean userExist = uploadServices.UserExistOrNot(id);
		 String image_name = request.getParameter("image_name");
			
	
		 if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
	            for (CommonsMultipartFile aFile : attachFileObj) {
	                if(aFile.isEmpty()) {
	                    continue;
	                } else {
	                	System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
	                    if (!aFile.getOriginalFilename().equals("")) {
	                    	//UploadImage uploadimage = new UploadImage();
	                     
	                    	uploadimage.setFileName(aFile.getOriginalFilename());
	                    	uploadimage.setImageName(image_name);
	                    	uploadimage.setUser_id(id);//for getting foreign key
	                    	uploadimage.setData(aFile.getBytes());
	                        // Calling The database Method To Save The Uploaded File In The Db
	                    	if(userExist!=true) {
	                     uploadServices.saveUploadImage(uploadimage);
	                    	}if(userExist==true) {
	                    		 uploadServices.UpdateUploadImage(uploadimage,id);
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
	     
	         //ModelAndView modelViewObj = new ModelAndView("user-page");
	 	     model.setViewName("redirect:user-page");
	 	        return  model; 

	 }
	//############## Search Hospitals ########################////////////////////


		@RequestMapping(value = "/Hospitals", method = RequestMethod.GET) // to vendor log out
		public ModelAndView SearchHospitals(ModelAndView model) {
			model.setViewName("Hospitals");
			return model;
		}
		@RequestMapping(value = "/hospitalsearch", method = RequestMethod.POST) // to vendor log out
		public ModelAndView listHospitals(ModelAndView model) {
			model.setViewName("hospitalsearch");
			return model;
		}
		//############## Search Hospitals ########################

		
		@RequestMapping(value = "/Doctors", method = RequestMethod.GET) // to vendor log out
		public ModelAndView SearchDoctors(ModelAndView model) {
			model.setViewName("Doctors");
			return model;
		}
		@RequestMapping(value = "/doctorsearch", method = RequestMethod.POST) // to vendor log out
		public ModelAndView listDoctors(Integer hospitalId,Integer Doctor_Specialization,ModelAndView model) {
			System.out.println(hospitalId+"hospitalId in doctor search");
			System.out.println(Doctor_Specialization+"Doctor_Specialization");
			
			if(Doctor_Specialization == null) {
				model.addObject("specialization", "null");
			}else {
				model.addObject("specialization", Doctor_Specialization);
			}
			if(hospitalId==null) {
				model.addObject("hospitalId", "null");
			}
			else {
				model.addObject("hospitalId", hospitalId);
			}
			
			
			
			
			model.setViewName("doctorsearch");
			return model;
		}
		
		@RequestMapping(value = "/loadAllStates", headers = "Accept=*/*", method = RequestMethod.GET)
		public @ResponseBody List<States> loadAllStates() {
			System.out.println("allStates");
			List<States> States = userServices.getStates();
			System.out.println(States + "allStates");
			return States;
		}
		
		@RequestMapping(value = "/loadSpecialization", headers = "Accept=*/*", method = RequestMethod.GET)
		public @ResponseBody List<DoctorSpecialization> loadSpecialization() {
			System.out.println("AllSpecialization");
			List<DoctorSpecialization> Specialization = userServices.getAllSpecialization();
			System.out.println(Specialization + "AllSpecialization");
			return Specialization;
		}
		
		
		@RequestMapping(value="/loadHospitals",headers="Accept=*/*",method=RequestMethod.GET)
		public @ResponseBody List<HospitalRegistration> LoadHospitalsByCity(@RequestParam("cityId") String cityId) {
			List<HospitalRegistration> hospitaList = userServices.loadHospitalsByCity(cityId);
			System.out.println(hospitaList+"hospitaList");
			
			return hospitaList;
		}
		/*//################################## Our Doctors in Hospital (Narendra)  ####################################
		@RequestMapping(value = "/ourDoctorsforHospital")
		public String ourDoctors() {
			return "ourDoctorsforHospital";
		}
*/
		/*@RequestMapping(value = "/listOfDoctors")
		public @ResponseBody List<DoctorRegistration> listOfDoctorsHospitalwise(@RequestParam("vendorId") Integer vendorId,@RequestParam("") int specialization,HttpServletRequest request) {
	//Integer vendorId = vendorService.getVendorIdByUserName(request);
			
			List<DoctorRegistration> listOfDoctorsforHospital = userServices.listOfDoctorsforHospital(vendorId,specialization);
				
			return listOfDoctorsforHospital;
		}*/
		
		@RequestMapping(value = "/listOfDoctors")
		public @ResponseBody Map<String,Object> listOfDoctorsHospitalwise(Integer vendorId,Integer specialization,HttpServletRequest request) {
	//Integer vendorId = vendorService.getVendorIdByUserName(request);
			System.out.println(specialization +"in controleeer");
			System.out.println(vendorId +"in controleeerdd");
			return userServices.listOfDoctorsforHospital(vendorId,specialization);
				
			//return listOfDoctorsforHospital;
		}
		// *********************************  Our Doctors in Hospital completed  **************************************************
		
		}



