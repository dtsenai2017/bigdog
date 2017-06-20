package br.com.bigdog.admcontroller;

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

import br.com.bigdog.dao.CompraDAO;
import br.com.bigdog.model.Compra;

@RestController
@RequestMapping(value = "adm/")
public class AdmCompraController {
	// Atributos
	private CompraDAO compraDAO;

	// Construtor
	@Autowired
	public AdmCompraController(CompraDAO compraDAO) {
		this.compraDAO = compraDAO;
	}

	// Requisições
	// Listar
	@RequestMapping(value = "compra", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Compra> listar() {
		try {
			// Retornando
			return compraDAO.listar();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar ordenado por datatime
	@RequestMapping(value = "compraOrdenada", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Compra> listarCompraOrdenada() {
		try {
			// Retornando
			return compraDAO.listarOrdenado();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar (id)
	@RequestMapping(value = "compra/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Compra listar(@PathVariable("id") Long idCompra) {
		try {
			// Retornando
			return compraDAO.listar(idCompra);
		} catch (Exception e) {
			return null;
		}
	}

	// Listar (idCliente)
	@RequestMapping(value = "compraCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Compra> listarCompra(@PathVariable("id") Long idCliente) {
		try {
			// Retornando
			return compraDAO.listarCompraCliente(idCliente);
		} catch (Exception e) {
			return null;
		}
	}

	// Alterar status de compra
	@RequestMapping(value = "alterarStatus/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterarStatus(@PathVariable("id") Long idCompra, @RequestBody Compra compra) {
		try {
			// Compra atual
			Compra compraAtual = compraDAO.listar(idCompra);

			// Alterando status
			compraAtual.setStatus(compra.getStatus());

			// Alterando...
			compraDAO.alterar(compraAtual);

			// Retornando
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
