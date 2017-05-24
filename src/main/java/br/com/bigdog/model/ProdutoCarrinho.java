package br.com.bigdog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity(name = "produto_carrinho")
public class ProdutoCarrinho {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_produto_carrinho", columnDefinition = "bigint unsigned")
	private Long idProdutoCarrinho;
	@Column(nullable = false, columnDefinition = "bigint unsigned")
	private Long quantidade;
	@OneToOne
	@JoinColumn(name = "id_produto", nullable = false)
	private Produto produto;
	@ManyToOne(optional = false)
	@JoinColumn(name = "id_cliente", nullable = false)
	private Cliente cliente;

	// Getters e Setters
	public Long getIdProdutoCarrinho() {
		return idProdutoCarrinho;
	}

	public void setIdProdutoCarrinho(Long idProdutoCarrinho) {
		this.idProdutoCarrinho = idProdutoCarrinho;
	}

	public Long getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Long quantidade) {
		this.quantidade = quantidade;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public String toString() {
		return "ProdutoCarrinho [idProdutoCarrinho=" + idProdutoCarrinho + ", quantidade=" + quantidade + ", produto="
				+ produto + ", cliente=" + cliente + "]";
	}
}
