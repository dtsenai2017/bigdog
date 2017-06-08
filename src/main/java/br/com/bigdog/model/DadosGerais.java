package br.com.bigdog.model;

import java.util.Arrays;
import java.util.List;

/**
 * 
 * @author Diego
 * 
 *         Model ultilizada para informações gerais, tais como quantidade de
 *         compras, agendamentos, produtos...
 */
public class DadosGerais {
	// Atributos
	private Long qtdCliente;
	private Long qtdPet;
	private Long qtdEnderecoCliente;
	private Long qtdFornecedor;
	private Long qtdEnderecoFornecedor;
	private Long qtdCategoria;
	private Long qtdSubCategoria;
	private Long qtdProduto;
	private Long qtdCompra;
	private Long qtdServico;
	private Long qtdAgendamento;
	private List<Cliente> ultimosClientes;
	private List<Compra> ultimasCompras;
	private Integer[] mesCompra;

	// Getters e Setters
	public Long getQtdCliente() {
		return qtdCliente;
	}

	public void setQtdCliente(Long qtdCliente) {
		this.qtdCliente = qtdCliente;
	}

	public Long getQtdPet() {
		return qtdPet;
	}

	public void setQtdPet(Long qtdPet) {
		this.qtdPet = qtdPet;
	}

	public Long getQtdEnderecoCliente() {
		return qtdEnderecoCliente;
	}

	public void setQtdEnderecoCliente(Long qtdEnderecoCliente) {
		this.qtdEnderecoCliente = qtdEnderecoCliente;
	}

	public Long getQtdFornecedor() {
		return qtdFornecedor;
	}

	public void setQtdFornecedor(Long qtdFornecedor) {
		this.qtdFornecedor = qtdFornecedor;
	}

	public Long getQtdEnderecoFornecedor() {
		return qtdEnderecoFornecedor;
	}

	public void setQtdEnderecoFornecedor(Long qtdEnderecoFornecedor) {
		this.qtdEnderecoFornecedor = qtdEnderecoFornecedor;
	}

	public Long getQtdCategoria() {
		return qtdCategoria;
	}

	public void setQtdCategoria(Long qtdCategoria) {
		this.qtdCategoria = qtdCategoria;
	}

	public Long getQtdSubCategoria() {
		return qtdSubCategoria;
	}

	public void setQtdSubCategoria(Long qtdSubCategoria) {
		this.qtdSubCategoria = qtdSubCategoria;
	}

	public Long getQtdProduto() {
		return qtdProduto;
	}

	public void setQtdProduto(Long qtdProduto) {
		this.qtdProduto = qtdProduto;
	}

	public Long getQtdCompra() {
		return qtdCompra;
	}

	public void setQtdCompra(Long qtdCompra) {
		this.qtdCompra = qtdCompra;
	}

	public Long getQtdServico() {
		return qtdServico;
	}

	public void setQtdServico(Long qtdServico) {
		this.qtdServico = qtdServico;
	}

	public Long getQtdAgendamento() {
		return qtdAgendamento;
	}

	public void setQtdAgendamento(Long qtdAgendamento) {
		this.qtdAgendamento = qtdAgendamento;
	}

	public List<Cliente> getUltimosClientes() {
		return ultimosClientes;
	}

	public void setUltimosClientes(List<Cliente> ultimosClientes) {
		this.ultimosClientes = ultimosClientes;
	}

	public List<Compra> getUltimasCompras() {
		return ultimasCompras;
	}

	public void setUltimasCompras(List<Compra> ultimasCompras) {
		this.ultimasCompras = ultimasCompras;
	}

	public Integer[] getMesCompra() {
		return mesCompra;
	}

	public void setMesCompra(Integer[] mesCompra) {
		this.mesCompra = mesCompra;
	}

	@Override
	public String toString() {
		return "DadosGerais [qtdCliente=" + qtdCliente + ", qtdPet=" + qtdPet + ", qtdEnderecoCliente="
				+ qtdEnderecoCliente + ", qtdFornecedor=" + qtdFornecedor + ", qtdEnderecoFornecedor="
				+ qtdEnderecoFornecedor + ", qtdCategoria=" + qtdCategoria + ", qtdSubCategoria=" + qtdSubCategoria
				+ ", qtdProduto=" + qtdProduto + ", qtdCompra=" + qtdCompra + ", qtdServico=" + qtdServico
				+ ", qtdAgendamento=" + qtdAgendamento + ", ultimosClientes=" + ultimosClientes + ", ultimasCompras="
				+ ultimasCompras + ", mesCompra=" + Arrays.toString(mesCompra) + "]";
	}
}
