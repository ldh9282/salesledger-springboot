package com.iyf.salesledger.common.lnterceptor;

import java.sql.Connection;
import java.util.Properties;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;

import lombok.extern.log4j.Log4j2;

@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
@Log4j2
public class CustomSqlLoggingInterceptor implements Interceptor {

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        String originalSql = statementHandler.getBoundSql().getSql();
        Object parameterObject = statementHandler.getBoundSql().getParameterObject();
        if (log.isInfoEnabled()) {log.info("Start::: CustomSqlLoggingInterceptor.intercept");}
        if (log.isInfoEnabled()) {log.info("statementHandler ::: getBoundSql ::: getSql \n" + originalSql.replaceAll("\n\t\t", "\n"));}
        if (log.isInfoEnabled()) {log.info("statementHandler ::: getBoundSql ::: getParameterObject \n" + (parameterObject == null ? "empty parameterObject" : parameterObject));}
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
	
	
	
}
