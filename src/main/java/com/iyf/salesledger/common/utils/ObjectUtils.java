package com.iyf.salesledger.common.utils;

public class ObjectUtils {

	/***
	 * @기능 필수값이 null 또는 empty 인지 체크
	 * @param values
	 * @return boolean
	 */
	public static boolean isAnyValueNullOrEmpty(Object... values) {
	    for (Object value : values) {
	        if (value == null || value.toString().trim().isEmpty()) {
	            return true; // At least one value is null or empty
	        }
	    }
	    return false; // All values are non-null and non-empty
	}
}
