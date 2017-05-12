package br.com.bigdog.admcontroller;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("adm/")
public class EnderecoFornecedorController {
	// Atributo
	private GenericDAO<EnderecoFornecedor> enderecoFornecedorDAO;

	// Construtor
	@Autowired
	public EnderecoFornecedorController(GenericDAO<EnderecoFornecedor> enderecoFornecedorDAO) {
		this.enderecoFornecedorDAO = enderecoFornecedorDAO;
	}

	// Requisições
	// Lista (id)
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public EnderecoFornecedor listar(@PathVariable("id") Long idEnderecoFornecedor) {
		return enderecoFornecedorDAO.listar(idEnderecoFornecedor);
	}

	// Alterar
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long idEnderecoFornecedor,
			@RequestBody EnderecoFornecedor enderecoFornecedor) {
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
	}

	// Excluir
	@RequestMapping(value = "enderecoFornecedor/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idEnderecoFornecedor) {
		// Excluindo
		enderecoFornecedorDAO.excluir(idEnderecoFornecedor);

		// Retornando
		return ResponseEntity.ok().build();
	}
}
