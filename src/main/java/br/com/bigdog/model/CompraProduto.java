package br.com.bigdog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "compra_produto")
public class CompraProduto {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_compra_produto", columnDefinition = "bigint unsigned", nullable = false)
	private Long idCompraProduto;
	@Column(columnDefinition = "bigint unsigned", nullable = false)
	private Long quantidade;
	@OneToOne(orphanRemoval = false)
	@JoinColumn(name = "id_produto", nullable = false)
	private Produto produto;

	// Getters e Setters
	public Long getIdCompraProduto() {
		return idCompraProduto;
	}

	public void setIdCompraProduto(Long idCompraProduto) {
		this.idCompraProduto = idCompraProduto;
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

	@Override
	public String toString() {
		return "CompraProduto [idCompraProduto=" + idCompraProduto + ", quantidade=" + quantidade + ", produto="
				+ produto + "]";
	}
}
