package br.com.bigdog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Produto;

@Controller
public class LojaAdmController {
	// Atributos
	private GenericDAO<Produto> produtoDAO;

	// Construtor
	@Autowired
	public LojaAdmController(GenericDAO<Produto> produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	// Inserir ou alterar produto
	@RequestMapping(value = "/inserirProduto")
	public void inserir(Produto produto) {
		// Verifica se produto ja � existente
		if (produto.getIdProduto() == null) {
			// Insere novo produto
			produtoDAO.inserir(produto);
		} else {
			// Altera produto existente
			produtoDAO.alterar(produto);
		}
	}

	// Listar
	@RequestMapping(value = "/listarProdutos")
	public List<Produto> listar() {
		return produtoDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "/listarProduto/")
	public Produto listar(Long id) {
		return produtoDAO.listar(id);
	}

	// Excluir
	@RequestMapping(value = "/excluirProduto")
	public void excluir(Long id) {
		produtoDAO.excluir(id);
	}
}
