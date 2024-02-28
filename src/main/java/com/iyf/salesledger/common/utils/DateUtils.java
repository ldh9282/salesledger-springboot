package com.iyf.salesledger.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	/***
	 * @기능 파라미터 타입이 String 혹은 java.util.Date 관계 없이 java.util.Date 반환
	 * @param object
	 * @return java.util.Date
	 * @throws ParseException
	 */
	public static Date parseObject(Object object) throws ParseException {
		
		if (object == null) {
			return null;
		}
		
		if (object instanceof String) {
			String str = (String) object;
			
			if ("".equals(str)) {
				return null;
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.parse(str);
		} else if (object instanceof Date) {
			return (Date) object;
		} else {
			throw new IllegalArgumentException("Unsupported object type");
		}
	}
	/***
	 * @기능 파라미터 타입이 String 혹은 java.util.Date 관계 없이 format 형식의 String 반환
	 * @param object
	 * @param format
	 * @return String
	 * @throws ParseException
	 */
	public static String formatObject(Object object, String format) throws ParseException {
		
		if (object == null) {
			return null;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		if (object instanceof String) {
			String str = (String) object;
			
			if ("".equals(str)) {
				return null;
			}
			
			Date date = sdf.parse(str);
			return sdf.format(date);
		} else if (object instanceof Date) {
			return sdf.format((Date) object);
		} else {
			throw new IllegalArgumentException("Unsupported object type");
		}
	}
}
