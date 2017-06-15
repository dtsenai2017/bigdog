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

import br.com.bigdog.dao.AgendamentoDAO;
import br.com.bigdog.dao.CategoriaDAO;
import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.dao.CompraDAO;
import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.dao.ServicoDAO;
import br.com.bigdog.model.Agendamento;
import br.com.bigdog.model.Categoria;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Compra;
import br.com.bigdog.model.Fornecedor;
import br.com.bigdog.model.Produto;
import br.com.bigdog.model.Servico;

@RestController
@RequestMapping(value = "adm/")
public class TestController {
	// Atributos
	private ClienteDAO clienteDAO;
	private CategoriaDAO categoriaDAO;
	private GenericDAO<Fornecedor> fornecedorDAO;
	private ProdutoDAO produtoDAO;
	private ServicoDAO servicoDAO;
	private AgendamentoDAO agendamentoDAO;
	private CompraDAO compraDAO;

	// Construtor
	@Autowired
	public TestController(ClienteDAO clienteDAO, CategoriaDAO categoriaDAO, GenericDAO<Fornecedor> fornecedorDAO,
			ProdutoDAO produtoDAO, CompraDAO compraDAO, ServicoDAO servicoDAO, AgendamentoDAO agendamentoDAO) {
		this.clienteDAO = clienteDAO;
		this.categoriaDAO = categoriaDAO;
		this.fornecedorDAO = fornecedorDAO;
		this.produtoDAO = produtoDAO;
		this.compraDAO = compraDAO;
		this.servicoDAO = servicoDAO;
		this.agendamentoDAO = agendamentoDAO;
	}

	// INSERÇÂO DE DADOS : Cliente, Endereço de Cliente, Pet e Contato
	@RequestMapping(value = "dataTestCliente", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	@RequestMapping(value = "dataTestCategoria", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	@RequestMapping(value = "dataTestFornecedor", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestFornecedor(@RequestBody List<Fornecedor> fornecedores) {
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
	@RequestMapping(value = "dataTestProduto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestProduto(@RequestBody List<Produto> produtos) {
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

	// INSERÇÂO DE DADOS : Compra
	@RequestMapping(value = "dataTestCompra", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestCompra(@RequestBody List<Compra> compras) {
		// Inserindo lista
		for (Compra compra : compras) {
			compraDAO.inserir(compra);
		}

		// Retornando
		return ResponseEntity.ok().build();
	}

	// INSERÇÃO DE DADOS : Serviço
	@RequestMapping(value = "dataTestServico", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestServico(@RequestBody List<Servico> servicos) {
		// Inserindo lista
		try {
			// Inserindo lista de dados
			for (Servico servico : servicos) {
				servicoDAO.inserir(servico);
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

	// INSERÇÃO DE DADOS : Agendamento
	@RequestMapping(value = "dataTestAgendamento", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestAgendamento(@RequestBody List<Agendamento> agendamentos) {
		// Inserindo lista
		try {
			// Inserindo lista de dados
			for (Agendamento agendamento : agendamentos) {
				agendamentoDAO.inserir(agendamento);
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
