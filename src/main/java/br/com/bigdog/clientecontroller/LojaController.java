package br.com.bigdog.clientecontroller;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.CarrinhoDoClienteDAO;
import br.com.bigdog.dao.ProdutoCarrinhoDAO;
import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Produto;
import br.com.bigdog.model.ProdutoCarrinho;

@Controller
public class LojaController {
	// Atributos
	private ProdutoCarrinhoDAO carrinhoDAO;
	private ProdutoDAO produtoDAO;
	private CarrinhoDoClienteDAO carrinhoDoClienteDAO;

	// Construtor
	@Autowired
	public LojaController(ProdutoCarrinhoDAO carrinhoDAO, ProdutoDAO produtoDAO,
			CarrinhoDoClienteDAO carrinhoDoClienteDAO) {
		this.carrinhoDAO = carrinhoDAO;
		this.produtoDAO = produtoDAO;
		this.carrinhoDoClienteDAO = carrinhoDoClienteDAO;
	}

	@RequestMapping("addProduto")
	public String addProduto(Long id, HttpSession session) {
		// Atributos
		String retorno;
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica cliente logado
		if (cliente != null) {
			// Produto no carrinho
			ProdutoCarrinho carrinho = new ProdutoCarrinho();

			// Produto que será adicionado e atributo que verifica existência de
			// produto no carrinho
			Produto produto = produtoDAO.listar(id);
			boolean existe = false;

			// Lista de produtos no carrinho do cliente
			List<ProdutoCarrinho> carrinhoDoCliente = carrinhoDoClienteDAO
					.listarCarrinhoDoCliente(cliente.getIdCliente());

			// Verifica lista de produtos no carrinho se é existente com o
			// adicionado
			for (ProdutoCarrinho produtoCarrinho : carrinhoDoCliente) {
				if (produtoCarrinho.getProduto().getIdProduto() == produto.getIdProduto()) {
					existe = true;
				}
			}

			// Caso produto não existir em carrinho de cliente...
			if (!existe) {
				// carrinho.setCliente(cliente);
				carrinho.setProduto(produto);
				carrinho.setQuantidade((long) 1);
				System.out.println("CARRINHO: " + carrinho.toString());

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
		double totalCarrinho = 0;
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica se cliente é logado
		if (cliente != null) {
			// Lista de produtos no carrinho
			List<ProdutoCarrinho> carrinhoDoCliente = carrinhoDoClienteDAO
					.listarCarrinhoDoCliente(cliente.getIdCliente());

			// Atribuindo valor total de produtos
			for (ProdutoCarrinho produtoCarrinho : carrinhoDoCliente) {
				totalCarrinho += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
			}

			NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

			String formatado = (nf.format(totalCarrinho)).replace("R", "").replace("$", "").replace(" ", "");
			totalCarrinho = Double.parseDouble(formatado.replace(",", "."));

			session.setAttribute("carrinhos", carrinhoDoCliente);
			session.setAttribute("totalCarrinho", totalCarrinho);

			retorno = "cliente/confirmaCompra";
		} else {
			retorno = "redirect:entrar";
		}

		return retorno;
	}

	@RequestMapping("comprarJa")
	public String comprarJa(Long id, HttpSession session) {

		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		if (cliente != null) {
			cliente.setCpf(cliente.getCpf().replace(".", "").replace("-", ""));
			System.out.println(cliente.getCpf());
			cliente.getContato()
					.setCelular(cliente.getContato().getCelular().replace(" ", "").replace("-", "").substring(4, 13));
			System.out.println(cliente.getContato().getCelular());
			List<ProdutoCarrinho> carrinhoDoCliente = carrinhoDoClienteDAO
					.listarCarrinhoDoCliente(cliente.getIdCliente());
			double totalCarrinho = 0;
			ProdutoCarrinho carrinho = new ProdutoCarrinho();
			Produto produto = produtoDAO.listar(id);
			boolean existe = false;

			for (ProdutoCarrinho produtoCarrinho : carrinhoDoCliente) {
				totalCarrinho += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
				if (produtoCarrinho.getProduto().getIdProduto() == produto.getIdProduto()) {
					existe = true;
				}
			}

			if (!existe) {
				// carrinho.setCliente(cliente);
				carrinho.setProduto(produto);
				carrinho.setQuantidade((long) 1);

				carrinhoDAO.inserir(carrinho);
				carrinhoDoCliente.add(carrinho);
			}

			session.setAttribute("carrinhos", carrinhoDoCliente);
			session.setAttribute("totalCarrinho", totalCarrinho);

			return "cliente/pagamento";
		} else {
			return "redirect:entrar";

		}
	}

	@RequestMapping("pagamento")
	public String comprar(HttpSession session) {

		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		if (cliente != null) {
			double totalCarrinho = 0;
			List<ProdutoCarrinho> carrinhoDoCliente = carrinhoDoClienteDAO
					.listarCarrinhoDoCliente(cliente.getIdCliente());

			for (ProdutoCarrinho produtoCarrinho : carrinhoDoCliente) {
				totalCarrinho += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
			}

			NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

			String formatado = (nf.format(totalCarrinho)).replace("R", "").replace("$", "").replace(" ", "");
			totalCarrinho = Double.parseDouble(formatado.replace(",", "."));

			session.setAttribute("carrinhos", carrinhoDoCliente);
			session.setAttribute("totalCarrinho", totalCarrinho);

			return "cliente/pagamento";
		} else {
			return "redirect:entrar";
		}
	}

	@RequestMapping("listPedidos")
	public String pedidos(HttpSession session) {
		return "cliente/listPedidos";
	}

	@RequestMapping("listAgendamentos")
	public String agendamentos(HttpSession session) {
		return "cliente/listAgendamentos";
	}

	@RequestMapping("novo-agendamento")
	public String agendamento(HttpSession session) {
		return "cliente/formAgendamento";
	}

}
