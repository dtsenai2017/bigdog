package br.com.bigdog.clientecontroller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
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
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Compra;
import br.com.bigdog.model.EnderecoCliente;
import br.com.bigdog.model.EnderecoCompra;
import br.com.bigdog.model.ItemCompra;
import br.com.bigdog.model.ProdutoCarrinho;
import br.com.bigdog.util.ConverterPdf;
import br.com.bigdog.util.GeradorPDF;

@RequestMapping("/pag")
@Controller
public class PagamentoController {
	// Atributos
	private static String emailVendedorPagSeguro = "eduardocslv@gmail.com";
	private static String tokenVendedorPagSeguro = "F731EB2876254012AC244616A8CF9DB7";
	private GeradorPDF geradorPdf;
	private ConverterPdf converterPdf;
	private EnderecoClienteDAO enderecoDAO;
	private CarrinhoDoClienteDAO carrinhoDoClienteDAO;
	private CompraDAO compraDAO;

	@Autowired
	public PagamentoController(GeradorPDF geradorPdf, ConverterPdf converterPdf, EnderecoClienteDAO enderecoDAO,
			CarrinhoDoClienteDAO carrinhoDoClienteDAO, CompraDAO compraDAO) {
		// TODO Auto-generated constructor stub
		this.geradorPdf = geradorPdf;
		this.converterPdf = converterPdf;
		this.enderecoDAO = enderecoDAO;
		this.carrinhoDoClienteDAO = carrinhoDoClienteDAO;
		this.compraDAO = compraDAO;
	}

	@RequestMapping(value = "/gerarBoleto/{idEndereco}", method = RequestMethod.GET)
	public void pagBoleto(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@PathVariable long idEndereco) throws IOException {

		EnderecoCliente endCliente = enderecoDAO.listar(idEndereco);
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		List<ProdutoCarrinho> carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());

		ServletContext servletContext = request.getSession().getServletContext();
		File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		String temperotyFilePath = tempDirectory.getAbsolutePath();
		String fileName = "JavaHonk.pdf";
		response.setContentType("application/pdf");
		response.setHeader("Content-disposition", "attachment; filename=" + fileName);

		Compra compra = new Compra();
		compra = addCompra(compra, carrinho, cliente, endCliente);

		try {
			geradorPdf.gerarPdf(temperotyFilePath + "\\" + fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			baos = converterPdf.convertPDFToByteArrayOutputStream(temperotyFilePath + "\\" + fileName);
			OutputStream os = response.getOutputStream();
			baos.writeTo(os);
			os.flush();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	@RequestMapping("/pagseguro/{idEndereco}")
	public String pagPagseguro(HttpSession session, @PathVariable long idEndereco) {

		String retorno;
		EnderecoCliente endCliente = enderecoDAO.listar(idEndereco);
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		List<ProdutoCarrinho> carrinho = carrinhoDoClienteDAO.listarCarrinhoDoCliente(cliente.getIdCliente());
		Compra compra = new Compra();
		compra = addCompra(compra, carrinho, cliente, endCliente);

		try {
			String code = sendXml(cliente, carrinho, compra);
			retorno = "redirect:https://sandbox.pagseguro.uol.com.br/v2/checkout/payment.html?code=" + code;
		} catch (Exception e) {
			// TODO: handle exception
			retorno = "redirect:home";
		}
		return retorno;
	}

	public Compra addCompra(Compra compra, List<ProdutoCarrinho> carrinho, Cliente cliente,
			EnderecoCliente endCliente) {

		double totalCarrinho = 0;
		List<ItemCompra> listItemCompra = new ArrayList<ItemCompra>();
		EnderecoCompra endCompra = new EnderecoCompra();
		endCompra.setBairro(endCliente.getBairro());
		endCompra.setCep(endCliente.getCep());
		endCompra.setCidade(endCliente.getCidade());
		endCompra.setComplemento(endCliente.getComplemento());
		endCompra.setLogradouro(endCliente.getLogradouro());
		endCompra.setNumero(endCliente.getNumero());
		endCompra.setUf(endCliente.getUf());

		for (ProdutoCarrinho produtoCarrinho : carrinho) {
			ItemCompra itemCompra = new ItemCompra();
			totalCarrinho += produtoCarrinho.getProduto().getValor() * produtoCarrinho.getQuantidade();
			itemCompra.setNome(produtoCarrinho.getProduto().getNome());
			itemCompra.setQuantidade(produtoCarrinho.getQuantidade());
			itemCompra.setValor(produtoCarrinho.getProduto().getValor());
			listItemCompra.add(itemCompra);

		}

		compra.setEndereco(endCompra);
		compra.setDataCompra(new Date());
		compra.setFrete(0.00);
		compra.setStatus("Aguardando pagamento");
		compra.setValor(totalCarrinho);
		compra.setItensCompra(listItemCompra);
		compra.setCliente(cliente);

		try {
			compraDAO.inserir(compra);
			System.out.println(cliente.getIdCliente());
			carrinhoDoClienteDAO.limpaCarrinhoDoCliente(cliente.getIdCliente());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		System.out.println(compra.toString());

		return compra;
	}

	private String sendXml(Cliente c, List<ProdutoCarrinho> carrinho, Compra compra) {
		String code = null;
		URL url;

		try {
			url = new URL("https://ws.sandbox.pagseguro.uol.com.br/v2/checkout/?email=" + emailVendedorPagSeguro
					+ "&token=" + tokenVendedorPagSeguro);

			System.out.println(url);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/xml");

			String requisicaoXml = gerarxml(c, carrinho, compra);

			System.out.println(requisicaoXml);

			OutputStream os = conn.getOutputStream();
			os.write(requisicaoXml.getBytes());
			os.flush();

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				output += output;
				System.out.println(output);
				code = output;
			}

			code = code.substring(76, 108);
			System.out.println(code);
			conn.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;
	}

	private String gerarxml(Cliente c, List<ProdutoCarrinho> carrinho, Compra compra) {

		return "<?xml version=\"1.0\"?><checkout><sender><name>" + c.getNome() + "</name>"
				+ "<email>c71089443377372574576@sandbox.pagseguro.com.br</email><phone>"
				+ "<areaCode>11</areaCode><number>" + c.getContato().getCelular().replace("-", "") + "</number>"
				+ "</phone><ip>1.1.1.1</ip><documents><document><type>CPF</type><value>" + c.getCpf() + "</value>"
				+ "</document></documents></sender><currency>BRL</currency>" + gerarItensXml(carrinho)
				+ "<redirectURL>localhost:8080/BigDog/home</redirectURL>" + "<reference>" + compra.getIdCompra()
				+ "</reference> <receiver> <email>" + emailVendedorPagSeguro + "</email></receiver></checkout>";
	}

	private String gerarItensXml(List<ProdutoCarrinho> carrinho) {
		String produtosXml = "<items>";
		DecimalFormat mascara = new DecimalFormat("#0.00");

		for (ProdutoCarrinho produtoCarrinho : carrinho) {
			produtosXml += "<item><id>" + produtoCarrinho.getProduto().getIdProduto() + "</id><description>"
					+ produtoCarrinho.getProduto().getNome() + "</description><amount>"
					+ mascara.format(produtoCarrinho.getProduto().getValor()).replace(",", ".") + "</amount>"
					+ "<quantity>" + produtoCarrinho.getQuantidade() + "</quantity></item>";
		}

		produtosXml += "</items>";
		return produtosXml;
	}
}
