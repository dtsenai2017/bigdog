package br.com.bigdog.clientecontroller;

import java.net.URI;
import java.util.HashMap;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.auth0.jwt.JWTSigner;

import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.TokenCliente;
import br.com.bigdog.util.Gerador;

@RestController
public class RestLoginController {
	// Atributos para token
	public static final String EMISSOR = "BIGDOG";
	public static final String SECRET = "BigDogCliente1234";

	// Atributos
	private ClienteDAO clienteDAO;

	// Construtor
	@Autowired
	public RestLoginController(ClienteDAO clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	// Cadastro de cliente
	@RequestMapping(value = "rest/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Cliente> cadastra(@RequestBody Cliente cliente) {
		try {
			Gerador g = new Gerador();
			String idR = String.valueOf(g.gerarIdLogin());
			if (cliente.getId_redes() != null) {
				clienteDAO.inserir(cliente);
			} else {
				cliente.setId_redes(idR);
				clienteDAO.inserir(cliente);
			}
			return ResponseEntity.created(URI.create("/cliente/")).body(cliente);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Login por redes sociais
	@RequestMapping(value = "rest/loginRedes/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente posCadastro(@PathVariable String id) {
		return clienteDAO.busca(id);
	}

	// Logar
	@RequestMapping(value = "rest/logar", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Cliente> logar(@RequestBody Cliente cliente) {
		try {
			cliente = clienteDAO.logar(cliente);
			if (cliente != null) {
				return ResponseEntity.ok(cliente);
			} else {
				return new ResponseEntity<Cliente>(HttpStatus.UNAUTHORIZED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Logar no Android com token
	@RequestMapping(value = "and/logaAd", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TokenCliente> logaAd(@RequestBody Cliente cliente) {
		try {
			// Cliente que está se logando
			Cliente user = clienteDAO.logar(cliente);

			// Verifica usuário
			if (user != null) {
				// HashMap para token
				HashMap<String, Object> clains = new HashMap<String, Object>();

				// Atribuindo valores para HashMap
				clains.put("iss", EMISSOR);
				clains.put("id_user", user.getIdCliente());
				clains.put("nome_user", user.getNome());

				// Atribuindo valor de expiração por tempo
				long hora_atual = System.currentTimeMillis() / 1000;
				long hora_expiracao = hora_atual + 3600;
				clains.put("iat", hora_atual);
				clains.put("exp", hora_expiracao);

				// Atribuindo secret
				JWTSigner signer = new JWTSigner(SECRET);
				TokenCliente tokenJWT = new TokenCliente();

				// Atribuindo valor de hashmap e cliente para token
				tokenJWT.setToken(signer.sign(clains));
				tokenJWT.setCliente(user);

				// Retornando token
				return ResponseEntity.ok(tokenJWT);
			} else {
				// Retornando, caso usuario for null...
				return new ResponseEntity<TokenCliente>(HttpStatus.UNAUTHORIZED);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<TokenCliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
