package br.com.bigdog.clientecontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.CategoriaDAO;
import br.com.bigdog.model.Categoria;

@RestController
public class ControllerCategoria {
	// Atributos
	private CategoriaDAO categoriaDAO;

	// Construtor
	@Autowired
	public ControllerCategoria(CategoriaDAO categoriaDAO) {
		this.categoriaDAO = categoriaDAO;
	}

	// Listar (id)
	@RequestMapping(value = "/categoria/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Categoria listar(@PathVariable("id") Long id) {
		try {
			// Retornando...
			return categoriaDAO.listar(id);
		} catch (NullPointerException e) {
			// Retornando...
			return null;
		}
	}
}
