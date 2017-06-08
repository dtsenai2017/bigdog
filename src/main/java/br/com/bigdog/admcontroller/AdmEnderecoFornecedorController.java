package br.com.bigdog.admcontroller;

import javax.validation.ConstraintViolationException;

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
import br.com.bigdog.model.EnderecoFornecedor;

@RestController
@RequestMapping(value = "adm/")
public class AdmEnderecoFornecedorController {
	// Atributo
	private GenericDAO<EnderecoFornecedor> enderecoFornecedorDAO;

	// Construtor
	@Autowired
	public AdmEnderecoFornecedorController(GenericDAO<EnderecoFornecedor> enderecoFornecedorDAO) {
		this.enderecoFornecedorDAO = enderecoFornecedorDAO;
	}

	// Requisições
	// Lista (id)
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public EnderecoFornecedor listar(@PathVariable("id") Long idEnderecoFornecedor) {
		try {
			// Retornando
			return enderecoFornecedorDAO.listar(idEnderecoFornecedor);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Alterar
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long idEnderecoFornecedor,
			@RequestBody EnderecoFornecedor enderecoFornecedor) {
		try {
			// Atributos
			EnderecoFornecedor enderecoFornecedorAtual = enderecoFornecedorDAO.listar(idEnderecoFornecedor);

			// Atribuindo valores alterados
			enderecoFornecedorAtual.setCep(enderecoFornecedor.getCep());
			enderecoFornecedorAtual.setLogradouro(enderecoFornecedor.getLogradouro());
			enderecoFornecedorAtual.setNumero(enderecoFornecedor.getNumero());
			enderecoFornecedorAtual.setComplemento(enderecoFornecedor.getComplemento());
			enderecoFornecedorAtual.setBairro(enderecoFornecedor.getBairro());
			enderecoFornecedorAtual.setCidade(enderecoFornecedor.getCidade());
			enderecoFornecedorAtual.setUf(enderecoFornecedor.getUf());

			// Alterando
			enderecoFornecedorDAO.alterar(enderecoFornecedorAtual);

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

	// Excluir
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idEnderecoFornecedor) {
		try {
			// Excluindo
			enderecoFornecedorDAO.excluir(idEnderecoFornecedor);

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
