package br.com.bigdog.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Categoria;

@Controller
public class CategoriaController {
	// Atributos
	private GenericDAO<Categoria> categoriaDAO;

	// Construtor
	public CategoriaController(GenericDAO<Categoria> categoriaDAO) {
		this.categoriaDAO = categoriaDAO;
	}

	// Inserir ou alterar
	@RequestMapping(value = "/inserirCategoria")
	public void inserir(Categoria categoria) {
		// Verifica se categoria é existente
		if (categoria.getIdCategoria() == null) {
			// Insere
		} else {
			// Altera
		}
	}

	// Listar
	@RequestMapping(value = "/listarCategorias")
	public List<Categoria> listar() {
		return categoriaDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "/listarCategoria")
	public Categoria listar(Long id) {
		return categoriaDAO.listar(id);
	}

	// Excluir
	@RequestMapping(value = "/excluirCategoria")
	public void excluir(Long id) {
		categoriaDAO.excluir(id);
	}
}
