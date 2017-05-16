package br.com.bigdog.admcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	// Realizar compra
	@RequestMapping(value = "compra", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> dataTestCompra(@RequestBody Compra compra) {
		// Inserindo
		compraDAO.inserir(compra);

		// Retornando
		return ResponseEntity.ok().build();
	}

	// Listar (id)
	@RequestMapping(value = "compra/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Compra listar(@PathVariable("id") Long idCompra) {
		return compraDAO.listar(idCompra);
	}

	// Listar (idCliente)
	@RequestMapping(value = "compraCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Compra> listarCompra(@PathVariable("id") Long idCliente) {
		return compraDAO.listarCompraCliente(idCliente);
	}

	// Alterar status de compra
	@RequestMapping(value = "alterarStatus/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterarStatus(@PathVariable("id") Long idCompra, @RequestBody Compra compra) {
		// Compra atual
		Compra compraAtual = compraDAO.listar(idCompra);

		// Alterando status
		compraAtual.setStatus(compra.getStatus());

		// Alterando...
		compraDAO.alterar(compraAtual);

		// Retornando
		return ResponseEntity.ok().build();
	}
}
