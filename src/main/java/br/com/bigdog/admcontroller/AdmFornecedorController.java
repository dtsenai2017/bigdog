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
@RequestMapping(value = "adm/")
public class AdmFornecedorController {
	// Atributos
	private GenericDAO<Fornecedor> fornecedorDAO;

	// Construtor
	@Autowired
	public AdmFornecedorController(GenericDAO<Fornecedor> fornecedorDAO) {
		this.fornecedorDAO = fornecedorDAO;
	}

	// Requisições
	// Inserir fornecedor (Fornecedor, Contato e UM endereço)
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
		try {
			// Fornecedor atual
			Fornecedor fornecedorAtual = fornecedorDAO.listar(idFornecedor);
			Contato contatoAtual = fornecedorAtual.getContato();
			Contato contato = fornecedor.getContato();

			// Atribuindo valor para contato
			contatoAtual.setEmail(contato.getEmail());
			contatoAtual.setCelular(contato.getCelular());
			contatoAtual.setTelefone(contato.getTelefone());

			// Alterando campos (Todos campos alteráveis)
			fornecedorAtual.setNomeFantasia(fornecedor.getNomeFantasia());
			fornecedorAtual.setRazaoSocial(fornecedor.getRazaoSocial());
			fornecedorAtual.setContato(contatoAtual);
			fornecedorAtual.setCnpj(fornecedor.getCnpj());

			// Alterando
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
		try {
			// Retornando lista
			return fornecedorDAO.listar();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Listar (id)
	@RequestMapping(value = "fornecedor/{id}", method = RequestMethod.GET)
	public Fornecedor listarFornecedor(@PathVariable("id") Long idFornecedor) {
		try {
			// Objeto que será retornado
			Fornecedor fornecedor = fornecedorDAO.listar(idFornecedor);

			// Inicializando endereços de fornecedor
			Hibernate.initialize(fornecedor.getEnderecos());

			// Retornando objeto
			return fornecedor;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Inserir Endereço em fornecedor
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirEndereco(@PathVariable("id") Long idFornecedor,
			@RequestBody EnderecoFornecedor endereco) {
		try {
			// Atribuindo valor
			Fornecedor fornecedor = fornecedorDAO.listar(idFornecedor);
			Hibernate.initialize(fornecedor.getEnderecos());

			// Lista
			List<EnderecoFornecedor> enderecos = fornecedor.getEnderecos();

			// Atribuindo endereco em lista de fornecedor
			enderecos.add(endereco);

			// Adicionando lista alterada
			fornecedor.setEnderecos(enderecos);

			// Alterando
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
		try {
			// Excluindo fornecedor
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
