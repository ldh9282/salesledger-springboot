package com.iyf.salesledger.common.lnterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.NamedThreadLocal;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomURLInterceptor implements HandlerInterceptor {

	private ThreadLocal<Long> startTime = new NamedThreadLocal<>("startTime");
	private ThreadLocal<Long> endTime = new NamedThreadLocal<>("endTime");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		startTime.set(System.currentTimeMillis());
		
		String url = request.getRequestURL().toString();
		String queryString = request.getQueryString() == null ? "" : "?" + request.getQueryString();
		String method = request.getMethod();
		
		if (log.isInfoEnabled()
				&& url.indexOf(request.getContextPath() + "/resources") == -1
				&& url.indexOf(request.getContextPath() + "/error") == -1
				) {
			log.info("Start URLInterceptor.preHandle");
			log.info("request ::: url ::: " + url + queryString);
			log.info("request ::: method ::: " + method);
			log.info("response ::: status ::: " + response.getStatus());
			log.info("End URLInterceptor.preHandle");
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
				) {
			log.info("Start URLInterceptor.afterCompletion");
			log.info("handler ::: " + handler + " ::: " + "remote ip" + " ::: " + ip + " ::: " + "session" + " ::: " + session);
			log.info("execution time  ::: " + (endTime.get() - startTime.get()) + "ms");
			log.info("End URLInterceptor.afterCompletion");
		}
	}


}