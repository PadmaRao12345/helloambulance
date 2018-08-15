package com.realcom.helloambulance.services;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

    @Service
	public class MailService {
		
		@Autowired
		private JavaMailSender mailSender;
		@SuppressWarnings("unused")
		private VelocityEngine velocityEngine;
		
		public void setVelocityEngine(VelocityEngine velocityEngine) {
			this.velocityEngine = velocityEngine;
		}
		
		
		
		public JavaMailSender getMailSender() {
			return mailSender;
		}

		public void setMailSender(JavaMailSender mailSender) {
			this.mailSender = mailSender;
		}

		public void sendMail(String email_id)
		{
			MimeMessage message =  this.mailSender.createMimeMessage();
			MimeMessageHelper mimeHelper;
			try {
				mimeHelper = new MimeMessageHelper(message,true);
				mimeHelper.setTo(email_id);
				
				
				mimeHelper.setFrom("helloAmbulance");
				mimeHelper.setSubject("resetPassword");
				mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/helloambulance/newPassword/"+email_id+"/'> Click here</a> to reset password</body></html>",true);
				mailSender.send(message);
			} catch (MessagingException e) {
				System.out.println("Error Sending email "+ e.getMessage());
			}
			
		}

		public void sendMailForVendorForgotpassword(String email_id)
		{
			MimeMessage message =  this.mailSender.createMimeMessage();
			MimeMessageHelper mimeHelper;
			try {
				mimeHelper = new MimeMessageHelper(message,true);
				mimeHelper.setTo(email_id);
				
				
				mimeHelper.setFrom("helloAmbulance");
				mimeHelper.setSubject("resetPassword");
				mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/helloambulance/newPasswordforvendor/"+email_id+"/'> Click here</a> to reset password</body></html>",true);
				mailSender.send(message);
			} catch (MessagingException e) {
				System.out.println("Error Sending email "+ e.getMessage());
			}
			
		}

		public void sendMailForDoctorPassword(String email_id)
		{
			System.out.println(email_id);
			MimeMessage message =  this.mailSender.createMimeMessage();
			MimeMessageHelper mimeHelper;
			try {
				mimeHelper = new MimeMessageHelper(message,true);
				mimeHelper.setTo(email_id);
				
				
				mimeHelper.setFrom("helloAmbulance");
				mimeHelper.setSubject("set Password");
				mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/helloambulance/vendor/newPasswordfordoctorInHospital/"+email_id+"/'> Click here</a> to set password</body></html>",true);
				mailSender.send(message);
			} catch (MessagingException e) {
				System.out.println("Error Sending email "+ e.getMessage());
			}
			
		}



		public void sendMailForAmbulancPassword(String email_id) {
			System.out.println(email_id);
			MimeMessage message =  this.mailSender.createMimeMessage();
			MimeMessageHelper mimeHelper;
			try {
				mimeHelper = new MimeMessageHelper(message,true);
				mimeHelper.setTo(email_id);
				
				
				mimeHelper.setFrom("helloAmbulance");
				mimeHelper.setSubject("set Password");
				mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/helloambulance/vendor/newPasswordforAmbulanceInHospital/"+email_id+"/'> Click here</a> to set password</body></html>",true);
				mailSender.send(message);
			} catch (MessagingException e) {
				System.out.println("Error Sending email "+ e.getMessage());
			}			
		}



		public void sendMailForAmbulancPasswordInAmbulance(String email_id) {
			
			System.out.println(email_id);
			MimeMessage message =  this.mailSender.createMimeMessage();
			MimeMessageHelper mimeHelper;
			try {
				mimeHelper = new MimeMessageHelper(message,true);
				mimeHelper.setTo(email_id);
				
				
				mimeHelper.setFrom("helloAmbulance");
				mimeHelper.setSubject("set Password");
				mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/helloambulance/vendor/newPasswordforAmbulanceInAmbulance/"+email_id+"/'> Click here</a> to set password</body></html>",true);
				mailSender.send(message);
			} catch (MessagingException e) {
				System.out.println("Error Sending email "+ e.getMessage());
			}			
		}



	
	}