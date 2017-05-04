package br.com.bigdog.admcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Produto;

@RestController
public class ProdutoController {
	// Atributos
	private GenericDAO<Produto> produtoDAO;

	// Construtor
	@Autowired
	public ProdutoController(GenericDAO<Produto> produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	// Inserir ou alterar produto
	@RequestMapping(value = "adm/produto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void inserir(@RequestBody Produto produto) {
		System.out.println(produto.toString());

		// Verifica se produto ja é existente
		if (produto.getIdProduto() == null) {
			// Insere novo produto
			produtoDAO.inserir(produto);
		} else {
			// Altera produto existente
			produtoDAO.alterar(produto);
		}
	}

	// Listar
	@RequestMapping(value = "adm/produto", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
