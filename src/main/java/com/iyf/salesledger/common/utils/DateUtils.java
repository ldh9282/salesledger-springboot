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
		if (object instanceof String) {
			String str = (String) object;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.parse(str);
		} else if (object instanceof Date) {
			return (Date) object;
		} else {
			throw new IllegalArgumentException("Unsupported object type");
		}
	}
}
