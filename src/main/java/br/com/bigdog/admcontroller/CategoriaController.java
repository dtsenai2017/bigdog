package br.com.bigdog.admcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.hibernate.Hibernate;
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
import br.com.bigdog.model.Categoria;
import br.com.bigdog.model.SubCategoria;

@RestController
@RequestMapping("adm/")
public class CategoriaController {
	// Atributos
	private GenericDAO<Categoria> categoriaDAO;
	private GenericDAO<SubCategoria> subCategoriaDAO;

	// Construtor
	public CategoriaController(GenericDAO<Categoria> categoriaDAO, GenericDAO<SubCategoria> subCategoriaDAO) {
		this.categoriaDAO = categoriaDAO;
		this.subCategoriaDAO = subCategoriaDAO;
	}

	// Requisições
	// Inserir categoria
	@RequestMapping(value = "categoria", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirCategoria(@RequestBody Categoria categoria) {
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
	}

	// Inserir subcategoria
	@RequestMapping(value = "subcategoria/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserirSubCategoria(@PathVariable("id") Long idCategoria,
			@RequestBody SubCategoria subCategoria) {
		// Categoria
		Categoria categoria = categoriaDAO.listar(idCategoria);
		Hibernate.initialize(categoria.getSubCategorias());

		// Lista
		List<SubCategoria> subCategorias = new ArrayList<SubCategoria>();

		// Valor da lista da categoria
		subCategorias = categoria.getSubCategorias();

		// Adicionando lista de requisição
		subCategorias.add(subCategoria);

		// Adicionando valor em lista de categoria
		categoria.setSubCategorias(subCategorias);

		// Inserindo
		try {
			categoriaDAO.alterar(categoria);
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

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

	// Excluir categoria (Se categoria estiver vinculada em algum produto, não é
	// possível uma exclusão)
	@RequestMapping(value = "categoria/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idCategoria) {
		// Excluindo
		try {
			categoriaDAO.excluir(idCategoria);
			return ResponseEntity.ok().build();
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Excluir subcategoria
	@RequestMapping(value = "subcategoria/{idSubCategoria}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluirSubcategoria(@PathVariable("idSubCategoria") Long idSubCategoria) {
		// Excluindo
		try {
			subCategoriaDAO.excluir(idSubCategoria);
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
