package br.com.bigdog.admcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Produto;

@RestController
@RequestMapping("adm/")
public class ProdutoController {
	// Atributos
	private GenericDAO<Produto> produtoDAO;

	// Construtor
	@Autowired
	public ProdutoController(GenericDAO<Produto> produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	// Inserir ou alterar produto
	@RequestMapping(value = "produto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void inserir(@RequestBody Produto produto) {
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
	@RequestMapping(value = "produto", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listar() {
		return produtoDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "produto/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Produto listar(@PathVariable("id") Long idProduto) {
		return produtoDAO.listar(idProduto);
	}

	// Excluir
	@RequestMapping(value = "produto/{id}", method = RequestMethod.DELETE)
	public void excluir(@PathVariable("id") Long idProduto) {
		produtoDAO.excluir(idProduto);
	}
}
