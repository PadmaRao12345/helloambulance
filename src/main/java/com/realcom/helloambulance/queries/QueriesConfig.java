package com.realcom.helloambulance.queries;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

public class QueriesConfig {
	private static ResourceBundle resourceBundle = ResourceBundle.getBundle("queries");

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
