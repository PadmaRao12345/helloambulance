package com.realcom.helloambulance.pojo;

import java.util.List;
import java.util.Map;

public class Mail {
	private String mailFrom;
	private String mailTo;
	private String mailCc;
	private String mailBcc;
	private String mailSubject;
	private String mailContent;
	private String templateName;
	private String contentType;
	private List<Object> attachments;
	private Map<String, Object> model;
	private String text;

	public String getMailFrom() {
		return mailFrom;
	}

	public void setMailFrom(String mailFrom) {
		this.mailFrom = mailFrom;
	}

	public String getMailTo() {
		return mailTo;
	}

	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}

	public String getMailCc() {
		return mailCc;
	}

	public void setMailCc(String mailCc) {
		this.mailCc = mailCc;
	}

	public String getMailBcc() {
		return mailBcc;
	}

	public void setMailBcc(String mailBcc) {
		this.mailBcc = mailBcc;
	}

	public String getMailSubject() {
		return mailSubject;
	}

	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public List<Object> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Object> attachments) {
		this.attachments = attachments;
	}

	public Map<String, Object> getModel() {
		return model;
	}

	public void setModel(Map<String, Object> model) {
		this.model = model;
		
	}
	
	public void setText(String text) {
		this.text=text;
		
	}
	public String getText() {
		return text;
	}


	@Override
	public String toString() {
		return "Mail [mailFrom=" + mailFrom + ", mailTo=" + mailTo + ", mailCc=" + mailCc + ", mailBcc=" + mailBcc
				+ ", mailSubject=" + mailSubject + ", mailContent=" + mailContent + ", templateName=" + templateName
				+ ", contentType=" + contentType + ", attachments=" + attachments + ", model=" + model + ",text="+text+"]";
	}

	
}