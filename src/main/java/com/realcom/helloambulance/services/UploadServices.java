package com.realcom.helloambulance.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.Blob;
import com.realcom.helloambulance.dao.UploadDao;
import com.realcom.helloambulance.pojo.UploadImage;
import com.realcom.helloambulance.pojo.VendorUploadImage;

@Repository(value="uploadServices")
@Transactional
public class UploadServices {
	
	
	
	
	
	@Autowired
	UploadDao uploadDao;
	
	@Transactional
	public void saveUploadImage(UploadImage image) {
		uploadDao.saveUploadImage(image);
	}

	public Boolean UserExistOrNot(int id) {
		return uploadDao.userExistOrnot(id);
		
		
	}

	public void UpdateUploadImage(UploadImage uploadimage, int id) {
		uploadDao.UpdateImage(uploadimage,id);
		
	}

	public byte[] getImage(int id) {
		
		return  uploadDao.ImageData(id);
	}

	public Boolean DoctorExistOrNot(int vendorId) {
		return uploadDao.DoctorExistOrnot(vendorId);
	}

	public void saveDoctorUploadImage(VendorUploadImage uploadimage) {
		uploadDao.saveDoctorUploadImage(uploadimage);
		
	}

	public void UpdateDoctorUploadImage(VendorUploadImage uploadimage, int email_Id) {
		uploadDao.UpdateDoctorImage(uploadimage,email_Id);
		
	}

	public byte[] getImagevendordoctor(int vendorId) {
		return  uploadDao.vendordoctorImageData(vendorId);
	}


	
}
	
	
	
	
	
	
	
	


