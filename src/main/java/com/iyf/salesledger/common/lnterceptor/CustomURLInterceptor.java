package com.iyf.salesledger.common.lnterceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.NamedThreadLocal;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomURLInterceptor implements HandlerInterceptor {

	private ThreadLocal<Long> startTime = new NamedThreadLocal<>("startTime");
	private ThreadLocal<Long> endTime = new NamedThreadLocal<>("endTime");
	private String requsetUrl;
	private String requsetMethod;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		startTime.set(System.currentTimeMillis());
		
		
		String url = request.getRequestURL().toString();
		String queryString = request.getQueryString() == null ? "" : "?" + request.getQueryString();
		String method = request.getMethod();
		
		String ip = request.getRemoteAddr().toString();
		String session = request.getSession().getId();
		
		
		if (log.isInfoEnabled()
				&& url.indexOf(request.getContextPath() + "/resources") == -1
				&& url.indexOf(request.getContextPath() + "/error") == -1
				&& handler instanceof HandlerMethod
				) {
			
			try {
				HandlerMethod handlerMethod = (HandlerMethod) handler;
				String className = handlerMethod.getBeanType().getName();
				String methodName = handlerMethod.getMethod().getName();
				
				requsetUrl = url + queryString;
				requsetMethod = method;
				log.info(">>> Start CustomURLInterceptor.preHandle");
				log.info(">>> handler ::: " + className + "." + methodName); 
//				log.info("remote ip" + " ::: " + ip + " ::: " + "session" + " ::: " + session); 
				log.info(">>> request ::: url ::: " + requsetUrl);
				log.info(">>> request ::: method ::: " + requsetMethod);
				
				Enumeration<String> parameterNames = request.getParameterNames();
				while (parameterNames.hasMoreElements()) {
					String paramName = parameterNames.nextElement();
					log.info(">>> request ::: param ::: " + paramName + " ::: " + request.getParameter(paramName));
				}
				
				log.info(">>> End CustomURLInterceptor.preHandle");
			} catch (Exception e) {
				log.info(">>> Exception ::: " + e.getMessage());
				log.info(">>> error request ::: url ::: " + requsetUrl);
			}
		}
		
		
		return true;
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		String url = request.getRequestURL().toString();
		String ip = request.getRemoteAddr().toString();
		String session = request.getSession().getId();
		
		endTime.set(System.currentTimeMillis());
		if (log.isInfoEnabled()
				&& url.indexOf(request.getContextPath() + "/resources") == -1
				&& url.indexOf(request.getContextPath() + "/error") == -1
				&& handler instanceof HandlerMethod
				) {
			
			try {
				
				HandlerMethod handlerMethod = (HandlerMethod) handler;
				String className = handlerMethod.getBeanType().getName();
				String methodName = handlerMethod.getMethod().getName();
				
				log.info("<<< Start CustomURLInterceptor.afterCompletion");
//				log.info("remote ip" + " ::: " + ip + " ::: " + "session" + " ::: " + session);
				log.info("<<< request ::: url ::: " + requsetUrl);
				log.info("<<< request ::: method ::: " + requsetMethod);
				log.info("<<< execution time  ::: " + (endTime.get() - startTime.get()) + "ms");
				
				// ThreadLocal 변수 정리 ::: 메모리 누수를 방지
				startTime.remove();
				endTime.remove();
				
				log.info("<<< End CustomURLInterceptor.afterCompletion");
			} catch (Exception e) {
				log.info(">>> Exception ::: " + e.getMessage());
				log.info(">>> error request ::: url ::: " + requsetUrl);
			}
		}
	}


}