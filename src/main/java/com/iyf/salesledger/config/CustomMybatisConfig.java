package com.iyf.salesledger.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.iyf.salesledger.common.lnterceptor.CustomSqlLoggingInterceptor;

@Configuration
public class CustomMybatisConfig {

	@Bean
	public CustomSqlLoggingInterceptor customSqlLoggingInterceptor() {
		return new CustomSqlLoggingInterceptor();
	}
}
