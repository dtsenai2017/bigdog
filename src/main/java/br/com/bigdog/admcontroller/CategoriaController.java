package br.com.bigdog.admcontroller;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.hibernate.Hibernate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Categoria;

@RestController
public class CategoriaController {
	// Atributos
	private GenericDAO<Categoria> categoriaDAO;

	// Construtor
	public CategoriaController(GenericDAO<Categoria> categoriaDAO) {
		this.categoriaDAO = categoriaDAO;
	}

	// Requisições
	// Listar Categorias para formulário
	@RequestMapping(value = "categoria", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Categoria> listarCategorias() {
		// Retornando
		return categoriaDAO.listar();
	}

	// Listar subcategorias de categoria selecionada para formulário
	@RequestMapping(value = "categoria/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Categoria listarCategoria(@PathVariable("id") Long idCategoria) {
		// Listando categoria
		Categoria categoria = categoriaDAO.listar(idCategoria);

		// Buscando subcategorias pelo hibernate
		Hibernate.initialize(categoria.getSubCategorias());

		// Retornando
		return categoria;
	}

	// Inserir ou alterar categoria
	@RequestMapping(value = "categoria", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirCategoria(@RequestBody Categoria categoria) {
		// Verifica se é inserção ou alteração da categoria
		if (categoria.getIdCategoria() == null) {
			// Inserir nova categoria
			try {
				categoriaDAO.inserir(categoria);
				return ResponseEntity.ok().build();
			} catch (ConstraintViolationException e) {
				e.printStackTrace();
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			} catch (Exception e) {
				e.printStackTrace();
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			// Alterar uma categoria
			// ...
			return ResponseEntity.ok().build();
		}
	}
}
