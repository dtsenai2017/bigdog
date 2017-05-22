package br.com.bigdog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Handler
		HandlerMethod method = (HandlerMethod) handler;
		
		System.out.println("M�todo Chamado ==>" + method.getMethod().getName());
		System.out.println("Controller Chamado ==>" + method.getBean().getClass().getSimpleName());

		// CLIENTE

		// ADMINISTRADOR

		return super.preHandle(request, response, handler);
	}
}
