package br.com.bigdog.test;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Categoria;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Fornecedor;
import br.com.bigdog.model.Produto;

@RestController
public class TestController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;
	private GenericDAO<Categoria> categoriaDAO;
	private GenericDAO<Fornecedor> fornecedorDAO;
	private GenericDAO<Produto> produtoDAO;

	// Construtor
	@Autowired
	public TestController(GenericDAO<Cliente> clienteDAO, GenericDAO<Categoria> categoriaDAO,
			GenericDAO<Fornecedor> fornecedorDAO, GenericDAO<Produto> produtoDAO) {
		this.clienteDAO = clienteDAO;
		this.categoriaDAO = categoriaDAO;
		this.fornecedorDAO = fornecedorDAO;
		this.produtoDAO = produtoDAO;
	}

	// INSERÇÂO DE DADOS : Cliente, Endereço de Cliente, Pet e Contato
	@RequestMapping(value = "/dataInsertCliente", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestCliente(@RequestBody List<Cliente> clientes) {
		try {
			// Inserindo lista de dados
			for (Cliente cliente : clientes) {
				clienteDAO.inserir(cliente);
			}
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// INSERÇÃO DE DADOS : Categoria e Subcategoria
	@RequestMapping(value = "/dataInsertCategoria", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestCategoria(@RequestBody List<Categoria> categorias) {
		try {
			// Inserindo lista de dados
			for (Categoria categoria : categorias) {
				categoriaDAO.inserir(categoria);
			}
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// INSERÇÃO DE DADOS : Fornecedor, Endereço de Fornecedor e Contato
	@RequestMapping(value = "/dataInsertFornecedor", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataInsertFornecedor(@RequestBody List<Fornecedor> fornecedores) {
		try {
			// Inserindo lista de dados
			for (Fornecedor fornecedor : fornecedores) {
				fornecedorDAO.inserir(fornecedor);
			}
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// INSERÇÃO DE DADOS : Produto
	@RequestMapping(value = "/dataInsertProduto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataInsertProduto(@RequestBody List<Produto> produtos) {
		try {
			// Inserindo lista de dados
			for (Produto produto : produtos) {
				produtoDAO.inserir(produto);
			}
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
