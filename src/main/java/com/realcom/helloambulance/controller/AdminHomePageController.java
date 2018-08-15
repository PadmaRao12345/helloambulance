package com.realcom.helloambulance.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.realcom.helloambulance.pojo.ApplicationUtil;
import com.realcom.helloambulance.pojo.ContactUs;
import com.realcom.helloambulance.pojo.DoctorSpecailization;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.MainpageSlides;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;
import com.realcom.helloambulance.services.AdminServices;
import com.realcom.helloambulance.services.ContactServices;
import com.realcom.helloambulance.services.MailService;
import com.realcom.helloambulance.services.Mailer;
import com.realcom.helloambulance.services.UserServices;
import com.realcom.helloambulance.util.ApplicationsUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminHomePageController {
	@Autowired
	ContactServices contactServices;
	@Autowired
	UserServices userServices;
	@Autowired
	AdminServices adminServices;
	@Autowired
	Mailer mailer;
	MailService mailService;

	@RequestMapping(value = "/")
	public ModelAndView adminpage(ModelAndView model) {
		model.setViewName("adminhomepage");
		return model;
	}

	// contact for specific row
	@RequestMapping(value = "/contactpopup", method = RequestMethod.GET)
	public ModelAndView contactViewProfile(ModelAndView model, @RequestParam String contactID) {
		Map<String, Object> con = contactServices.getContact(contactID);
		System.out.println("this is contact in admin" + con);
		for (Map.Entry<String, Object> map : con.entrySet()) {
			@SuppressWarnings("unchecked")
			List<ContactUs> contact = (List<ContactUs>) map.getValue();
			model.addObject("contact", contact);
			System.out.println("this is contact in admin" + contact);
		}
		model.setViewName("listcomments");
		return model;
	}

	// Send text message to user using email
	@RequestMapping(value = "/contactmessage", method = RequestMethod.POST)
	public String ContactUsEmail(@RequestParam("newmessage") String newmessage,
			@RequestParam("message1") String message1, @RequestParam("email") String email_id,
			@RequestParam("contactID") String contact_id) {
		String msg1 = message1;
		String message = msg1.concat("\n" + "Admin:" + newmessage);
		contactServices.updateMessageByEmail(contact_id, message);
		// sending mail
		mailer.sendMailMessage(email_id, newmessage);
		return "listcomments";
	}
	@RequestMapping(value = "/comments", method = RequestMethod.GET)
	public ModelAndView listofcomments(ModelAndView model) throws IOException {
		model.setViewName("comments");
		return model;
	}
	@RequestMapping(value = "/listusers", method = RequestMethod.GET)
	public ModelAndView listofUsers(ModelAndView model) throws IOException {
		model.setViewName("listof-users");
		return model;
	}
	
	@RequestMapping(value = "/Vendors", method = RequestMethod.GET)
	public ModelAndView listofVendors(ModelAndView model) throws IOException {
		model.setViewName("listof-Vendors");
		return model;
	}
	// Ambulances Register
	@RequestMapping(value = "/registorAmbulances", method = RequestMethod.GET)
	public ModelAndView listofAmbulances(ModelAndView model) throws IOException {
		model.setViewName("listof-Ambulances");
		return model;
	}
	// RegisterHospital
	@RequestMapping(value = "/registorHospitals", method = RequestMethod.GET)
	public ModelAndView listofHospitals(ModelAndView model) throws IOException {
		model.setViewName("listof-Hospitals");
		return model;
	}
	// RegisterDoctors
	@RequestMapping(value = "/registorDoctors", method = RequestMethod.GET)
	public ModelAndView listofDoctors(ModelAndView model) throws IOException {
		model.setViewName("listof-Doctors");
		return model;
	}
	@RequestMapping(value = "/Equipments", method = RequestMethod.GET)
	public ModelAndView Equipments(ModelAndView model) throws IOException {
		List<Equipments> list1 = adminServices.list1();
		System.out.println(list1);
		model.addObject("equipmentlist", list1);
		model.setViewName("Equipments");
		return model;
	}
	@RequestMapping(value = "/Registor", method = RequestMethod.GET)
	public ModelAndView RegistorType(ModelAndView model) throws IOException {
		model.setViewName("RegistorType");
		return model;
	}
	@RequestMapping(value = "/Doctor", method = RequestMethod.GET)
	public ModelAndView Doctor(ModelAndView model) throws IOException {
		model.setViewName("Doctor");
		return model;
	}
	@RequestMapping(value = "/DoctorSpecialization", method = RequestMethod.GET)
	public ModelAndView DoctorSpecialization(ModelAndView model) throws IOException {
		model.setViewName("DoctorSpecializations");
		return model;
	}
	// AddMembers....
	@RequestMapping(value = "/AddMembers", method = RequestMethod.GET)
	public ModelAndView AddMembers(ModelAndView model) throws IOException {
		model.setViewName("AddMember");
		return model;
	}
	// UserView in Admin
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView viewprofile(ModelAndView model, @RequestParam("user_reg_id") String user_reg_id)
			throws UnsupportedEncodingException {
		UserRegistration user = userServices.getProfileDetailsbyid(user_reg_id);
		model.addObject("view", user);
		model.setViewName("view");
		return model;
	}
	// VendorProfileDtls ADMIN....
	@RequestMapping(value = "/Vendorview", method = RequestMethod.GET)
	public ModelAndView vendorProfilebyid(ModelAndView model, @RequestParam("vendor_reg_id") String vendor_reg_id) {
		VendorRegistration	 vendor = adminServices.getVendorProfileDetailsbyid(vendor_reg_id);
		model.addObject("Vendorview",vendor);
		model.setViewName("Vendorview");
		return model;
	}

	//........................ uploag slides...................//
	@RequestMapping(value = "/upload_slides")
	public ModelAndView saveUploadSlides(ModelAndView model) throws IOException {
		model.setViewName("upload_slides");
		return model;
	}
	@RequestMapping(value = "/uploadslides", method = RequestMethod.POST)
	public ModelAndView saveUploadSlides(HttpServletRequest request, MainpageSlides UploadSlides,
			final @RequestParam CommonsMultipartFile[] attachFileObj) {
		Boolean imageExist = adminServices.ImageExistOrNot();
		@SuppressWarnings("unused")
		String image_name = request.getParameter("image_name");
		if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
			for (CommonsMultipartFile aFile : attachFileObj) {
				if (aFile.isEmpty()) {
					continue;
				} else {
					System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
					if (!aFile.getOriginalFilename().equals("")) {
						UploadSlides.setSlider_id(1);
						UploadSlides.setSlide_name(aFile.getBytes());
						UploadSlides.setSlide_caption(aFile.getContentType());
					    UploadSlides.setSlide_order(aFile.getFileItem());
						// Calling The database Method To Save The Uploaded File In The Db
						if (imageExist != true) {
							adminServices.saveUploadSlide(UploadSlides);
						}
						if (imageExist == true) {
							adminServices.UpdateUploadSlide(UploadSlides, 1);
						}
						System.out.println("ok ");
					} else {
						System.out.println("error");
					}
				}
				System.out.println("File Is Successfully Uploaded.... \n");
			}
		} else {
		}
		ModelAndView modelViewObj = new ModelAndView("success", "messageObj",
				"Thank You! The File(s) Is Successfully Uploaded!");
		return modelViewObj;
	}
	@RequestMapping(value = "/upload_slides2")
	public ModelAndView saveUploadSlides2(ModelAndView model) throws IOException {
		model.setViewName("upload_slides2");
		return model;
	}
	@RequestMapping(value = "/uploadslides2", method = RequestMethod.POST)
	public ModelAndView saveUploadSlides2(HttpServletRequest request, MainpageSlides UploadSlides,
			final @RequestParam CommonsMultipartFile[] attachFileObj) {
		Boolean imageExist = adminServices.ImageExistOrNot();
		@SuppressWarnings("unused")
		String image_name = request.getParameter("image_name");
		if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
			for (CommonsMultipartFile aFile : attachFileObj) {
				if (aFile.isEmpty()) {
					continue;
				} else {
					System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
					if (!aFile.getOriginalFilename().equals("")) {
						UploadSlides.setSlider_id(2);
						UploadSlides.setSlide_name(aFile.getBytes());
						UploadSlides.setSlide_caption(aFile.getContentType());
						UploadSlides.setSlide_order(aFile.getFileItem());
						// Calling The database Method To Save The Uploaded File In The DataBase
						if (imageExist != true) {
							adminServices.saveUploadSlide(UploadSlides);
						}
						if (imageExist == true) {
							adminServices.UpdateUploadSlide(UploadSlides, 2);
						}
						System.out.println("ok ");
					} else {
						System.out.println("error");
					}
				}
				System.out.println("File Is Successfully Uploaded.... \n");
			}
		} else {
		}
		ModelAndView modelViewObj = new ModelAndView("success", "messageObj",
				"Thank You! The File(s) Is Successfully Uploaded!");
		return modelViewObj;
	}
	@RequestMapping(value = "/upload_slides3")
	public ModelAndView saveUploadSlides3(ModelAndView model) throws IOException {
		model.setViewName("upload_slides3");
		return model;
	}
	@RequestMapping(value = "/uploadslides3", method = RequestMethod.POST)
	public ModelAndView saveUploadSlides3(HttpServletRequest request, MainpageSlides UploadSlides,
			final @RequestParam CommonsMultipartFile[] attachFileObj) {
		Boolean imageExist = adminServices.ImageExistOrNot();
		@SuppressWarnings("unused")
		String image_name = request.getParameter("image_name");
		if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
			for (CommonsMultipartFile aFile : attachFileObj) {
				if (aFile.isEmpty()) {
					continue;
				} else {
					System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
					if (!aFile.getOriginalFilename().equals("")) {
						UploadSlides.setSlider_id(3);
						UploadSlides.setSlide_name(aFile.getBytes());
						UploadSlides.setSlide_caption(aFile.getContentType());
						UploadSlides.setSlide_order(aFile.getFileItem());
						// Calling The database Method To Save The Uploaded File In The Db
						if (imageExist != true) {
							adminServices.saveUploadSlide(UploadSlides);
						}
						if (imageExist == true) {
							adminServices.UpdateUploadSlide(UploadSlides, 3);
						}
						System.out.println("ok ");
					} else {
						System.out.println("error");
					}
				}
				System.out.println("File Is Successfully Uploaded.... \n");
			}
		} else {
		}
		ModelAndView modelViewObj = new ModelAndView("success", "messageObj",
				"Thank You! The File(s) Is Successfully Uploaded!");
		return modelViewObj;
	}
	@RequestMapping(value = "/upload_slides4")
	public ModelAndView saveUploadSlides4(ModelAndView model) throws IOException {
		model.setViewName("upload_slides4");
	return model;
	}
	@RequestMapping(value = "/uploadslides4", method = RequestMethod.POST)
	public ModelAndView saveUploadSlides4(HttpServletRequest request, MainpageSlides UploadSlides,
			final @RequestParam CommonsMultipartFile[] attachFileObj) {
		Boolean imageExist = adminServices.ImageExistOrNot();
		@SuppressWarnings("unused")
		String image_name = request.getParameter("image_name");
		if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
			for (CommonsMultipartFile aFile : attachFileObj) {
				if (aFile.isEmpty()) {
					continue;
				} else {
					System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
					if (!aFile.getOriginalFilename().equals("")) {
						UploadSlides.setSlider_id(4);
						UploadSlides.setSlide_name(aFile.getBytes());
						UploadSlides.setSlide_caption(aFile.getContentType());
						UploadSlides.setSlide_order(aFile.getFileItem());
						// Calling The database Method To Save The Uploaded File In The Db
						if (imageExist != true) {
							adminServices.saveUploadSlide(UploadSlides);
						}
						if (imageExist == true) {
							adminServices.UpdateUploadSlide(UploadSlides, 4);
						}
						System.out.println("ok ");
					} else {
						System.out.println("error");
					}
				}
				System.out.println("File Is Successfully Uploaded.... \n");
			}
		} else {
		}
		ModelAndView modelViewObj = new ModelAndView("success", "messageObj",
				"Thank You! The File(s) Is Successfully Uploaded!");
		return modelViewObj;
	}
}
