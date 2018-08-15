package com.realcom.helloambulance.pojo;

import java.util.Arrays;

public class UploadImage {

	// ggghhghjhjjh

	private int image_id;

	private int user_id;
	private String imageName;
	private String fileName;
	private byte[] data;

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "UploadImage [image_id=" + image_id + ", user_id=" + user_id + ", imageName=" + imageName + ", fileName="
				+ fileName + ", data=" + Arrays.toString(data) + "]";
	}

}
