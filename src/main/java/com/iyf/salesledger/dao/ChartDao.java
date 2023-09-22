package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ChartDao {

	List<Map<String, Object>> salesThisYearResultListByCompanyAndDepartment(@Param("company") String company, @Param("department") String department);
}
