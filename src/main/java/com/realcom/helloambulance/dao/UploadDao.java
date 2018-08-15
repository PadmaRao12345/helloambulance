package com.realcom.helloambulance.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.realcom.helloambulance.pojo.UploadImage;
import com.realcom.helloambulance.pojo.VendorUploadImage;
import com.realcom.helloambulance.queries.Queries;
import com.realcom.helloambulance.util.CommonDao;

@Repository(value="uploadDao")
public class UploadDao extends CommonDao<Object> {
	
	public void saveUploadImage(UploadImage upload) {
		Object[] obj = new Object[] {upload.getUser_id(), upload.getFileName(),upload.getData()};
		jdbcTemplate.update(Queries.UPLOAD_PHOTO, obj);
	}

	public Boolean userExistOrnot(int id) {
		Integer count = jdbcTemplate.queryForObject(Queries.USER_ID_EXIST_OR_NOT_IN_IMAGE_UPLOAD, Integer.class,id);
		   if(count==1) {
			   return true;
		   }else 
		   {
			   return false;
		   }
			}

	public void UpdateImage(UploadImage uploadimage, int id) {
		Object[] obj = new Object[] {uploadimage.getFileName(),uploadimage.getData(),id};
		System.out.println(obj+"dao data updated photo");
		jdbcTemplate.update(Queries.UPDATE_UPLOAD_PHOTO, obj);
		
		
	}

	public byte[] ImageData(int id) {
		byte[]  img = jdbcTemplate.queryForObject(Queries.retrieve_profile_image_FROM_UPLOAD_IMAGE, new Object[]{id}, new RowMapper<byte[] >() {

	            @Override
	            public byte[]  mapRow(ResultSet rs, int arg1)
	                    throws SQLException {
	            	//UploadImage adg=new UploadImage();
	            	
	            	byte[]  fg= rs.getBytes("Data");
	            	System.out.println(fg+"dao retrieve image");
	                return fg;
	            }

	        }
		  
				  );

	        
	        return img;
	       
	    }

	public Boolean DoctorExistOrnot(int vendorId) {
		Integer count = jdbcTemplate.queryForObject(Queries.DOCTOR_ID_EXIST_OR_NOT_IN_VENDOR_IMAGE_UPLOAD, Integer.class,vendorId);
		   if(count==1) {
			   return true;
		   }else 
		   {
			   return false;
		   }
			}

	public void saveDoctorUploadImage(VendorUploadImage uploadimage) {
		Object[] obj = new Object[] {uploadimage.getVendor_id(), uploadimage.getFile_name(),uploadimage.getData()};
		jdbcTemplate.update(Queries.UPLOAD_DOCTOR_PHOTO, obj);
		
	}

	public void UpdateDoctorImage(VendorUploadImage uploadimage, int email_Id) {
		Object[] obj = new Object[] {uploadimage.getFile_name(),uploadimage.getData(),email_Id};
		System.out.println(obj+"dao data updated photo");
		jdbcTemplate.update(Queries.UPDATE_Doctor_PHOTO, obj);
		
	}

	public byte[] vendordoctorImageData(int vendorId) {
		byte[]  img = jdbcTemplate.queryForObject(Queries.retrieve_profile_image_FROM_VENDOR_DOCTOR_UPLOAD_IMAGE, new Object[]{vendorId}, new RowMapper<byte[] >() {

            @Override
            public byte[]  mapRow(ResultSet rs, int arg1)
                    throws SQLException {
            	//UploadImage adg=new UploadImage();
            	
            	byte[]  fg= rs.getBytes("data");
            	System.out.println(fg+"dao retrieve image");
                return fg;
            }

        }
	  
			  );

        
        return img;
	}


	


	}
	


