package com.iyf.salesledger.common.utils;

public class ObjectUtils {

	/***
	 * @기능 필수값이 null, empty, zero 인지 체크
	 * @param values
	 * @return boolean
	 */
	public static boolean isAnyValueNullOrEmptyOrZero(Object... values) {
	    for (Object value : values) {
	        if (value == null) {
	            return true; // At least one value is null
	        }

	        if (value instanceof String) {
	            if (((String) value).trim().isEmpty()) {
	                return true; // At least one String value is empty
	            }
	        } else if (value instanceof Double) {
	            if ((Double) value == 0.0) {
	                return true; // At least one double value is 0.0
	            }
	        } else if (value instanceof Integer) {
	            if ((Integer) value == 0) {
	                return true; // At least one int value is 0
	            }
	        }
	    }
	    return false; // All values are non-null, non-empty and non-zero
	}
	
	/***
	 * 
	 * @기능 null, empty, zero 이면 defaultValue 반환
	 * @param value
	 * @param defaultValue
	 * @return Object
	 */
	public static Object defaultIfNullOrEmptyOrZero(Object value, Object defaultValue) {
	    if (value == null) {
	    	return defaultValue;
	    }
	    
	    if (value instanceof String && ((String) value).trim().isEmpty()) {
	    	return defaultValue;
		} else if (value instanceof Double && (Double) value == 0.0) {
			return defaultValue;
		} else if (value instanceof Integer && (Integer) value == 0) {
			return defaultValue;
		} else {
	        return value;
	    }
	}
}
