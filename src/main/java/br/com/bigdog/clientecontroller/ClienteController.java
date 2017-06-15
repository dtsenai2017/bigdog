package br.com.bigdog.clientecontroller;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.model.Cliente;

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
	@RequestMapping(value = "rest/esqueceuSenhaCpf/{email}&{cpf}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente recuperaSenha(@PathVariable String email, @PathVariable String cpf) {
		// Replace
		cpf = cpf.replace(" ", ".");
		System.out.println(cpf);
		email = email.replace(" ", ".");

		// Retornando...
		try {
			return dao.buscaEmailCpf(email, cpf);
		} catch (EntityNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
}
