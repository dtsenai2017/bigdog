package br.com.bigdog.admcontroller;

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
import br.com.bigdog.model.Fornecedor;

@RestController
@RequestMapping("adm/")
public class FornecedorController {
	// Atributos
	private GenericDAO<Fornecedor> fornecedorDAO;

	// Construtor
	@Autowired
	public FornecedorController(GenericDAO<Fornecedor> fornecedorDAO) {
		this.fornecedorDAO = fornecedorDAO;
	}

	// Requisições
	// Inserir fornecedor (Fornecedor, Contato e UM endereço)
	@RequestMapping(value = "fornecedor", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirFornecedor(@RequestBody Fornecedor fornecedor) {
		// Inserir novo fornecedor
		System.out.println(fornecedor.toString());
		try {
			fornecedorDAO.inserir(fornecedor);
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Listar
	@RequestMapping(value = "fornecedor", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Fornecedor> listarFornecedor() {
		// Retornando lista
		return fornecedorDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "fornecedor/{id}", method = RequestMethod.GET)
	public Fornecedor listarFornecedor(@PathVariable("id") Long idFornecedor) {
		// Objeto que será retornado
		Fornecedor fornecedor = fornecedorDAO.listar(idFornecedor);
		
		// Inicializando endereços de fornecedor
		Hibernate.initialize(fornecedor.getEnderecos());
		
		// Retornando objeto
		return fornecedor;
	}
}
