
package com.realcom.helloambulance.queries;

public class Queries {
	// userhistory(varma)
	public static final String SELECT_USER_ID = QueriesConfig.getString("query.to.get.user.id.from");
	public static final String INSERT_USER_HISTORY = QueriesConfig.getString("query.to.save.user.history.form");
	public static final String UPDATE_USER_HISTORY = QueriesConfig.getString("query.to.update.user.history.form");
	// public static final String SELECT_SESSION_ID=
	// QueriesConfig.getString("query.to.get.user.session.id.from");

	public static final String UPDATE_USER_BY_USERID = QueriesConfig.getString("query.to.update.user.by.userid");

	//###################################### SELECT QUERIES.... (Rakesh)############################################//
	
			public static final String LIST_OF_USER_REGISTRATION = QueriesConfig.getString("query.Select.registration.form");
			public static final String LIST_OF_Vendors = QueriesConfig.getString("query.Select.Vendor_registration.form");		
			public static final String LIST_OF_ADMIN_REGISTORTYPE=QueriesConfig.getString("query.Select.listRegistors");			
			public static final String GET_USER_PROFILE_DETAILS = QueriesConfig.getString("query.to.get.user.profile.details");        
		    public static final String LIST_OF_EQUIPMENTS=QueriesConfig.getString("query.Select.Equipments.form");		
		    public static final String LIST_OF_GET_EQUIPMENTLIST=QueriesConfig.getString("query.Select.listEquipment");        
		    public static final String LIST_OF_DOCTOR_DEGREE=QueriesConfig.getString("query.Select.DoctorType.form");        
		    public static final String LIST_OF_GET_DOCTOR_DEGREE=QueriesConfig.getString("query.Select.DoctorDegree");        
		    public static final String ADD_OF_EQUIPMENTS=QueriesConfig.getString("query.to.ADD.form"); 		
		    public static final String ADD_OF_REGTYPE=QueriesConfig.getString("query.to.ADD1.form");        
		    public static final String ADD_OF_DOCTORDEGREE=QueriesConfig.getString("query.to.AddDegree.form");        
			public static final String SELECT_EQUIPMENTS_TYPE_ID=QueriesConfig.getString("query.to.get.equipments_type_id.from");        
			public static final String GET_Vendor_PROFILE =QueriesConfig.getString("query.to.getVendorProfileDetails.form");
			public static final String LIST_OF_GET_DOCTORSPECIALIZATION = QueriesConfig.getString("query.to.DoctorSpecializationList");		
			public static final String LIST_OF_DOCTORSPECIALIZATION =QueriesConfig.getString("query.Select.DoctorSpecialization");
			public static final String ADD_OF_DOCTORDEGREESPECIALIZATION =QueriesConfig.getString("query.to.AddDegreeSpecialization.form");
			public static final String GET_USER_DETAILS_FOR_SELECTED_USER_IN_ADMIN =QueriesConfig.getString("query.to.viewprofile.of.users.in.admin");
			public static final String GET_VENDOR_DETAILS_FOR_SELECTED_VENDOR_IN_ADMIN = QueriesConfig.getString("query.to.viewprofile.of.vendors.in.admin");

			//################################################### UPDATE QUERIES ################################//
			public static final String UPDATE_Ambulance_DETAILS = QueriesConfig.getString("query.to.update.AmbulanceDtls");
			public static final String UPDATE_Hospital_DETAILS = QueriesConfig.getString("query.to.update.HospitalDtls");
			public static final String UPDATE_Doctors_DETAILS = QueriesConfig.getString("query.to.update.DoctorsDtls");
			public static final String UPDATE_FORGOTPWD_DETAILS=QueriesConfig.getString("query.to.UpdatePassword.details");        
			public static final String UPDATE_Vendor_ENTRY_DETAILS = QueriesConfig.getString("query.Select.listVendor.form");		
			public static final String UPDATE_Equipments = QueriesConfig.getString("query.to.update.equipments");
			public static final String UPDATE_ADDMEMBERS_DETAILS = QueriesConfig.getString("query.to.addMembers");
			public static final String UPDATE_PACKAGE_ENTRY_DETAILS=QueriesConfig.getString("quert.Select.listuser.form");
			public static final String UPDATE_Registor = QueriesConfig.getString("query.to.update.Registor");
			public static final String UPDATE_DoctorDegree = QueriesConfig.getString("query.to.update.DoctorDegree");
			public static final String UPDATE_DoctorDegreeSpecialization = QueriesConfig.getString("query.to.update.DoctorDegreeSpecialization");
			public static final String UPDATE_REGISTOR_STATUS = QueriesConfig.getString("query.to.update.RegistorStatus");
			public static final String UPDATE_DOCTORDEGREE_STATUS = QueriesConfig.getString("query.to.updateDoctorDegree.status");
			public static final String UPDATE_DOCTORDEGREESPECIALIZATION_STATUS = QueriesConfig.getString("query.to.updateDoctorSpecialization.status");
			public static final String UPDATE_FAMILYMEMBER_STATUS = QueriesConfig.getString("query.to.updateFamilyMembers.status");

			//############################# DELETE QUERIES ########################################################//
			
			public static final String DELETE_Equipment_FORM = QueriesConfig.getString("query.to.DeleteEquipments.form");
			public static final String DELETE_RegistorType_FORM = QueriesConfig.getString("query.to.DeleteRegistorType");
			public static final String DELETE_DoctorDegree_FORM = QueriesConfig.getString("query.to.DeleteDoctorDegree");
			public static final String DELETE_DoctorSpecialization_FORM =QueriesConfig.getString ("query.to.DeleteDoctorSpecialization");			
			public static final String DELETE_ListAddMembers_FORM = QueriesConfig.getString("query.to.deleteListAddMembers");
			public static final String DELETE_ListUsers_FORM = QueriesConfig.getString("query.to.deleteListUsers");
			public static final String DELETE_ListVendors_FORM =QueriesConfig.getString("query.to.deleteListVendors");
			public static final String DELETE_ListComments_FORM = QueriesConfig.getString("query.to.deleteListComments");
			public static final String DELETE_Hospital_FORM = QueriesConfig.getString("query.to.deleteHospital");
			public static final String DELETE_Ambulance_FORM = QueriesConfig.getString("query.to.deleteAmbulances");
			public static final String DELETE_Doctors_FORM = QueriesConfig.getString("query.to.deleteDoctors");

			
			//Rakesh
			public static final String UPDATE_MESSAGE_CONTACTUS = QueriesConfig.getString("query.to.UpdateMessageContacts.form");
			public static final String GET_RECORD_STATUS_BY_EMAILID = QueriesConfig.getString("query.to.GetRecordStatusByEmailId.form");
			public static final String GET_MESSAGE_FROM_USERSIDE = QueriesConfig.getString("query.to.get.message.from.database.using.emailid");
			public static final String UPDATE_MESSAGE_FROM_USER = QueriesConfig.getString("query.to.update.the.message.in.contactus.userside.secondmessage.onwards");
			public static final String UPDATE_EQUIPMENTS_STATUS = QueriesConfig.getString("query.to.update.Equipments.status");
			public static final String JQGRID_USER_CONTACTS = QueriesConfig.getString("query.to.jqgrid.user.contacts");
			
			// ContactUs Form
			public static final String SAVE_CONTACT_US = QueriesConfig.getString("query.to.save.contact");
			// List of comments
			public static final String LIST_OF_CONTACT_US = QueriesConfig.getString("query.to.list.contact");
			// jqgrid
			public static final String JQGRID_COMMENTS_DETAILS = QueriesConfig.getString("query.to.jqgrid.list");
			
			//########################################### END(Rakesh)  ########################################################//
			
	
	/*// ContactUs Form(Radha Rukmini)
	public static final String SAVE_CONTACT_US = QueriesConfig.getString("query.to.save.contact");
	// List of comments(Radha Rukmini)
	public static final String LIST_OF_CONTACT_US = QueriesConfig.getString("query.to.list.contact");
	// jqgrid
	public static final String JQGRID_COMMENTS_DETAILS = QueriesConfig.getString("query.to.jqgrid.list");
*/
	// ########### Main Page ###############
	// Registration Form(vijay)
	public static final String SAVE_USER_REGISTRATION_FORM = QueriesConfig.getString("query.to.save.registration.form");
	public static final String SAVE_USER_REGISTRATION_FORM1 = QueriesConfig
			.getString("query.to.save.registration.form1");

	public static final String GET_USER_DETAILS = QueriesConfig.getString("query.to.get.userdetails.form");

	
	public static final String SELECT_STATES_BY_COUNTRY = QueriesConfig.getString("query.to.save.states.form");
	public static final String SELECT_CITY_BY_STATE = QueriesConfig.getString("query.to.save.cities.form");
	public static final String SELECT_BY_BLOODGROUP = QueriesConfig.getString("query.to.save.bloodgroup.form");
	public static final String SELECT_EMAIL_EXIST = QueriesConfig.getString("query.to.save.emailid.form");

	public static final String SELECT_MOBILE_EXIST = QueriesConfig.getString("query.to.save.mobilenumber.form");

	public static final String GET_USER_PROFILE = QueriesConfig.getString("query.for.user_details");

	// public static final String SELECT_USER_ID =
	// QueriesConfig.getString("query.to.select.user.id");

	public static final String USER_STATUS = QueriesConfig.getString("query.to.know.the.user.status");

	public static final String GET_PROFILE_DETAILS_BY_EMAILID = QueriesConfig
			.getString("query.for.to.get.profile.data.by.emailid");

	public static final String ACTIVATE_GOACCOUNT = QueriesConfig.getString("query.to.activate.account");

	public static final String GET_LOGIN_USER_ID_DETAILS = QueriesConfig.getString("query.to.get.login.useriddetails");

	
	// vendor Registration form (Narendra)

	public static final String SAVE_VENDOR_REGISTRATION_FORM = QueriesConfig
			.getString("query.to.save.vendorRegistration.form");
	public static final String GET_VENDER_STATUS = QueriesConfig.getString("query.to.get.vendor.status");
	public static final String GET_VENDER_PROFILE_DETAILS_BY_EMAILID = QueriesConfig
			.getString("query.to.get.vendor.profile.details.by.email");
	public static final String ACTIVATE_VENDOR_GOACCOUNT = QueriesConfig.getString("query.to.activate.vendor.account");

	public static final String GET_EMAIL_EXIST_OR_NOT_VENDOR = QueriesConfig
			.getString("query.to.get.email.exists.for.vendor");
	public static final String SELECT_MOBILE_EXIST_FOR_VENDOR = QueriesConfig
			.getString("query.to.get.mobilenumber.exists.for.vendor");

	public static final String GET_REGISTER_AS_LIST = QueriesConfig.getString("query.to.get.register.list");
	// doctor reg(vijay)
	public static final String SAVE_DOCTOR_REGISTRATION_FORM = QueriesConfig
			.getString("query.to.save.doctor.registration.form");

	/// ##################################### AddMembers
		public static final String SAVE_Add_family_Members_FORM = QueriesConfig
				.getString("query.to.save.familymembers.form");
		public static final String GET_USER_NAME_FROM_USER_REGISTRATION = QueriesConfig
				.getString("query.to.get.username.from.userregistration");
		public static final String SELECT_EMAIL_EXIST_ADDMEMBERS = QueriesConfig
				.getString("query.to.save.emailid.existed.ornot.form");
		public static final String SELECT_MOBILE_EXIST_ADDMEMBERS = QueriesConfig
				.getString("query.to.save.mobilenumber.existed.or.not.form");
		public static final String LIST_OF_ADD_MEMBERS = QueriesConfig.getString("query.to.get.list.of.add.members.from.family_members_table");
		public static final String DETAILS_OF_ADD_MEMBERS = QueriesConfig.getString("query.to.get.details.of.add.members.from.family_members_table");
		public static final String DETAILS_OF_ADD_MEMBERS_edit_page = QueriesConfig.getString("query.to.get.details.of.add.members.from.family_members_table_to_edit");
		public static final String DELETE_MEMBER_FROM_FAMILYMEMBER =  QueriesConfig.getString("query.to.delete.of.add.members.from.family_members_table");
		public static final String SAVE_UPDATED_Add_family_Members_FORM = QueriesConfig
				.getString("query.to.save.updated.familymembers.form");;
////////////####################upload profilepic###################
				public static final String UPLOAD_PHOTO = QueriesConfig.getString("query.to.save.photo");
				public static final String UPDATE_UPLOAD_PHOTO =  QueriesConfig.getString("query.to.update.photo");
				public static final String USER_ID_EXIST_OR_NOT_IN_IMAGE_UPLOAD = QueriesConfig.getString("query.to.select.userid.exist.from.image.upload");
				public static String retrieve_profile_image_FROM_UPLOAD_IMAGE=QueriesConfig
						.getString("query.to.profilepic.retrieve");
				
				public static final String DOCTOR_ID_EXIST_OR_NOT_IN_VENDOR_IMAGE_UPLOAD =  QueriesConfig.getString("query.to.select.vendorid.exist.from.vendor.image.upload");
				public static final String UPLOAD_DOCTOR_PHOTO = QueriesConfig.getString("query.to.save.doctor.photo");
				public static final String UPDATE_Doctor_PHOTO = QueriesConfig.getString("query.to.update.doctor.photo");
				public static String retrieve_profile_image_FROM_VENDOR_DOCTOR_UPLOAD_IMAGE=QueriesConfig
						.getString("query.to.vendor.doctor.profilepic.retrieve");
	//////////////###############	EMERGENCY_BOOK#####################
					public static final String INSERT_INTO_EMERGENCY_BOOK =  QueriesConfig.getString("INSERT.INTO.EMERGENCY.BOOK");
					public static final String update_in_EmergencyBook_emergencybook_current_location_lat_lon_values = QueriesConfig.getString("query.insert.current.location.lat.lon.values.in.EmergencyBook.emergencybook");
					////#####################

				
////#####################
	// doctor Registration form (vijay)
	public static final String SELECT_BY_DOCTORSPECIALIZATION = QueriesConfig
			.getString("query.to.save.doctorspecialization.form");
	public static final String SELECT_BY_DOCTORDEGREE = QueriesConfig.getString("query.to.save.doctordegree.form");
	
	//Narendra
	public static final String GET_LOGIN_USER_ID = QueriesConfig.getString("query.to.get.login.userid");

	public static final String GET_DOCTOR_STATUS = QueriesConfig.getString("query.to.get.doctor.status");
	public static final String GET_AMBULANCE_STATUS = QueriesConfig.getString("query.to.get.ambulance.status");
	public static final String GET_HOSPITAL_STATUS = QueriesConfig.getString("query.to.get.hospital.status");

	
	public static final String GET_REGISTERTYPE_BY_ID = QueriesConfig.getString("query.to.get.registertype.by.id");
	//Get Vendor role by id
	public static final String GET_VENDOR_ROLE_BY_ID = QueriesConfig.getString("query.to.get.vendorrole.by.id");
	
	public static final String GET_EQUIPMENT_lIST = QueriesConfig.getString("query.to.get.equipment.list");
	//hospital Registration
	
	public static final String HOSPITAL_REGISTRATION = QueriesConfig.getString("query.to.save.hospital");
	//get Hospital Details
	public static final String GET_HOSPITAL_DETAILS = QueriesConfig.getString("query.to.get.hospital.details");
	public static final String GET_HOSPiTAL_ALL_FIELD_DATA = QueriesConfig.getString("query.to.get.all.hospital.fields");
	//update hospital Details
	public static final String UPDATE_HOSPITAL_DETAILS = QueriesConfig.getString("query.to.update.hospital.details");
	
	public static final String GET_EQUIPMENTS_LIST_OF_PERTICULAR_HOSPITAL = QueriesConfig.getString("query.to.get.equipment.list.of.perticular.hospital");
	//update Equipment
	public static final String UPDATE_EQUIPMENT_IN_HOSPITAL = QueriesConfig.getString("query.to.update.equipment.in.hospital");
	
	// AMBULANCE Registration form (vijay)
			public static final String SAVE_AMBULANCE_REGISTRATION_FORM = QueriesConfig
					.getString("query.to.save.ambulance.registration.form");
			public static final String GET_VENDOR_PROFILE_DETAILS =  QueriesConfig.getString("query.to.get.vendor.profile.details");

			public static final String GET_AMBULANCE_PROFILE_DETAILS =  QueriesConfig.getString("query.to.get.ambulance.profile.details");
			public static final String GET_HOSPITAL_PROFILE_DETAILS =  QueriesConfig.getString("query.to.get.hospital.profile.details");
			public static final String GET_DOCTOR_PROFILE_DETAILS =  QueriesConfig.getString("query.to.get.doctor.profile.details");
			
			
			//Update Ambulance details (Narendra)
			public static final String GET_AMBULANCE_DETAILS = QueriesConfig.getString("query.to.get.ambulance.details.by.vendorid");
			public static final String UPDATE_AMBULANCE_BY_VENDORID = QueriesConfig.getString("query.to.update.ambulance.by.vendorid");
			
			public static final String GET_EQUIPMENTS_LIST_OF_PERTICULAR_AMBULANCE = QueriesConfig.getString("query.to.get.equipment.list.of.perticular.ambulance");
			public static final String UPDATE_EQUIPMENT_IN_AMBULANCE = QueriesConfig.getString("query.to.update.equipment.in.ambulance");
			
			//Update Doctor Detials (Narendra)
			public static final String GET_DOCTOR_DETAILS = QueriesConfig.getString("query.to.get.doctor.details.by.vendorid");
			public static final String UPDATE_DOCTOR_DETAILS_BY_VENDORID = QueriesConfig.getString("query.to.update.doctor.by.vendorid");
			public static final String GET_DOCTORDEGREE_BY_VENDOR_ID = QueriesConfig.getString("query.to.get.doctordegree.by.vendorId");
			public static final String GET_DOCTOR_SPECIALIZATION_BY_VENDORID = QueriesConfig.getString("query.to.get.doctorspecialization.by.vendorId");
			public static final String UPDATE_DOCTOR_SPECIALIZATION = QueriesConfig.getString("query.to.update.doctor.specialization");
			
			// Change user password (Narendra)
						public static final String CHANGE_PASSWORD = QueriesConfig.getString("query.to.save.change.password");
						public static final String CHECK_OLD_PASSWORD = QueriesConfig.getString("query.to.check.oldpassword.match.or.not");
						public static final String GET_PASSWORD_BY_USER_ID = QueriesConfig.getString("query.to.get.password.by.userid");
					
			//change vendor password  (Narendra)
						public static final String CHANGE_HOPSITAL_PASSWORD =  QueriesConfig.getString("query.to.change.hospital.password");
						/*public static final String CHECK_OLD_PASSWORD_VENDOR = QueriesConfig.getString("query.to.check.oldpassword.match.or.not.for.vendor");*/
						public static final String GET_PASSWORD_BY_USER_ID_VENDOR = QueriesConfig.getString("query.to.get.password.by.userid.for.vendor");

    //###########################################  Change Password Completed  ###########################################
			
			public static final String UPDATE_AMBULANCE_ENTRY_DETAILS = QueriesConfig.getString("query.to.get.ambulance.details");
			public static final String LIST_OF_Ambulances = QueriesConfig.getString("query.to.Select.Ambulance");
			
			
			
			
			public static final String SELECT_BY_STATES = QueriesConfig.getString("query.to.get.states.form");
			public static final String SELECT_BY_Specialization =QueriesConfig.getString("query.to.get.specialization.form");
			public static final String UPLOAD_SLIDE = QueriesConfig.getString("query.to.get.slides.form");
			public static final String SLIDE_ID_EXIST_OR_NOT_IN_SLIDE_UPLOAD = QueriesConfig.getString("query.to.get.slide.exists.not.form");
			public static final String UPDATE_UPLOAD_SLIDE = QueriesConfig.getString("query.to.get.update.slide.form");
			public static final String retrieve_slides_FROM_UPLOAD_SLIDES = QueriesConfig
					.getString("query.to.get.slides.retrieve");
			public static final String retrieve_slides2_FROM_UPLOAD_SLIDES = QueriesConfig
					.getString("query.to.get.slides2.retrieve");
			public static final String retrieve_slides3_FROM_UPLOAD_SLIDES =  QueriesConfig
					.getString("query.to.get.slides3.retrieve");
			public static final String retrieve_slides4_FROM_UPLOAD_SLIDES = QueriesConfig
					.getString("query.to.get.slides4.retrieve");

			
			//Narendra
			public static final String LIST_OF_DOCTORS_FOR_HOSPITAL = QueriesConfig.getString("query.to.get.list.of.doctors.for.hospital");

			/*public static final String SAVE_DOCTOR_REGISTRATION_FORM_FOR_HOSPITAL = QueriesConfig
					.getString("query.to.save.doctor.registration.form.for.hospital");*/
			public static final String SAVE_DOCTOR_REGISTRATION_FORM_FOR_HOSPITAL = QueriesConfig.getString("query.to.save.doctor.registration.form.for.hospital");
			public static final String GET_DOCTOR_PROFILE_DETAILS_IN_HOSPITAL_BY_ID = QueriesConfig.getString("query.to.get.doctordetails.in.hospital.by.id");
			
			//##################### Forgot password For Vendor (Narendra) ####################
		 	public static final String RESET_PASSWORD_FOR_VENDOR = QueriesConfig.getString("query.to.reset.password.for.vendor");
			
		 	public static final String GET_USER_GENDER_BY_ID =QueriesConfig.getString("query.to.get.usergender.by.id");
			
		 	public static final String Get_vendor_Gendor_By_VendorID = QueriesConfig.getString("query.to.get.vendor.gender.by.vendorid");
			//New Password For Doctor in Hospital
		 	public static final String SET_PASSWORD_FOR_DOCTOR = QueriesConfig.getString("query.to.set.newpassword.for.doctor.in.hospital");
			//Our Ambulance In Ambulance Page
		 	public static final String GET_AMBULANCE_DETAILS_BY_AMBULANCEID = QueriesConfig.getString("query.to.get.ambulance.details.by.ambulanceid");
			
		 	public static final String DELETE_DOCTOR_IN_HOSPITAL_PAGE = QueriesConfig.getString("query.to.delete.doctor.in.hospital.page");
		 	
		 	//#####################Ambulances in Hospital (VIAJY)#######################//
		 	public static final String LIST_OF_AMBULANCES_FOR_HOSPITAL = QueriesConfig.getString("query.to.get.list.of.ambulances.for.hospital");
			public static final String SAVE_AMBULANCE_REGISTRATION_FORM_FOR_HOSPITAL = QueriesConfig.getString("query.to.save.ambulance.registration.form.for.hospital");
			public static final String GET_AMBULANCE_PROFILE_DETAILS_IN_HOSPITAL_BY_ID = QueriesConfig.getString("query.to.get.ambulancedetails.in.hospital.by.id");
			public static final String GET_EMAIL_EXIST_OR_NOT_AMBULANCE =  QueriesConfig.getString("query.to.get.email.exists.for.ambulance");
			public static final String GET_EMAIL_EXIST_OR_NOT_DOCTOR =  QueriesConfig.getString("query.to.get.email.exists.for.doctor");
			public static final String SELECT_VENDOR_ID =  QueriesConfig.getString("query.to.get.vendor.id.from");
			
			public static final String DELETE_AMBULANCE_IN_HOSPITAL_PAGE = QueriesConfig.getString("query.to.delete.ambulance.in.hospital.page");
			
			//#############################  New Password For Ambulance in Hospital  (Narendra)  ##############################
			public static final String SET_PASSWORD_FOR_AMBULANCE = QueriesConfig.getString("query.to.set.newpassword.for.ambulance.in.hospital");
			//****************************  New Password For Ambulance in Hospital Completed  *******************************
			
			public static final String GET_COUNT_OF_EMAILID_IN_VENDORTABLE = QueriesConfig.getString("query.to.get.count.of.emailid.in.vendortable");
			public static final String GET_COUNT_OF_EMAILID_IN_DOCTORTABLE = QueriesConfig.getString("query.to.get.count.of.emailid.in.doctortable");
			public static final String GET_COUNT_OF_EMAILID_IN_AMBULANCETABLE = QueriesConfig.getString("query.to.get.count.of.emailid.in.ambulancetable");
		
			public static final String SAVE_AMBULANCE_REGISTRATION_FORM_FOR_AMBULANCE = QueriesConfig.getString("query.to.save.ambulance.registration.form.for.ambulance");
			
			public static final String DELETE_AMBULANCE_IN_AMBULANCE_PAGE = QueriesConfig.getString("query.to.delete.ambulance.in.ambulance.page");
			
			public static final String GET_AMBULANCE_REGID_BY_EMAILID = QueriesConfig.getString("query.to.get.ambulance.regid.by.emailid");
			
			public static final String GET_VENDOR_MOBILENO_BY_EMAILID = QueriesConfig.getString("query.to.get.vendor.mobileno.by.emailid");
			
			public static final String get_AMBULANCE_REGID_BY_MOBILE_NUM = QueriesConfig.getString("query.to.get.ambulance.regid.by.mobile.num");
		
			public static final String LOAD_HOSPITALNAMES_BASED_ON_CITY = QueriesConfig.getString("query.to.load.hospitalnames.basedon.city");
			
			public static final String LIST_OF_DOCTORS_FOR_USER_HOSPITAL_WISE = QueriesConfig.getString("query.to.load.list.of.doctors.hospitalwise");
			
		
			
}
