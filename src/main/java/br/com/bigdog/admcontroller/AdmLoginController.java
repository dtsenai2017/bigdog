package br.com.bigdog.admcontroller;

import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.auth0.jwt.JWTSigner;

import br.com.bigdog.model.TokenADM;
import br.com.bigdog.model.Usuario;

@RestController
public class AdmLoginController {
	// Atributos
	public static final String EMISSOR = "BIGDOG";
	public static final String SECRET = "BigDogDTSenai2017";

	// Requisições
	@RequestMapping(value = "admlogin", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TokenADM> login(@RequestBody Usuario usuario) {
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

			// Retornando
			return ResponseEntity.ok(tokenADM);
		} else {
			System.out.println("CLIENTE");
			return new ResponseEntity<TokenADM>(HttpStatus.UNAUTHORIZED);
		}
	}
}
