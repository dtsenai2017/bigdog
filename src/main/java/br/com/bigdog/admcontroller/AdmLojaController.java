package br.com.bigdog.admcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Produto;

public class AdmLojaController {
	// Atributos
	private GenericDAO<Produto> produtoDAO;

	// Construtor
	@Autowired
	public AdmLojaController(GenericDAO<Produto> produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	// Inserir ou alterar produto
	@RequestMapping(value = "/inserirProduto")
	public void inserir(Produto produto) {

		System.out.println(produto.toString());

		// Verifica se produto ja é existente
		// if (produto.getIdProduto() == null) {
		// // Insere novo produto
		// produtoDAO.inserir(produto);
		// } else {
		// // Altera produto existente
		// produtoDAO.alterar(produto);
		// }
	}

	// Listar
	@RequestMapping(value = "admlistarProdutos")
	public List<Produto> listar() {
		return produtoDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "admlistarProduto/")
	public Produto listar(Long id) {
		return produtoDAO.listar(id);
	}

	// Excluir
	@RequestMapping(value = "excluirProduto")
	public void excluir(Long id) {
		produtoDAO.excluir(id);
	}
}
