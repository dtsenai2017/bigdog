package br.com.bigdog.test;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.auth0.jwt.JWTSigner;

import br.com.bigdog.model.TokenADM;
import br.com.bigdog.model.Usuario;

@Controller
public class ViewsController {
	// Atributos para token
	public static final String EMISSOR = "BIGDOG";
	public static final String SECRET = "BigDogDTSenai2017";

	// VIEWS ~
	// Login index
	@RequestMapping("/login")
	public String login() {
		return "index";
	}

	// Navbar
	@RequestMapping("/navbar")
	public String navbar() {
		return "administrador/component/navbar";
	}

	@RequestMapping("/footer")
	public String footer() {
		return "administrador/component/footer";
	}

	// Index Administrador
	@RequestMapping("/indexAdministrador")
	public String indexAdministrador() {
		return "administrador/index_administrador";
	}

	// LOGIN ADM TEST
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginADM(Usuario usuario, HttpServletResponse response) {
		System.out.println(usuario.toString());

		// Verifica tipo de usuário
		if (usuario.getEmail().equals("admin_bigdog@gmail.com") && usuario.getSenha().equals("bigdog1234")) {
			// HashMap para toke
			HashMap<String, Object> hash = new HashMap<String, Object>();

			// Atribuindo valores para HashMap
			hash.put("iss", EMISSOR);
			hash.put("adm", usuario.getEmail());

			// Atribuindo se
			JWTSigner signer = new JWTSigner(SECRET);
			TokenADM tokenADM = new TokenADM();

			// Atribuindo valor para token
			tokenADM.setToken(signer.sign(hash));

			// Atribuindo valor para header
			// ...

			// Retornando
			System.out.println(tokenADM);

			return "administrador/index_administrador";
		} else {
			System.out.println("CLIENTE");
			return "NULL";
		}
	}
}
