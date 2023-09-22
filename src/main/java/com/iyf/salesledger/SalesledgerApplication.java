package com.iyf.salesledger;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication 
@MapperScan("com.iyf.salesledger.dao") // auto create mybatis dao class
@MapperScan("com.iyf.salesledger.common.batch.dao") // auto create mybatis dao class
@EnableScheduling // enable batch scheduler
public class SalesledgerApplication {

	public static void main(String[] args) {
		SpringApplication.run(SalesledgerApplication.class, args);
	}

	@Value("${server.servlet.context-path}")
	private String contextPath;
	
	@Value("${server.port}")
	private String serverPort;
	
	@Value("${spring.main.banner-mode}")
	private String springMainBannerMode;
	
	@Value("${logging.level.root}")
	private String loggingLevelRoot; 
	
	@Value("${logging.level.com.iyf.salesledger}")
	private String loggingLevelSalesLedger;
	/***
	 * @기능 서버구동시작후 실행되는 메서드
	 */
	@Bean
	public CommandLineRunner commandLineRunner(String[] args) {
		return runner -> {
			System.out.println("=======================================================================================================");
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " spring.main.banner-mode=" + springMainBannerMode);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " logging.level.root=" + loggingLevelRoot);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " logging.level.root=" + loggingLevelSalesLedger);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " " + getServerIP() +  ":" + serverPort + contextPath);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " 서버구동이 완료되었습니다");
			System.out.println("=======================================================================================================");
			
		};
	}
	
	private static String getServerIP() {
		String serverIP = null;
		
		try {
			InetAddress localhost = InetAddress.getLocalHost();
			serverIP = localhost.getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		
		return serverIP; 
	}
}
