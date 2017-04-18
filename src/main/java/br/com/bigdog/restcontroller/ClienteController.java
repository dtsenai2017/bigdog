package br.com.bigdog.restcontroller;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Cliente;

@RestController
public class ClienteController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;

	// Construtor
	@Autowired
	public ClienteController(GenericDAO<Cliente> clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	// Inserir
	@RequestMapping(value = "/cliente", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Cliente> inserir(@RequestBody Cliente cliente) {
		try {
			clienteDAO.inserir(cliente);
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// ??? O QUE?
	// Alterar
	// @RequestMapping(value = "/cliente/{id}", method = RequestMethod.PUT,
	// consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	// public ResponseEntity<Cliente> alterar(@PathVariable("id") Long id,
	// Contato contato) {
	//
	// // Alterando...
	// clienteDAO.alterar(cliente);
	//
	// // Retornando cliente alterado
	// return ResponseEntity.created(URI.create("/cliente/" +
	// cliente.getIdCliente())).body(cliente);
	// }

	// Listar
	@RequestMapping(value = "/cliente", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Cliente> listar() {
		return clienteDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "/cliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente listar(@PathVariable("id") Long id) {
		System.out.println("ID");

		// Buscando cliente
		Cliente cliente = clienteDAO.listar(id);

		// Inicializando objetos(listas) de cliente
		Hibernate.initialize(cliente.getEnderecos());
		Hibernate.initialize(cliente.getPets());

		// Retornando
		return cliente;
	}

	// Excluir
	@RequestMapping(value = "/cliente/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long id) {
		clienteDAO.excluir(id);
		return ResponseEntity.ok().build();
	}
}
