package br.com.bigdog.clientecontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.CarrinhoDAO;
import br.com.bigdog.dao.CarrinhoDoClienteDAO;
import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.model.Carrinho;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Produto;
import br.com.bigdog.model.ProdutoCarrinho;

@Controller
public class LojaController {
	// Atributos
	private CarrinhoDAO carrinhoDAO;
	private ProdutoDAO produtoDAO;
	private CarrinhoDoClienteDAO carrinhoDoClienteDAO;

	// Construtor
	@Autowired
	public LojaController(CarrinhoDAO carrinhoDAO, ProdutoDAO produtoDAO, CarrinhoDoClienteDAO carrinhoDoClienteDAO) {
		this.carrinhoDAO = carrinhoDAO;
		this.produtoDAO = produtoDAO;
		this.carrinhoDoClienteDAO = carrinhoDoClienteDAO;
	}

	// Adicionar produto no carrinho
	@RequestMapping("addProduto")
	public String addProduto(Long id, HttpSession session) {
		// Atributos
		String retorno;
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica se cliente é diferente de null
		if (cliente != null) {
			// Listando produto selecionado e carrinho do cliente
			Produto produto = produtoDAO.listar(id);
			Carrinho carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());

			// Lista de produtos existentes no carrinho do cliente
			List<ProdutoCarrinho> produtosCarrinho = new ArrayList<ProdutoCarrinho>();
			ProdutoCarrinho produtoCarrinho = new ProdutoCarrinho();

			// Atribuindo valor para produto do carrinho
			produtoCarrinho.setQuantidade((long) 1);
			produtoCarrinho.setProduto(produto);
			produtosCarrinho.add(produtoCarrinho);

			// Verifica carrinho
			if (carrinho != null) {
				List<ProdutoCarrinho> listaAux = carrinho.getProdutosCarrinho();

				if (listaAux.isEmpty()) {
					carrinho.setProdutosCarrinho(produtosCarrinho);
				} else {
					boolean existe = false;
					for (ProdutoCarrinho produtoCarrinho2 : listaAux) {
						if (produtoCarrinho2.getProduto().getIdProduto() == produto.getIdProduto()) {
							existe = true;
						}
					}

					if (!existe) {
						listaAux.add(produtoCarrinho);
						carrinho.setProdutosCarrinho(listaAux);
					}
				}
				carrinhoDAO.alterar(carrinho);
			} else {
				carrinho = new Carrinho();
				carrinho.setCliente(cliente);
				carrinho.setProdutosCarrinho(produtosCarrinho);
				carrinhoDAO.inserir(carrinho);
			}

			// Atribuindo valor para view
			retorno = "redirect:confirmarCompra";
		} else {
			// Atribuindo valor para view
			retorno = "redirect:entrar";
		}
		// Ir para...
		return retorno;
	}

	// Confirmação de compra
	@RequestMapping("confirmarCompra")
	public String confirmarCompra(HttpSession session) {
		// Atributos
		String retorno;
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica cliente
		if (cliente != null) {
			Carrinho carrinhoCliente = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());

			// Verifica carrinho do cliente
			if (carrinhoCliente != null) {
				session.setAttribute("carrinhos", carrinhoCliente.getProdutosCarrinho());
				session.setAttribute("totalCarrinho", calcularTotalCarrinho(carrinhoCliente.getProdutosCarrinho()));
			}

			retorno = "cliente/confirmaCompra";
		} else {
			retorno = "redirect:entrar";
		}

		// Ir para view...
		return retorno;
	}

	@RequestMapping("pagamento")
	public String comprar(HttpSession session) {
		// Atributos
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		String retorno;

		// Verifica cliente
		if (cliente != null) {
			// Atributos
			Carrinho carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());

			// Verifica se carrinho é vazio
			if (carrinho != null) {
				// Verifica se há itens no carrinho
				if (carrinho.getProdutosCarrinho().isEmpty()) {
					// Atribuindo retorno
					retorno = "redirect:categoria";
				} else {
					// Atributo
					double totalCarrinho = 0;

					// Atribuindo valor total do carrinho
					for (ProdutoCarrinho produtoCarrinho : carrinho.getProdutosCarrinho()) {
						totalCarrinho += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
					}

					// Atribuindo valor para sessão
					session.setAttribute("carrinhos", carrinho.getProdutosCarrinho());
					session.setAttribute("totalCarrinho", totalCarrinho);

					// Atribuindo retorno
					retorno = "cliente/pagamento";
				}
			} else {
				// Atribuindo retorno
				retorno = "redirect:categoria";
			}
		} else {
			// Atribuindo retorno
			retorno = "redirect:entrar";
		}
		// Retornando...
		return retorno;
	}

	// Calcular total do carrinho
	private double calcularTotalCarrinho(List<ProdutoCarrinho> produtosCarrinho) {
		// Atributo
		double valor = 0;

		// Atribuindo valor total
		for (ProdutoCarrinho produtoCarrinho : produtosCarrinho) {
			valor += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
		}

		// Retornando...
		return valor;
	}
}
