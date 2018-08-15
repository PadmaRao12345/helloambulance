package com.realcom.helloambulance.pojo;
public class ApplicationUtil {

	public static String stringInToInt(String user_reg_id) {
		return user_reg_id;
	}

	public static Object dateFormatLong() {
		return dateFormatLong();
	}
	public static int stringToInt(String string) {
		if(string.equals("") || string == null) {
			return 0;
		} else {
			return Integer.valueOf(string);
		}
	}

}
