package com.realcom.helloambulance.services;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.realcom.helloambulance.pojo.AddFamilyMembers;
import com.realcom.helloambulance.pojo.Mail;
import com.realcom.helloambulance.pojo.UserRegistration;
import com.realcom.helloambulance.pojo.VendorRegistration;

public class Mailer {
	@Autowired
	private JavaMailSender jmailSender;
	@Autowired
	private VelocityEngine velocityEngine;

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}
	// Welcome Mail to User
		@SuppressWarnings({ "rawtypes", "unchecked" })
		 public void welcomeEmail(Mail mail,  UserRegistration user) { 
			MimeMessage mimeMessage = jmailSender.createMimeMessage();
			try {
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
				mimeMessageHelper.setSubject(mail.getMailSubject());
				mimeMessageHelper.setFrom(mail.getMailFrom());
				mimeMessageHelper.setTo(mail.getMailTo());
			
				
				Map m = new HashMap();
				m.put("user",user);
				mail.setMailContent(geContentFromTemplate(m, mail));
				mimeMessageHelper.setText(mail.getMailContent(), true);
				jmailSender.send(mimeMessageHelper.getMimeMessage());
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
		

		// Welcome Mail to vendor (Narendra)
				@SuppressWarnings({ "rawtypes", "unchecked" })
				 public void welcomevendorEmail(Mail mail,  VendorRegistration vendor) { 
					MimeMessage mimeMessage = jmailSender.createMimeMessage();
					try {
						MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
						mimeMessageHelper.setSubject(mail.getMailSubject());
						mimeMessageHelper.setFrom(mail.getMailFrom());
						mimeMessageHelper.setTo(mail.getMailTo());
					
						
						Map m = new HashMap();
						m.put("vendor",vendor);
						mail.setMailContent(geContentFromTemplate(m, mail));
						mimeMessageHelper.setText(mail.getMailContent(), true);
						jmailSender.send(mimeMessageHelper.getMimeMessage());
					} catch (MessagingException e) {
						e.printStackTrace();
					}
				}
		
	
	@SuppressWarnings("deprecation")
	public String geContentFromTemplate(Map<String, Object> model, Mail ma) {
		StringBuffer content = new StringBuffer();
		try {
			content.append(VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
					"/emailTemplates/" + ma.getTemplateName(), model));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return content.toString();
	}

	
	public void welcomeEmail(Mail mail, AddFamilyMembers add ) { //method for add famil members
		// TODO Auto-generated method stub
		
		MimeMessage mimeMessage = jmailSender.createMimeMessage();
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			mimeMessageHelper.setSubject(mail.getMailSubject());
			mimeMessageHelper.setFrom(mail.getMailFrom());
			mimeMessageHelper.setTo(mail.getMailTo());
		
			
			Map m = new HashMap();
			m.put("user",add);
			mail.setMailContent(geContentFromTemplate(m, mail));
			mimeMessageHelper.setText(mail.getMailContent(), true);
			jmailSender.send(mimeMessageHelper.getMimeMessage());
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	//Contact Us Send Message to mail
		public void sendMailMessage(String email_id, String newmessage) {
			
			 //message sending to email using ContactUs
			MimeMessage message =  this.jmailSender.createMimeMessage();
			MimeMessageHelper mimeHelper;
			try {
			mimeHelper = new MimeMessageHelper(message,true);
			mimeHelper.setTo(email_id);
			mimeHelper.setFrom("Equipments");
			mimeHelper.setSubject("EquipmentsResponse");
		    mimeHelper.setText(newmessage,true);
			   jmailSender.send(message);
			} catch (MessagingException e) {
			System.out.println("Error Sending email "+ e.getMessage());
			}

	
		}

	}


