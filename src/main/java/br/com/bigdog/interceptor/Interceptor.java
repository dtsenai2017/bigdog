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

		// Saída teste da URI
		System.out.println("URI : " + request.getRequestURI());

		// Verifica se contém recursos
		if (request.getRequestURI().contains("resources")) {
			return true;
		}

		// Métodos autorizados para login de cliente e administrador
		if (handler instanceof HandlerMethod) {
			System.out.println("Handler instânciado!");

			// Handler
			HandlerMethod method = (HandlerMethod) handler;

			// Páginas autorizadas para cliente
			if (request.getRequestURI().contains("sobreNos") || request.getRequestURI().contains("home")
					|| request.getRequestURI().contains("entrar") || request.getRequestURI().contains("esqueciSenha")
					|| request.getRequestURI().contains("faca-parte") || request.getRequestURI().contains("categoria")
					|| request.getRequestURI().contains("produtos") || request.getRequestURI().contains("produto")
					|| request.getRequestURI().contains("novo-agendamento")
					|| request.getRequestURI().contains("addProduto") || request.getRequestURI().contains("rest/login")
					|| request.getRequestURI().contains("rest/logar")
					|| request.getRequestURI().contains("rest/recuperarSenha")
					|| request.getRequestURI().contains("rest/verificaCpf")
					|| request.getRequestURI().contains("rest/verificaEmail")
					|| request.getRequestURI().contains("rest/esqueceuSenhaCpf")
					|| request.getRequestURI().contains("indexCliente") || request.getRequestURI().contains("search")) {

				// Verifica se contem adm na requisição
				if (!request.getRequestURI().contains("adm")) {
					System.out.println("URI autorizada somente para cliente");

					// Retornando...
					return true;
				}
			}

			// Métodos autorizados de login para cliente mobile e administrador
			if (method.getMethod().getName().equals("formLoginAdm")
					|| method.getMethod().getName().equals("loginAdm")) {
				// Limpando sessão de cliente
				if (request.getSession().getAttribute("clienteLogado") != null) {
					request.getSession().invalidate();
				}

				System.out.println("Handler method adm autorizado!");

				// Retornando...
				return true;
			} else if (method.getMethod().getName().equals("logaAd")) {
				System.out.println("Handler method cliente autorizado!");

				// Retornando...
				return true;
			}

			// Verifica se há cliente na sessão
			if (request.getSession().getAttribute("clienteLogado") != null) {
				// Verifica uri se contém adm
				if (request.getRequestURI().contains("adm")) {
					// Response 404
					response.sendError(HttpStatus.NOT_FOUND.value());

					System.out.println("Cliente logado no adm");

					// Retornando...
					return false;
				} else {
					System.out.println("Cliente logado!");

					// Retornando...
					return true;
				}
			}

			// Verifica se há token
			if (request.getHeader("Authorization") != null) {
				// Verifica token de administrador
				if (request.getRequestURI().contains("adm")) {
					// Token
					String token = null;

					try {
						// Capturando token de requisição
						token = request.getHeader("Authorization");

						// Verificando token
						JWTVerifier verifier = new JWTVerifier(AdmLogin.SECRET);

						// Map com token
						Map<String, Object> claims = verifier.verify(token);

						System.out.println("Token do administrador válido.");

						// Retornando..
						return true;
					} catch (Exception e) {
						// Throw exception
						e.printStackTrace();

						// Verifica se há um token
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
				} else if (request.getRequestURI().contains("and")) {
					// Token
					String token = null;

					try {
						// Capturando token de requisição
						token = request.getHeader("Authorization");

						// Verificando token
						JWTVerifier verifier = new JWTVerifier(RestLoginController.SECRET);

						// Map com token
						Map<String, Object> claims = verifier.verify(token);

						System.out.println("Token do cliente válido.");

						// Retornando..
						return true;
					} catch (Exception e) {
						// Throw exception
						e.printStackTrace();

						// Verifica se há um token
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

		// Verifica se handler é valido (Instânciado)
		if (!(handler instanceof HandlerMethod)) {
			System.out.println("Handler não instanciado.");

			// Response 404
			response.sendError(HttpStatus.NOT_FOUND.value());

			// Retornando...
			return false;
		}

		System.out.println("Interceptor não autorizado.");

		// Response 404
		response.sendError(HttpStatus.NOT_FOUND.value());

		// Retornando...
		return false;
	}
}
