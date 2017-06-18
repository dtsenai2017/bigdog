package br.com.bigdog.clientecontroller;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.UsuarioRS;

@RestController
public class ClienteController {
	// Atributos
	private ClienteDAO dao;

	// Construtor
	@Autowired
	public ClienteController(ClienteDAO dao) {
		this.dao = dao;
	}

	// Verificar CPF
	@RequestMapping(value = "rest/verificaCpf/{cpf}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente verificaCpf(@PathVariable String cpf) {
		// Replace
		cpf = cpf.replace(" ", ".");

		// Retornando...
		try {
			return dao.buscaCpf(cpf);
		} catch (EntityNotFoundException e) {
			return null;
		}
	}

	// Verifica Email
	@RequestMapping(value = "rest/verificaEmail/{email}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente verificaEmail(@PathVariable String email) {
		// Replace
		email = email.replace(" ", ".");

		// Retornando...
		try {
			return dao.buscaEmail(email);
		} catch (EntityNotFoundException e) {
			return null;
		}
	}

	// Recuperar senha
	@RequestMapping(value = "rest/recuperarSenha", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> recuperarSenhar(@RequestBody UsuarioRS usuarioRS) {
		// Atribui valor encontrado
		Cliente clienteAtual = dao.buscaEmailCpf(usuarioRS.getEmail(), usuarioRS.getCpf());

		// Verifica se usuário é diferente de null (usuário encontrado)
		if (clienteAtual != null) {
			// Atribui senha nova
			clienteAtual.setSenha(usuarioRS.getSenhaNova());

			// Altera cliente
			try {
				dao.alterar(clienteAtual);

				// Retornando 200
				return new ResponseEntity<Void>(HttpStatus.OK);
			} catch (Exception e) {
				// Retornando 500
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
		} else {
			// Retornando 401
			return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
		}
	}
}
