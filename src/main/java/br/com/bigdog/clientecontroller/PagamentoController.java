package br.com.bigdog.clientecontroller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.bigdog.dao.CarrinhoDoClienteDAO;
import br.com.bigdog.dao.CompraDAO;
import br.com.bigdog.dao.EnderecoClienteDAO;
import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.model.Carrinho;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Compra;
import br.com.bigdog.model.EnderecoCliente;
import br.com.bigdog.model.EnderecoCompra;
import br.com.bigdog.model.ItemCompra;
import br.com.bigdog.model.Produto;
import br.com.bigdog.model.ProdutoCarrinho;
import br.com.bigdog.util.GeradorPDF;

@Controller
@RequestMapping("/pag")
public class PagamentoController {
	// Atributos
	private static String emailVendedorPagSeguro = "eduardocslv@gmail.com";
	private static String tokenVendedorPagSeguro = "F731EB2876254012AC244616A8CF9DB7";
	private GeradorPDF geradorPdf;
	private EnderecoClienteDAO enderecoDAO;
	private CarrinhoDoClienteDAO carrinhoDoClienteDAO;
	private CompraDAO compraDAO;
	private ProdutoDAO produtoDAO;

	// Construtor
	@Autowired
	public PagamentoController(GeradorPDF geradorPdf, EnderecoClienteDAO enderecoDAO,
			CarrinhoDoClienteDAO carrinhoDoClienteDAO, CompraDAO compraDAO, ProdutoDAO produtoDAO) {
		this.geradorPdf = geradorPdf;
		this.enderecoDAO = enderecoDAO;
		this.carrinhoDoClienteDAO = carrinhoDoClienteDAO;
		this.compraDAO = compraDAO;
		this.produtoDAO = produtoDAO;
	}

	// Gerar Boleto
	@RequestMapping(value = "/gerarBoleto/{idEndereco}", method = RequestMethod.GET)
	public String pagBoleto(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@PathVariable long idEndereco) throws IOException {
		// Atribuindo valores para compra
		EnderecoCliente endCliente = enderecoDAO.listar(idEndereco);
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		Carrinho carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());
		Compra compra = new Compra();
		compra = addCompra(compra, carrinho, cliente, endCliente);

		// Gerar boleto
		try {
			geradorPdf.gerarBoleto(compra, response);
			// Retornando...
			return "cliente/listPedidos";
		} catch (Exception e1) {
			e1.printStackTrace();
			// Retornando...
			return "cliente/indexCliente";
		}
	}

	// PagSeguro
	@RequestMapping("/pagseguro/{idEndereco}")
	public String pagPagseguro(HttpSession session, @PathVariable Long idEndereco) {
		// Atributo de retorno
		String retorno;

		// Verifica se há endereço
		if (idEndereco != null) {
			// Atributos
			EnderecoCliente endCliente = enderecoDAO.listar(idEndereco);
			Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
			Carrinho carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());
			Compra compra = new Compra();

			// Atribuindo valores para compra
			compra = addCompra(compra, carrinho, cliente, endCliente);

			// Enviando valores para o pagseguro
			try {
				String code = sendXml(cliente, carrinho, compra);
				retorno = "redirect:https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code=" + code;
			} catch (Exception e) {
				retorno = "redirect:home";
			}

			// Retornando...
			return retorno;
		} else {
			// Caso endereço seja null, redireciona para formulário de endereço
			retorno = "cliente/formEndereco";
		}

		// Retornando...
		return retorno;
	}

	// Adicionar compra
	public Compra addCompra(Compra compra, Carrinho carrinho, Cliente cliente, EnderecoCliente endCliente) {
		// Atributos
		double totalCarrinho = 0;
		List<ItemCompra> listItemCompra = new ArrayList<ItemCompra>();
		EnderecoCompra endCompra = new EnderecoCompra();

		// Atribuindo endereço para compra
		endCompra.setBairro(endCliente.getBairro());
		endCompra.setCep(endCliente.getCep());
		endCompra.setCidade(endCliente.getCidade());
		endCompra.setComplemento(endCliente.getComplemento());
		endCompra.setLogradouro(endCliente.getLogradouro());
		endCompra.setNumero(endCliente.getNumero());
		endCompra.setUf(endCliente.getUf());

		// Atribuindo produtos em compra
		for (ProdutoCarrinho produtoCarrinho : carrinho.getProdutosCarrinho()) {
			ItemCompra itemCompra = new ItemCompra();
			totalCarrinho += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
			itemCompra.setNome(produtoCarrinho.getProduto().getNome());
			itemCompra.setQuantidade(produtoCarrinho.getQuantidade());
			itemCompra.setValor(produtoCarrinho.getProduto().getValor());
			listItemCompra.add(itemCompra);
		}

		// Atribuindo valores para compra
		compra.setEndereco(endCompra);
		compra.setDataCompra(new Date());
		compra.setFrete(0.00);
		compra.setStatus("Aguardando pagamento");
		compra.setValor(totalCarrinho);
		compra.setItensCompra(listItemCompra);
		compra.setCliente(cliente);

		// Inserindo compra e limpando carrinho
		try {
			compraDAO.inserir(compra);
			alterarQtdProduto(carrinho.getProdutosCarrinho());
			carrinhoDoClienteDAO.limpaCarrinhoDoCliente(carrinho.getIdCarrinho());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Retornando...
		return compra;
	}

	// Alterar quantidade
	private void alterarQtdProduto(List<ProdutoCarrinho> listaProduto) {
		for (ProdutoCarrinho produtoCarrinho : listaProduto) {
			Produto produto = produtoCarrinho.getProduto();
			produto.setQtdEstoque(produto.getQtdEstoque() - produtoCarrinho.getQuantidade());
			produtoDAO.alterar(produto);
		}
	}

	// Enviar XML
	private String sendXml(Cliente c, Carrinho carrinho, Compra compra) {
		// Atributos
		String code = null;
		URL url;

		try {
			url = new URL("https://ws.sandbox.pagseguro.uol.com.br/v2/checkout/?email=" + emailVendedorPagSeguro
					+ "&token=" + tokenVendedorPagSeguro);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/xml");

			String requisicaoXml = gerarxml(c, carrinho, compra);

			OutputStream os = conn.getOutputStream();
			os.write(requisicaoXml.getBytes());
			os.flush();

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;

			while ((output = br.readLine()) != null) {
				output += output;
				code = output;
			}

			// Get codigo
			code = code.substring(76, 108);

			// Disconnect
			conn.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// Retornando...
		return code;
	}

	// Gerar XML
	private String gerarxml(Cliente c, Carrinho carrinho, Compra compra) {
		// Atributo para ip do host
		String host = null;

		try {
			host = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		// Retornando...
		return "<?xml version=\"1.0\"?><checkout><sender><name>" + c.getNome() + "</name>"
				+ "<email>c71089443377372574576@sandbox.pagseguro.com.br</email><ip>" + host
				+ "</ip><documents><document><type>CPF</type><value>" + c.getCpf().replace(".", "").replace("-", "")
				+ "</value>" + "</document></documents></sender><currency>BRL</currency>" + gerarItensXml(carrinho)
				+ "<redirectURL>localhost:8080/BigDog/home</redirectURL>" + "<reference>" + compra.getIdCompra()
				+ "</reference> <receiver> <email>" + emailVendedorPagSeguro + "</email></receiver></checkout>";
	}

	// Gerar itens XML
	private String gerarItensXml(Carrinho carrinho) {
		String produtosXml = "<items>";
		DecimalFormat mascara = new DecimalFormat("#0.00");

		for (ProdutoCarrinho produtoCarrinho : carrinho.getProdutosCarrinho()) {
			produtosXml += "<item><id>" + produtoCarrinho.getProduto().getIdProduto() + "</id><description>"
					+ produtoCarrinho.getProduto().getNome() + "</description><amount>"
					+ mascara.format(produtoCarrinho.getProduto().getValor()).replace(",", ".") + "</amount>"
					+ "<quantity>" + produtoCarrinho.getQuantidade() + "</quantity></item>";
		}

		produtosXml += "</items>";

		// Retornando...
		return produtosXml;
	}
}
