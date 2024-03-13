package com.iyf.salesledger.common.api.service;

import java.text.ParseException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.iyf.salesledger.common.model.CustomMap;
import com.iyf.salesledger.common.utils.DateUtils;
import com.iyf.salesledger.dao.WorkdayDao;

@Service
public class DateNagerService {

	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private WorkdayDao workdayDao;
	/***
	 * <pre>
	 * api를 통해 해당년월 공휴일 조회
	 * </pre>
	 * @param
	 * @return
	 */
	public List<CustomMap> getHolidays(CustomMap customMap) {
		List<CustomMap> holidayList = new ArrayList<>();
		
		String year = customMap.getString("year");
		Object response = restTemplate.getForObject("https://date.nager.at/api/v3/publicholidays/" + year +"/KR", Object.class);
		
		List<Map<String, Object>> theResponse = (List<Map<String,Object>>) response;
		for (Map<String, Object> item : theResponse) {
			CustomMap holiday = new CustomMap(item);
			
			holidayList.add(holiday);
		}
		return holidayList;
	}
	
	/***
	 * <pre>
	 * 공휴일 데이터 등록
	 * </pre>
	 * @param
	 * @return
	 * @throws ParseException 
	 */
	@Transactional
	public void executeInsertHolidays() throws ParseException {
		List<CustomMap> combinedDates = new ArrayList<>();
		
		CustomMap requestMap = new CustomMap();
		requestMap.put("year", DateUtils.formatObject(new Date(), "YYYY"));
		
		List<CustomMap> holidayList = getHolidays(requestMap);
		for (CustomMap holiday : holidayList) {
			CustomMap map = new CustomMap();
			map.put("date", holiday.getString("date"));
			map.put("reason", holiday.getString("localName"));
			combinedDates.add(map);
		}
		List<CustomMap> weekendList = findWeekendList(requestMap);
		for (CustomMap weekend : weekendList) {
			CustomMap map = new CustomMap();
			map.put("date", weekend.getString("date"));
			map.put("reason", weekend.getString("reason"));
			combinedDates.add(map);
		}
		
		List<CustomMap> removeDuplicates = removeDuplicates(combinedDates);
		
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate startDate = LocalDate.of(requestMap.getInt("year"), 1, 1); // 해당 년도의 1월 1일
        LocalDate endDate = LocalDate.of(requestMap.getInt("year"), 12, 31); // 해당 년도의 12월 31일
        
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
        	String yyyyMMdd = date.format(formatter);
        	String yyyy = yyyyMMdd.substring(0, 4);
        	String mm = yyyyMMdd.substring(5, 7);
        	String dd = yyyyMMdd.substring(8, 10);
        	CustomMap paramMap = new CustomMap();
        	paramMap.put("yyyy", yyyy);
        	paramMap.put("mm", mm);
        	paramMap.put("dd", dd);
        	paramMap.put("date", yyyyMMdd);
        	paramMap.put("holiday", "N");
        	paramMap.put("reason", "");
        	paramMap.put("system_creator", "BATCH");
        	paramMap.put("system_modifier", "BATCH");
        	
        	for (CustomMap item : removeDuplicates) {
				if (yyyyMMdd.equals(item.getString("date"))) {
					paramMap.put("holiday", "Y");
					paramMap.put("reason", item.getString("reason"));
					break;
				}
			}
        	// merge 문 : insert 이후 기존데이터 있으면 update
        	workdayDao.insertWorkday(paramMap);
        	
        	
        }
	}
	
	/***
	 * <pre>
	 * 해당년월의 토요일과 일요일 리스트 반환
	 * </pre>
	 * @param params
	 * @return
	 */
	public static List<CustomMap> findWeekendList(CustomMap params) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
        List<CustomMap> weekendList = new ArrayList<>();

        LocalDate startDate = LocalDate.of(params.getInt("year"), 1, 1); // 해당 년도의 1월 1일
        LocalDate endDate = LocalDate.of(params.getInt("year"), 12, 31); // 해당 년도의 12월 31일
        
        // startDate부터 endDate까지 하루씩 증가하며 토요일과 일요일인지 확인
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
            DayOfWeek dayOfWeek = date.getDayOfWeek();
            if (dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY) {
            	CustomMap weekend = new CustomMap();
            	weekend.put("date", date.format(formatter));
            	weekend.put("reason", dayOfWeek == DayOfWeek.SATURDAY ? "토요일" : "일요일");
                weekendList.add(weekend);
            }
        }

        return weekendList;
    }
	
	/***
	 * <pre>
	 * date 중복제거 및 정렬된 리스트 반환
	 * </pre>
	 * @param list
	 * @return
	 */
    public static List<CustomMap> removeDuplicates(List<CustomMap> list) {
    	
    	List<CustomMap> result = new ArrayList<>();
    	for (CustomMap map : list) {
    		if (!containsDate(result, map.getString("date"))) {
    			result.add(map);
    		}
    	}
    	
        result.sort(new Comparator<CustomMap>() {

			@Override
			public int compare(CustomMap o1, CustomMap o2) {
				if (o1.getString("date").equals(o2.getString("date"))) {
					return 0;
				} else {
					return o1.getString("date").compareTo(o2.getString("date"));
				}
			}
    		
		});
        return result;
    }
    
	/***
	 * <pre>
	 * date 중복여부 체크
	 * </pre>
	 * @param list
	 * @param date
	 * @return
	 */
    private static boolean containsDate(List<CustomMap> list, String date) {
        for (CustomMap map : list) {
            if (map.getString("date").equals(date)) {
                return true;
            }
        }
        return false;
    }
	
}
