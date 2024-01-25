package com.iyf.salesledger.common.utils;

import java.util.Map;

public class MapUtils {

	/***
	 * @기능 map 의 모든 프로퍼티가 null 또는 empty 인지 체크
	 * @param map
	 * @return boolean
	 */
    public static boolean areAllPropertiesNullOrEmpty(Map<String, Object> map) {
        for (Object value : map.values()) {
            if (value != null && !value.toString().trim().isEmpty()) {
                return false; // At least one property is not null or empty
            }
        }
        return true; // All properties are either null or empty
    }
    

}
