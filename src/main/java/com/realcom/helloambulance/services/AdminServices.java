package com.realcom.helloambulance.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.realcom.helloambulance.dao.AdminDao;
import com.realcom.helloambulance.pojo.AddFamilyMembers;
import com.realcom.helloambulance.pojo.AmbulanceRegistration;
import com.realcom.helloambulance.pojo.ContactUs;
import com.realcom.helloambulance.pojo.DoctorDegree;
import com.realcom.helloambulance.pojo.DoctorRegistration;
import com.realcom.helloambulance.pojo.DoctorSpecailization;
import com.realcom.helloambulance.pojo.Equipments;
import com.realcom.helloambulance.pojo.HospitalRegistration;
import com.realcom.helloambulance.pojo.MainpageSlides;
import com.realcom.helloambulance.pojo.RegistorType;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;

@Repository(value = "adminServices")
@Transactional
public class AdminServices {

	@Autowired
	AdminDao adminDao;

	// ............. TO GET THE EQUIPMENTS DAO LIST.........//

	@Transactional
	public List<Equipments> list1() {
		return adminDao.list1();
	}

	// Insert Equipments.....
	public void insertEquipments(Equipments equipments) {
		adminDao.insertEquipment(equipments);
	}

	// Equipments Edit and Delete
	public Boolean edit(Equipments equipments) {
		return adminDao.edit(equipments);
	}

	// Delete Equipments....
	public Boolean deleteExistingPackage(Equipments equipments) {
		return adminDao.deleteExistingPackage(equipments);
	}

	// Status Active or Inactive Status.....
	public void updatestatus(Equipments user) {
		adminDao.updatestatus(user);
	}

	// ....................REGISTORTYPE...................//

	// To insert RegistoType.....
	public void insertRegistorType(String register_type) {
		adminDao.insertRegistorType(register_type);
	}

	// RegistorType Edit And Delete
	public Boolean edit(RegistorType registor) {
		return adminDao.edit(registor);
	}

	// DeleteRegistorType
	public Boolean deleteExistingPackage(RegistorType registor) {
		return adminDao.deleteExistingPackage(registor);
	}

	// Update Status..
	public void updateRegistorstatus(RegistorType registor) {
		adminDao.updateRegistorstatus(registor);
	}

	// ...............DOCTORDEGREE............//

	// To insertDoctorDegree
	public void insertDoctor(String doctor_degree) {
		adminDao.insertDoctor(doctor_degree);
	}

	// DoctorDegree Edit And Delete
	public Boolean edit(DoctorDegree doctorDegree) {
		return adminDao.edit(doctorDegree);
	}

	// Delete DoctorDegree...
	public Boolean deleteExistingPackages(DoctorDegree doctordegree) {

		return adminDao.deleteExistingPackages(doctordegree);
	}
	//updateStatus DoctorDegree
	public void updateDoctorDegreestatus(DoctorDegree doctor) {
		adminDao.updateDoctorDegreestatus(doctor);
	}


	// ..................DOCTORDEGREESPECIALIZATIONS..............//

	// To insert DoctorDegreeSpecializations....
	public Object insertDoctorSpecializationType(String doctor_specialization_type) {
		return adminDao.insertDoctorSpecializationType(doctor_specialization_type);
	}

	// DoctorDegreeSpecializations.....
	public Boolean edit(DoctorSpecailization doctorSpecialization) {
		return adminDao.edit(doctorSpecialization);
	}

	// Delete DoctorSpecializations...
	public Boolean deleteExistingPackagess(DoctorSpecailization doctorSpecailization) {
		return adminDao.deleteExistingPackagess(doctorSpecailization);
	}

	// Delete List Comments
	public Boolean deleteListComments(ContactUs contact) {
		return adminDao.deleteListComments(contact);
	}

	// Delete AddMembers...
	public Boolean deleteAddMembers(AddFamilyMembers addmember) {
		return adminDao.deleteAddMembers(addmember);
	}

	// DeleteHospiatals
	public Boolean deleteExistingPackage(HospitalRegistration hosptlReg) {
		return adminDao.deleteExistingPackage(hosptlReg);
	}

	// Delete Ambulance Services...
	public Boolean deleteExistingPackage(AmbulanceRegistration ambulanceReg) {
		return adminDao.deleteExistingPackage(ambulanceReg);
	}

	// Delete Doctors
	public Boolean deleteExistingPackage(DoctorRegistration doctorReg) {
		return adminDao.deleteExistingPackage(doctorReg);
	}

	// vendorProfileDtls in Admin
	public VendorRegistration getVendorProfileDetailsbyid(String vendor_reg_id) {
		VendorRegistration vendor = adminDao.getVendorProfileDetailsbyid(vendor_reg_id);
		return vendor;
	}

	@Transactional
	public void saveUploadSlide(MainpageSlides uploadslide) {
		adminDao.saveUploadSlide(uploadslide);
	}

	public Boolean ImageExistOrNot() {
		return adminDao.ImageExistOrNot();

	}

	public void UpdateUploadSlide(MainpageSlides uploadimage, int id) {
		adminDao.UpdateUploadSlide(uploadimage, id);
	}

	public void updateDoctorDegreeSpecializationstatus(DoctorSpecailization doctorSpecialization) {
         adminDao.updateDoctorDegreeSpecializationstatu(doctorSpecialization);		
	}

	public void updateFamilyMemberstatus(AddFamilyMembers members) {
        adminDao.updateFamilyMemberstatus(members);		
	}
}
