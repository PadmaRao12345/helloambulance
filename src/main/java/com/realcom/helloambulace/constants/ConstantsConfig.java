package com.realcom.helloambulace.constants;



import java.util.MissingResourceException;
import java.util.ResourceBundle;

public class ConstantsConfig {
	private static ResourceBundle resourceBundle = ResourceBundle.getBundle("HelloAmbulanceApplicationConstants");

	public static String getString(String key) {
		try {
			return resourceBundle.getString(key).trim();
		} catch (Exception e) {
			if (e instanceof MissingResourceException) {
				return key;
			}
			if (e instanceof NullPointerException) {
				return key;
			}
			return "";
		}
	}
}
