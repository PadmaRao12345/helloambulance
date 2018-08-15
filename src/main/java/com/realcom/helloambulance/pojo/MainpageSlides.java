package com.realcom.helloambulance.pojo;

import java.util.Arrays;

import org.apache.commons.fileupload.FileItem;

public class MainpageSlides {
	
	private int slider_id;
	private byte[] slide_name;
	private String slide_caption;
	private String slide_button;
	private FileItem slide_order;
	private String slide_uploaded_date;
	
	public int getSlider_id() {
		return slider_id;
	}

	public void setSlider_id(int slider_id) {
		this.slider_id = slider_id;
	}
	public byte[] getSlide_name() {
		return slide_name;
	}
	public void setSlide_name(byte[] slide_name) {
		this.slide_name = slide_name;
	}
	public String getSlide_caption() {
		return slide_caption;
	}
	public void setSlide_caption(String slide_caption) {
		this.slide_caption = slide_caption;
	}
	public String getSlide_button() {
		return slide_button;
	}
	public void setSlide_button(String slide_button) {
		this.slide_button = slide_button;
	}
	public FileItem getSlide_order() {
		return slide_order;
	}
	public void setSlide_order(FileItem fileItem) {
		this.slide_order = fileItem;
	}
	public String getSlide_uploaded_date() {
		return slide_uploaded_date;
	}
	public void setSlide_uploaded_date(String slide_uploaded_date) {
		this.slide_uploaded_date = slide_uploaded_date;
	}
	@Override
	public String toString() {
		return "MainpageSlides [slider_id=" + slider_id + ", slide_name=" + Arrays.toString(slide_name)
				+ ", slide_caption=" + slide_caption + ", slide_button=" + slide_button + ", slide_order=" + slide_order
				+ ", slide_uploaded_date=" + slide_uploaded_date + "]";
	}
	
}
