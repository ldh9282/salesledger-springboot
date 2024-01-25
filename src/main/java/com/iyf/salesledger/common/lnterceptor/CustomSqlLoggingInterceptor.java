package com.iyf.salesledger.common.lnterceptor;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.springframework.beans.factory.annotation.Value;

import lombok.extern.log4j.Log4j2;

@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
@Log4j2
public class CustomSqlLoggingInterceptor implements Interceptor {

	@Value("${sql-logging-before-binding}")
	private boolean sqlLoggingBeforeBinding;
	
	@Value("${sql-logging-after-binding}")
	private boolean sqlLoggingAfterBinding;
	
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		if (log.isInfoEnabled()) {log.info("Start CustomSqlLoggingInterceptor.intercept");}
		
		StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        String originalSql = statementHandler.getBoundSql().getSql();
        Object parameterObject = statementHandler.getBoundSql().getParameterObject();
        
        List<Object> objectList = getObjectList(statementHandler.getBoundSql());
        Object[] objectArr = changeObjectListToArr(objectList);
        String paramSql = getParamSql(originalSql, objectArr);
        
        if (sqlLoggingBeforeBinding && log.isInfoEnabled()) {log.info("바인딩 전 쿼리 \n" + originalSql.replaceAll("\n\t\t", "\n"));}
        if ((sqlLoggingBeforeBinding || sqlLoggingAfterBinding) && log.isInfoEnabled()) {log.info("바인딩 파라미터 \n" + (parameterObject == null ? "empty parameterObject" : parameterObject));}
        if (sqlLoggingAfterBinding && log.isInfoEnabled()) {log.info("바인딩 후 쿼리 \n" + paramSql.replaceAll("\n\t\t", "\n"));}
        if (log.isInfoEnabled()) {log.info("End CustomSqlLoggingInterceptor.intercept");}
        
        return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		return Interceptor.super.plugin(target);
	}

	@Override
	public void setProperties(Properties properties) {
		Interceptor.super.setProperties(properties);
	}
	
	
	private static Object[] changeObjectListToArr(List<Object> objectList) {
		Object[] objectArr = new Object[objectList.size()];
		
		for (int i = 0; i < objectList.size(); i++) {
			objectArr[i] = objectList.get(i);
		}
		
		return objectArr;
		
	}
	
	private static List<Object> getObjectList(BoundSql bounsql) {
		List<Object> objectList = new ArrayList<>();
		
		Object parameterObject = bounsql.getParameterObject();
		
		List<ParameterMapping> parameterMappings = bounsql.getParameterMappings();
		
		try {
			for (ParameterMapping parameterMapping : parameterMappings) {
				
				String propertyName = parameterMapping.getProperty();
				
				if (PropertyUtils.isReadable(parameterObject, propertyName)) {
					// VO 객체인 경우 해당 필드 값을 가져와서 리스트에 추가
					Object object = PropertyUtils.getProperty(parameterObject, propertyName);
					objectList.add(object);
				} else { 
					// VO 객체가 아닌 경우 처리
					if (parameterObject instanceof Map) { 
						// Map 형태인 경우 해당 필드 값을 가져와서 리스트에 추가 
						Object object = ((Map<?, ?>) parameterObject).get(propertyName);
						objectList.add(object);
					} else {
						// 그 외의 경우 파라미터 자체를 리스트에 추가
						objectList.add(parameterObject);
					}
				}
			}
		} catch (IllegalAccessException e) {
			if (log.isInfoEnabled()) {log.info("getObjectList ::: IllegalAccessException ::: " + e);}
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			if (log.isInfoEnabled()) {log.info("getObjectList ::: InvocationTargetException ::: " + e);}
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			if (log.isInfoEnabled()) {log.info("getObjectList ::: NoSuchMethodException ::: " + e);}
			e.printStackTrace();
		} catch (Exception e) {
			if (log.isInfoEnabled()) {log.info("getObjectList ::: Exception ::: " + e);}
			e.printStackTrace();
		}
		
		
		return objectList;
	}
	
	private static String getParamSql(String originalSql, Object[] paramArr) {
		StringBuffer buffer = new StringBuffer();
		
		int questionMarkIndex;
		int questionMarkCnt = 0;
		int paramIndex = 0;
		
		while ((questionMarkIndex = originalSql.indexOf("?")) >= 0) {
			if (paramIndex == paramArr.length) {
				break;
			}
			
			// 버퍼에 ? 이전 부분을 추가
			buffer.append(originalSql.substring(0, questionMarkIndex));
			
			// 버퍼에 ? 대체값을 추가
			if (paramArr[paramIndex] instanceof String) {
				buffer.append("'" + paramArr[paramIndex]  + "'");
			} else if (paramArr[paramIndex] instanceof Integer || paramArr[paramIndex] instanceof Long) {
				buffer.append(paramArr[paramIndex]);
			} else if (paramArr[paramIndex] == null) {
				buffer.append("null");
			} else {
				buffer.append(paramArr[paramIndex]);
			}
			// originalSql 에서 ? 이전 부분을 제거
			originalSql = originalSql.substring(questionMarkIndex + "?".length());
			
			questionMarkCnt++;
			paramIndex++;
		}
		
		// 버퍼에 ? 이후 남은 originalSql 추가
		if (!"".equals(originalSql)) {
			buffer.append(originalSql);
		} 
		
		if (questionMarkCnt == 0) {
			return originalSql;
		} else {
			return buffer.toString();
		}
		
		
	}
	
}
