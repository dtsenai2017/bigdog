package br.com.bigdog.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.auth0.jwt.JWTVerifier;

import br.com.bigdog.admcontroller.AdmLogin;
import br.com.bigdog.clientecontroller.RestLoginController;

public class Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// Sa�da teste da URI
		System.out.println(request.getRequestURI());

		// Verifica se cont�m recursos
		if (request.getRequestURI().contains("resources")) {
			return true;
		}

		// M�todos autorizados para login de cliente e administrador
		if (handler instanceof HandlerMethod) {
			System.out.println("Handler inst�nciado!");

			// Handler
			HandlerMethod method = (HandlerMethod) handler;

			// P�ginas autorizadas para cliente
			if (request.getRequestURI().contains("home") || request.getRequestURI().contains("entrar")
					|| request.getRequestURI().contains("faca-parte") || request.getRequestURI().contains("categoria")
					|| request.getRequestURI().contains("produtos") || request.getRequestURI().contains("produto")
					|| request.getRequestURI().contains("addProduto")
					|| request.getRequestURI().contains("confirmarCompra")
					|| request.getRequestURI().contains("novo-agendamento")
					|| request.getRequestURI().contains("rest/login") || request.getRequestURI().contains("rest/logar")
					|| request.getRequestURI().contains("rest/verificaCpf")
					|| request.getRequestURI().contains("rest/verificaEmail")
					|| request.getRequestURI().contains("indexCliente") || request.getRequestURI().contains("search")) {

				// Retornando...
				return true;
			}

			// M�todos autorizados de login para cliente mobile e administrador
			if (method.getMethod().getName().equals("formLoginAdm") || method.getMethod().getName().equals("loginAdm")
					|| method.getMethod().getName().equals("logaAd")) {

				System.out.println("Handler method's autorizado!");

				// Retornando...
				return true;
			}

			// Verifica se h� cliente na sess�o
			if (request.getSession().getAttribute("clienteLogado") != null) {
				System.out.println("Cliente logado!");

				// Verifica uri
				if (request.getRequestURI().contains("adm")) {
					// Response 404
					response.sendError(HttpStatus.NOT_FOUND.value());

					// Retornando...
					return false;
				} else {
					// Retornando...
					return true;
				}
			}

			// Verifica se h� token
			if (request.getHeader("Authorization") != null) {
				// Verifica token de administrador
				if (request.getRequestURI().contains("adm")) {
					// Token
					String token = null;

					try {
						// Capturando token de requisi��o
						token = request.getHeader("Authorization");

						// Verificando token
						JWTVerifier verifier = new JWTVerifier(AdmLogin.SECRET);

						// Map com token
						Map<String, Object> claims = verifier.verify(token);

						System.out.println("Token do administrador v�lido.");

						// Retornando..
						return true;
					} catch (Exception e) {
						// Throw exception
						e.printStackTrace();

						// Verifica se h� um token
						if (token == null) {
							// Response 401
							response.sendError(HttpStatus.UNAUTHORIZED.value());
						} else {
							// Response 403
							response.sendError(HttpStatus.FORBIDDEN.value());
						}

						// Retornando..
						return false;
					}

					// Verifica token de cliente
				} else {
					// Token
					String token = null;

					try {
						// Capturando token de requisi��o
						token = request.getHeader("Authorization");

						// Verificando token
						JWTVerifier verifier = new JWTVerifier(RestLoginController.SECRET);

						// Map com token
						Map<String, Object> claims = verifier.verify(token);

						System.out.println("Token do cliente v�lido.");

						// Retornando..
						return true;
					} catch (Exception e) {
						// Throw exception
						e.printStackTrace();

						// Verifica se h� um token
						if (token == null) {
							// Response 401
							response.sendError(HttpStatus.UNAUTHORIZED.value());
						} else {
							// Response 403
							response.sendError(HttpStatus.FORBIDDEN.value());
						}

						// Retornando..
						return false;
					}
				}
			}
		}

		// Verifica se handler � valido (Inst�nciado)
		if (!(handler instanceof HandlerMethod)) {
			System.out.println("Handler n�o instanciado.");

			// Response 404
			response.sendError(HttpStatus.NOT_FOUND.value());

			// Retornando...
			return false;
		}

		System.out.println("Interceptor n�o autorizado.");

		// Response 404
		response.sendError(HttpStatus.NOT_FOUND.value());

		// Retornando...
		return false;
	}
}
