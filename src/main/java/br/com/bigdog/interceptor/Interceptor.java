package br.com.bigdog.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.auth0.jwt.JWTVerifier;

import br.com.bigdog.admcontroller.AdmLogin;

public class Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if (request.getRequestURI().contains("resources")) {
			return true;
		}

		// Verifica se handler é valido (Instânciado)
		if (!(handler instanceof HandlerMethod)) {
			return true;
		}

		// Handler
		HandlerMethod method = (HandlerMethod) handler;

		// Teste
		// System.out.println("Pacote : " +
		// method.getBean().getClass().getName());
		// System.out.println("Controller (Class) : " +
		// method.getBean().getClass().getSimpleName());
		// System.out.println("Método : " + method.getMethod().getName());
		// System.out.println("URI : " + request.getRequestURI());

		// CLIENTE
		// ...

		// ADMINISTRADOR
		// Formulário de login
		if (method.getMethod().getName().equals("formLoginAdm") || method.getMethod().getName().equals("loginAdm")) {
			return true;
		} else {
			String token = null;
			try {
				token = request.getHeader("Authorization");

				JWTVerifier verifier = new JWTVerifier(AdmLogin.SECRET);

				Map<String, Object> claims = verifier.verify(token);

				return true;
			} catch (Exception e) {
				e.printStackTrace();
				if (token == null) {
					response.sendError(HttpStatus.UNAUTHORIZED.value());
				} else {
					response.sendError(HttpStatus.FORBIDDEN.value());
				}
				return false;
			}
		}
	}
}
