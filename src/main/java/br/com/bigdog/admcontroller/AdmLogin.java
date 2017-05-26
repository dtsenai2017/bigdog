package br.com.bigdog.admcontroller;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.auth0.jwt.JWTSigner;

import br.com.bigdog.model.Administrador;
import br.com.bigdog.model.TokenADM;

@RestController
public class AdmLogin {
	// Atributos para token
	public static final String EMISSOR = "BIGDOG";
	public static final String SECRET = "BigDogDTSenai2017";

	// Construtor
	public AdmLogin() {

	}

	// Requisições
	// Ir para formulário de login do administrador
	@RequestMapping(value = "admLogin")
	public ModelAndView formLoginAdm(ModelAndView mav) {
		// Atribuindo view
		mav.setViewName("administrador/login-administrador");

		// Retornando MaV
		return mav;
	}

	// Verificar Login
	public String loginAdm(@RequestBody Administrador administrador) {
		System.out.println(administrador.toString());

		// Verifica tipo de usuário
		if (administrador.getEmail().equals("admin_bigdog@gmail.com")
				&& administrador.getSenha().equals("bigdog1234")) {
			// HashMap para toke
			HashMap<String, Object> hash = new HashMap<String, Object>();

			// Atribuindo valores para HashMap
			hash.put("iss", EMISSOR);
			hash.put("adm", administrador.getEmail());

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
