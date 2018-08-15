package com.realcom.helloambulance.pojo;

import java.util.Arrays;

public class VendorUploadImage {
	
	private int vendor_uploade_image_id;
	
	private int vendor_id;
	private String imageName;
	private String 	file_name;
	private byte[] data;

	public int getVendor_uploade_image_id() {
		return vendor_uploade_image_id;
	}
	public void setVendor_uploade_image_id(int vendor_uploade_image_id) {
		this.vendor_uploade_image_id = vendor_uploade_image_id;
	}
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "VendorUploadImage [vendor_uploade_image_id=" + vendor_uploade_image_id + ", vendor_id=" + vendor_id
				+ ", imageName=" + imageName + ", file_name=" + file_name + ", data=" + Arrays.toString(data) + "]";
	}
	

}
