
package com.realcom.helloambulance.util;



import java.security.SecureRandom;
import java.text.DateFormat;
import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class ApplicationUtil {

	

	public static String encodeInBCryptPasswordEncoder(String passwordString) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		return bcrypt.encode(passwordString);
	}
	
	public static String generateCode() {
		String password = "";
		SecureRandom random = new SecureRandom();
		for (int i = 0; i < 8; i++) {
			password = password + (char) (random.nextInt(26) + 97);
		}
		return password;
	}

	public static int stringToInt(String string) {
		if(string.equals("") || string == null) {
			return 0;
		} else {
			return Integer.valueOf(string);
		}
	}
	
	
	
	// Date Format long
		public static String dateFormatLong() {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
			return dateFormat.format(date);
		}
	
}
