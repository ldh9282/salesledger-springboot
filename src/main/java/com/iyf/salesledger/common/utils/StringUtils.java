package com.iyf.salesledger.common.utils;

public class StringUtils {

	/***
	 * @기능 input 이 Null 또는 Empty 면 defaultValue
	 * @param input
	 * @param defaultValue
	 * @return String
	 */
	public static String defaultIfNullOrEmpty(String input, String defaultValue) {
	    if (input == null || input.isEmpty()) {
	        return defaultValue;
	    } else {
	        return input;
	    }
	}
}
