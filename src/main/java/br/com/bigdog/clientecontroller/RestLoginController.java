package br.com.bigdog.clientecontroller;

import java.net.URI;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.util.Gerador;

@RestController
public class RestLoginController {
	// Atributos
	private ClienteDAO clienteDAO;

	@Autowired
	public RestLoginController(ClienteDAO clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	@RequestMapping(value = "rest/loginRedes", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Cliente> loginGoogle(@RequestBody Cliente cliente) {
		try {
			System.out.println(cliente.toString());
			clienteDAO.inserir(cliente);
			return ResponseEntity.created(URI.create("/cliente/")).body(cliente);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "rest/loginRedes/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> cadastrar(@PathVariable Long id, @RequestBody Cliente cliente) {
		try {
			HttpHeaders header = new HttpHeaders();
			cliente.setIdCliente(id);
			clienteDAO.alterar(cliente);
			header.setLocation(URI.create("/cliente/" + id));
			ResponseEntity<Void> response = new ResponseEntity<Void>(header, HttpStatus.OK);
			return response;
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "rest/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Cliente> cadastra(@RequestBody Cliente cliente) {
		try {
			Gerador g = new Gerador();
			String idR = String.valueOf(g.gerarIdLogin());
			if (clienteDAO.busca(idR) == null) {
				cliente.setId_redes(idR);
				clienteDAO.inserir(cliente);
			} else {
				idR = String.valueOf(g.gerarIdLogin());
				cliente.setId_redes(idR);
				clienteDAO.inserir(cliente);
			}
			return ResponseEntity.created(URI.create("/cliente/")).body(cliente);
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "rest/loginRedes/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente posCadastro(@PathVariable String id) {
		return clienteDAO.busca(id);
	}

	@RequestMapping(value = "rest/logar/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente posLogin(@PathVariable Long id) {
		return clienteDAO.listar(id);
	}

	// Método de logar Cliente
	@RequestMapping(value = "rest/logar", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Cliente> logar(@RequestBody Cliente cliente) {
		try {
			cliente = clienteDAO.logar(cliente);
			if (cliente != null) {
				System.out.println("Existe" + cliente);
				return ResponseEntity.ok(cliente);
			} else {
				System.out.println("Errouuuuu");
				return new ResponseEntity<Cliente>(HttpStatus.UNAUTHORIZED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Cliente>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
