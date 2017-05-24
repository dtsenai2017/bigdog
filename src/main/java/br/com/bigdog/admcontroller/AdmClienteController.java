package br.com.bigdog.admcontroller;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.model.Cliente;

@RestController
@RequestMapping(value = "adm/")
public class AdmClienteController {
	// Atributos
	private ClienteDAO clienteDAO;

	// Construtor
	@Autowired
	public AdmClienteController(ClienteDAO clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	// Requisições
	// Listar
	@RequestMapping(value = "cliente", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Cliente> listar() {
		try {
			// Retornando
			return clienteDAO.listar();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Listar (id)
	@RequestMapping(value = "cliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente listar(@PathVariable("id") Long id) {
		try {
			// Buscando cliente
			Cliente cliente = clienteDAO.listar(id);

			// Inicializando objetos(listas) de cliente
			Hibernate.initialize(cliente.getEnderecos());
			Hibernate.initialize(cliente.getPets());
			// Hibernate.initialize(cliente.getAgendamentos());

			// Retornando
			return cliente;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Excluir
	@RequestMapping(value = "cliente/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long id) {
		try {
			// Excluindo
			clienteDAO.excluir(id);

			// Retornando
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
