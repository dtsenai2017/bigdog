package br.com.bigdog.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.dao.ProdutoCarrinhoDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.ProdutoCarrinho;

@SuppressWarnings("unused")
@RestController
public class LojaController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;
	private ProdutoCarrinhoDAO produtoCarrinhoDAO;

	// Construtor
	@Autowired
	public LojaController(GenericDAO<Cliente> clienteDAO, ProdutoCarrinhoDAO produtoCarrinhoDAO) {
		this.clienteDAO = clienteDAO;
		this.produtoCarrinhoDAO = produtoCarrinhoDAO;
	}

	// Adicionar produto no carrinho
	@RequestMapping(value = "/carrinho/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void inserirProdutoCarrinho(@PathVariable("id") Long idCliente,
			@RequestBody ProdutoCarrinho produtoCarrinho) {
		// Buscando cliente...
		Cliente cliente = clienteDAO.listar(idCliente);

		// Lista de produtos
		List<ProdutoCarrinho> produtosCarrinho = cliente.getProdutosCarrinho();

		// Adicionando produto
		produtosCarrinho.add(produtoCarrinho);

		// Adicionando produto no carrinho
		cliente.setProdutosCarrinho(produtosCarrinho);

		// Alterando...
		clienteDAO.alterar(cliente);
	}

	// Listar produtos no carrinho (id_cliente)
	@RequestMapping(value = "/carrinho/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<ProdutoCarrinho> listarCarrinho(@PathVariable("id") Long idCliente) {
		// ...
		return null;
	}

	// Deletar produto no carrinho

	// Visualizar Produto

	// ...
}
