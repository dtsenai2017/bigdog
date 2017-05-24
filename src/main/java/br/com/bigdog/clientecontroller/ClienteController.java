package br.com.bigdog.clientecontroller;

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

	@Autowired
	public ClienteController(ClienteDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "rest/verificaCpf/{cpf}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente verificaCpf(@PathVariable String cpf) {
		cpf = cpf.replace(" ", ".");
		System.out.println(cpf);
		return dao.buscaCpf(cpf);
	}
}
