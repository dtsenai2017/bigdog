package br.com.bigdog.admcontroller;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Contato;
import br.com.bigdog.model.EnderecoFornecedor;
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

	// Requisi��es
	// Inserir fornecedor (Fornecedor, Contato e UM endere�o)
	@RequestMapping(value = "fornecedor", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirFornecedor(@RequestBody Fornecedor fornecedor) {
		// Inserir novo fornecedor
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

	// Alterar fornecedor
	@RequestMapping(value = "fornecedor/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long idFornecedor, @RequestBody Fornecedor fornecedor) {
		// Fornecedor atual
		Fornecedor fornecedorAtual = fornecedorDAO.listar(idFornecedor);
		Contato contatoAtual = fornecedorAtual.getContato();
		Contato contato = fornecedor.getContato();

		// Atribuindo valor para contato
		contatoAtual.setEmail(contato.getEmail());
		contatoAtual.setCelular(contato.getCelular());
		contatoAtual.setTelefone(contato.getTelefone());

		// Alterando campos (Todos campos alter�veis)
		fornecedorAtual.setNomeFantasia(fornecedor.getNomeFantasia());
		fornecedorAtual.setRazaoSocial(fornecedor.getRazaoSocial());
		fornecedorAtual.setContato(contatoAtual);
		fornecedorAtual.setCnpj(fornecedor.getCnpj());

		// Inserir novo fornecedor
		try {
			fornecedorDAO.alterar(fornecedorAtual);
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
		// Objeto que ser� retornado
		Fornecedor fornecedor = fornecedorDAO.listar(idFornecedor);

		// Inicializando endere�os de fornecedor
		Hibernate.initialize(fornecedor.getEnderecos());

		// Retornando objeto
		return fornecedor;
	}

	// Inserir Endere�o em fornecedor
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirEndereco(@PathVariable("id") Long idFornecedor,
			@RequestBody EnderecoFornecedor endereco) {
		// Atribuindo valor
		Fornecedor fornecedor = fornecedorDAO.listar(idFornecedor);
		Hibernate.initialize(fornecedor.getEnderecos());

		// Lista
		List<EnderecoFornecedor> enderecos = fornecedor.getEnderecos();

		// Atribuindo endereco em lista de fornecedor
		enderecos.add(endereco);

		// Adicionando lista alterada
		fornecedor.setEnderecos(enderecos);

		// Inserindo
		try {
			fornecedorDAO.alterar(fornecedor);
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Excluir fornecedor
	@RequestMapping(value = "fornecedor/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idFornecedor) {
		// Excluindo fornecedor
		try {
			fornecedorDAO.excluir(idFornecedor);
			return ResponseEntity.ok().build();
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
