package br.com.bigdog.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Carrinho {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_carrinho", columnDefinition = "bigint unsigned")
	private Long idCarrinho;
	@OneToOne
	@JoinColumn(name = "id_cliente", nullable = false)
	private Cliente cliente;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_carrinho", nullable = false)
	private List<ProdutoCarrinho> produtosCarrinho;

	// Getters e Setters
	public Long getIdCarrinho() {
		return idCarrinho;
	}

	public void setIdCarrinho(Long idCarrinho) {
		this.idCarrinho = idCarrinho;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<ProdutoCarrinho> getProdutosCarrinho() {
		return produtosCarrinho;
	}

	public void setProdutosCarrinho(List<ProdutoCarrinho> produtosCarrinho) {
		this.produtosCarrinho = produtosCarrinho;
	}

	@Override
	public String toString() {
		return "Carrinho [idCarrinho=" + idCarrinho + ", cliente=" + cliente + ", produtosCarrinho=" + produtosCarrinho
				+ "]";
	}
}
