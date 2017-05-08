package br.com.bigdog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "item_compra")
public class ItemCompra {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_item_compra", columnDefinition = "bigint unsigned", nullable = false)
	private Long idItemCompra;
	@Column(columnDefinition = "bigint unsigned", nullable = false)
	private Long quantidade;
	@Column(nullable = false, columnDefinition = "decimal(5,2) unsigned")
	private Double valor;

	// Getters e Setters
	public void setIdItemCompra(Long idItemCompra) {
		this.idItemCompra = idItemCompra;
	}

	public void setQuantidade(Long quantidade) {
		this.quantidade = quantidade;
	}

	public Long getQuantidade() {
		return quantidade;
	}

	public Long getIdItemCompra() {
		return idItemCompra;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	@Override
	public String toString() {
		return "ItemCompra [idItemCompra=" + idItemCompra + ", quantidade=" + quantidade + ", valor=" + valor + "]";
	}
}
