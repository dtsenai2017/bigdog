package br.com.bigdog.clientecontroller;

import java.util.List;

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

import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.dao.EnderecoClienteDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.EnderecoCliente;

@RestController
public class EnderecoClienteController {
	// Atributos
	private ClienteDAO clienteDAO;
	private EnderecoClienteDAO enderecoDAO;

	// Construtor
	@Autowired
	public EnderecoClienteController(ClienteDAO clienteDAO, EnderecoClienteDAO enderecoDAO) {
		this.clienteDAO = clienteDAO;
		this.enderecoDAO = enderecoDAO;
	}

	// Inserir
	@RequestMapping(value = "/enderecoCliente/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserir(@PathVariable("id") Long id, @RequestBody EnderecoCliente endereco) {
		try {
			// Resgatando cliente
			Cliente cliente = clienteDAO.listar(id);
			List<EnderecoCliente> enderecos = cliente.getEnderecos();

			// Adiciona endereco em lista
			enderecos.add(endereco);

			// Adicionando lista no cliente
			cliente.setEnderecos(enderecos);

			// Inserindo dados
			clienteDAO.alterar(cliente);

			// Retornando...
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Listar (id)
	@RequestMapping(value = "/enderecoCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public EnderecoCliente listar(@PathVariable("id") Long id) {
		// Retornando...
		return enderecoDAO.listar(id);
	}

	// Alterar
	@RequestMapping(value = "/enderecoCliente/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long id, @RequestBody EnderecoCliente endereco) {
		// Endereço atual
		EnderecoCliente enderecoAtual = enderecoDAO.listar(id);

		// Setando valores alterados
		enderecoAtual.setCep(endereco.getCep());
		enderecoAtual.setLogradouro(endereco.getLogradouro());
		enderecoAtual.setNumero(endereco.getNumero());
		enderecoAtual.setComplemento(endereco.getComplemento());
		enderecoAtual.setBairro(endereco.getBairro());
		enderecoAtual.setCidade(endereco.getCidade());
		enderecoAtual.setUf(endereco.getUf());

		// Alterando...
		enderecoDAO.alterar(enderecoAtual);

		// Retornando...
		return ResponseEntity.ok().build();
	}

	// Excluir
	@RequestMapping(value = "/enderecoCliente/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long id) {
		// Excluindo...
		enderecoDAO.excluir(id);

		// Retornando...
		return ResponseEntity.ok().build();
	}
}
