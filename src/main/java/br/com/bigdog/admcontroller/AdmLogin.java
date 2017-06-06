package br.com.bigdog.admcontroller;

import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		// ...
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
	@RequestMapping(value = "loginAdm", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TokenADM> loginAdm(@RequestBody Administrador administrador) {
		System.out.println(administrador.toString());

		try {
			// Verifica tipo de usuário
			if (administrador.getEmail().equals("admin_bigdog@gmail.com")
					&& administrador.getSenha().equals("bigdog1234")) {
				// HashMap para token
				HashMap<String, Object> hash = new HashMap<String, Object>();

				// Atribuindo valores para HashMap
				hash.put("iss", EMISSOR);
				hash.put("adm", administrador.getEmail());

				// Atribuindo secret
				JWTSigner signer = new JWTSigner(SECRET);
				TokenADM tokenAdm = new TokenADM();

				// Atribuindo valor para token
				tokenAdm.setToken(signer.sign(hash));

				// Retornando token...
				return ResponseEntity.ok(tokenAdm);
			} else {
				// Retornando, caso usuario for null...
				return new ResponseEntity<TokenADM>(HttpStatus.UNAUTHORIZED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<TokenADM>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
