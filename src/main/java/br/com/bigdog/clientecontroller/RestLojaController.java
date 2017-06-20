package br.com.bigdog.clientecontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.CarrinhoDoClienteDAO;
import br.com.bigdog.dao.CategoriaDAO;
import br.com.bigdog.dao.EnderecoClienteDAO;
import br.com.bigdog.dao.ProdutoCarrinhoDAO;
import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.model.Carrinho;
import br.com.bigdog.model.Categoria;
import br.com.bigdog.model.EnderecoCliente;
import br.com.bigdog.model.Produto;
import br.com.bigdog.model.ProdutoCarrinho;

@RestController
public class RestLojaController {
	// Atributos
	private ProdutoDAO produtoDAO;
	private ProdutoCarrinhoDAO produtoCarrinhoDAO;
	private CarrinhoDoClienteDAO carrinhoDoClienteDAO;
	private EnderecoClienteDAO enderecoDAO;
	private CategoriaDAO categoriaDAO;

	// Construtor
	@Autowired
	public RestLojaController(ProdutoDAO produtoDAO, ProdutoCarrinhoDAO produtoCarrinhoDAO,
			CarrinhoDoClienteDAO carrinhoDoClienteDAO, EnderecoClienteDAO enderecoDAO, CategoriaDAO categoriaDAO) {
		this.produtoDAO = produtoDAO;
		this.produtoCarrinhoDAO = produtoCarrinhoDAO;
		this.carrinhoDoClienteDAO = carrinhoDoClienteDAO;
		this.enderecoDAO = enderecoDAO;
		this.categoriaDAO = categoriaDAO;
	}

	// Ultilizado para verificar produto que está no carrinho
	@RequestMapping(value = "rest/produtoQtdEstoque", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Produto listarProdutoDoCarrinho(@PathVariable("id") Long idProdutoCarrinho) {
		return null;
	}

	// Responsável pela listagem dinamica na pagina de produtos
	@RequestMapping(value = "/rest/dinamic/produtos/{ultimoIndex}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listarProdutosSobDemanda(@PathVariable("ultimoIndex") long ultimoIndex) {
		// Retornando...
		return produtoDAO.listarComLimite(0, 8);
	}

	// Responsável pelo insert dinâmico
	@RequestMapping(value = "/rest/dinamic/alterarQtd/{idCliente}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Double> alterarQtdDinamicamente(@RequestBody ProdutoCarrinho produtoCarrinho,
			@PathVariable long idCliente) {
		// Atributos
		double totalCarrinho = 0;
		Long qtd = produtoCarrinho.getQuantidade();
		produtoCarrinho = produtoCarrinhoDAO.listar(produtoCarrinho.getIdProdutoCarrinho());
		Carrinho carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(idCliente);

		// Atribuindo valores
		produtoCarrinho.setQuantidade(qtd);
		produtoCarrinhoDAO.alterar(produtoCarrinho);

		for (ProdutoCarrinho produtoCarrinho2 : carrinho.getProdutosCarrinho()) {
			totalCarrinho += produtoCarrinho2.getProduto().getValor() * produtoCarrinho2.getQuantidade();
		}

		// Retornando...
		return ResponseEntity.ok(totalCarrinho);
	}

	// Excluir item do carrinho
	@RequestMapping(value = "rest/dinamic/excluirItem/{id}/{idCliente}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Double> excluirItemCarrinho(@PathVariable long id, @PathVariable long idCliente) {
		// Atributos
		double totalCarrinho = 0;
		produtoCarrinhoDAO.excluir(id);
		Carrinho carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(idCliente);

		for (ProdutoCarrinho produtoCarrinho2 : carrinho.getProdutosCarrinho()) {
			System.out.println(produtoCarrinho2.getProduto().getNome());
			totalCarrinho += produtoCarrinho2.getProduto().getValor() * produtoCarrinho2.getQuantidade();
		}

		// Retornando...
		return ResponseEntity.ok(totalCarrinho);
	}

	// Responsável pela listagem de um endereço na página de compra
	@RequestMapping(value = "rest/dinamic/endereco/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public EnderecoCliente listarEndereco(@PathVariable Long id) {
		return enderecoDAO.listar(id);
	}

	// Listar (id)
	@RequestMapping(value = "rest/categoria/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Categoria listar(@PathVariable("id") Long id) {
		try {
			return categoriaDAO.listar(id);
		} catch (NullPointerException e) {
			return null;
		}
	}
}
