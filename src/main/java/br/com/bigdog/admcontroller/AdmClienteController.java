package br.com.bigdog.admcontroller;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Cliente;

@RestController
public class AdmClienteController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;

	// Construtor
	@Autowired
	public AdmClienteController(GenericDAO<Cliente> clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	// Requisições
	// Visualizar cliente (Endereço, Pets, Compras e Agendamentos)
	@RequestMapping(value = "visualizarCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente visualizarCliente(@PathVariable("id") Long id) {
		// Buscando cliente
		Cliente cliente = clienteDAO.listar(id);

		// Inicializando objetos(listas) de cliente
		Hibernate.initialize(cliente.getEnderecos());
		Hibernate.initialize(cliente.getPets());
		// Hibernate.initialize(cliente.getCompras());
		// Hibernate.initialize(cliente.getAgendamentos());

		// Retornando
		return cliente;
	}

	// Listar
	@RequestMapping(value = "/admCliente", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Cliente> listar() {
		return clienteDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "/admCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente listar(@PathVariable("id") Long id) {
		// Buscando cliente
		Cliente cliente = clienteDAO.listar(id);

		// Inicializando objetos(listas) de cliente
		Hibernate.initialize(cliente.getEnderecos());
		Hibernate.initialize(cliente.getPets());

		// Retornando
		return cliente;
	}

	// Excluir
	@RequestMapping(value = "/admCliente/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long id) {
		clienteDAO.excluir(id);
		return ResponseEntity.ok().build();
	}

	// Alterar Cliente (Nome, CPF, Email, Genero, Nascimento)
	// ...
}
