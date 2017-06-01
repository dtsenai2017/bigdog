package br.com.bigdog.clientecontroller;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

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

	// Responsável pela listagem dinamica na pagina de produtos
	@RequestMapping(value = "/rest/dinamic/produtos/{ultimoIndex}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listarProdutosSobDemanda(@PathVariable("ultimoIndex") long ultimoIndex) {

		return produtoDAO.listarComLimite(0, 8);
	}

	// Responsável pelo insert dinamico
	@RequestMapping(value = "/rest/dinamic/alterarQtd", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Double> alterarQtdDinamicamente(@RequestBody ProdutoCarrinho carrinho) {
		Long qtd = carrinho.getQuantidade();
		carrinho = produtoCarrinhoDAO.listar(carrinho.getIdProdutoCarrinho());

		carrinho.setQuantidade(qtd);

		produtoCarrinhoDAO.alterar(carrinho);

		Double totalCarrinho = (double) 0;

		// for (ProdutoCarrinho produtoCarrinho : carrinhoDoClienteDAO
		// .listarCarrinhoDoCliente(carrinho.getCliente().getIdCliente())) {
		// totalCarrinho += produtoCarrinho.getProduto().getValor() *
		// produtoCarrinho.getQuantidade();
		// }

		NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

		String formatado = (nf.format(totalCarrinho)).replace("R", "").replace("$", "").replace(" ", "");
		totalCarrinho = Double.parseDouble(formatado.replace(",", "."));

		System.out.println(totalCarrinho);
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
