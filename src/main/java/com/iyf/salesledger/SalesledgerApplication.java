package com.iyf.salesledger;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication 
@MapperScan("com.iyf.salesledger.**.dao") // auto create mybatis dao class
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
	
	private long startTime = 0L;
	private long endTime = 0L;
	
	/***
	 * @기능 서버구동시작후 실행되는 메서드
	 */
	@Bean
	public CommandLineRunner commandLineRunner(String[] args) {
		return runner -> {
			startTime = System.currentTimeMillis();
			
			System.out.println("=======================================================================================================");
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " spring.main.banner-mode=" + springMainBannerMode);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " logging.level.root=" + loggingLevelRoot);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " logging.level.com.iyf.salesledger=" + loggingLevelSalesLedger);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " " + getServerIP() +  ":" + serverPort + contextPath);
			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " 서버구동이 완료되었습니다");
			System.out.println("=======================================================================================================");
			
		};
	}
	
	/***
	 * @기능 서버구동종료후 실행되는 메서드
	 */
	@Bean
	public ApplicationListener<ContextClosedEvent> applicationListener()  {
		return new ApplicationListener<ContextClosedEvent>() {
            @Override
            public void onApplicationEvent(ContextClosedEvent event) {
            	
            	endTime = System.currentTimeMillis();
            	Instant startTimeInstance = Instant.ofEpochMilli(startTime);
            	Instant endTimeInstance = Instant.ofEpochMilli(endTime);
                
                LocalDateTime startTimelocalDateTime = LocalDateTime.ofInstant(startTimeInstance, ZoneId.systemDefault());
                LocalDateTime endTimelocalDateTime = LocalDateTime.ofInstant(endTimeInstance, ZoneId.systemDefault());
                
    			System.out.println("=======================================================================================================");
    			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " 서버 구동시작  ::: " + startTimelocalDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")));
    			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " 서버 구동종료  ::: " + endTimelocalDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")));
    			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " 서버 구동시간  ::: " + (endTime - startTime) / 1000 / 3600 + " 시간 " + (endTime - startTime) / 1000 % 3600 / 60 + " 분 " + (endTime - startTime) / 1000 % 60 + " 초 ");
    			System.out.println(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm:ss")) + " 서버구동이 종료되었습니다");
    			System.out.println("=======================================================================================================");
            }
        };
		
	}
	
	/***
	 * @기능 localhost 대신 서버 ip 직접 확인용도
	 */
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
