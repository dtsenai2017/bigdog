package br.com.bigdog.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Compra {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_compra", nullable = false, columnDefinition = "bigint unsigned")
	private Long idCompra;
	@Column(name = "data_compra", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCompra;
	@Column(columnDefinition = "decimal(5,2) unsigned", nullable = false)
	private Double valor;
	@Column(columnDefinition = "decimal(5,2) unsigned default 0", nullable = false)
	private Double frete;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_compra", nullable = false)
	private List<CompraProduto> compraProdutos;

	// Getters e Setters
	public Long getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(Long idCompra) {
		this.idCompra = idCompra;
	}

	public Date getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(Date dataCompra) {
		this.dataCompra = dataCompra;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Double getFrete() {
		return frete;
	}

	public void setFrete(Double frete) {
		this.frete = frete;
	}

	public List<CompraProduto> getCompraProdutos() {
		return compraProdutos;
	}

	public void setCompraProdutos(List<CompraProduto> compraProdutos) {
		this.compraProdutos = compraProdutos;
	}

	@Override
	public String toString() {
		return "Compra [idCompra=" + idCompra + ", dataCompra=" + dataCompra + ", valor=" + valor + ", frete=" + frete
				+ ", compraProdutos=" + compraProdutos + "]";
	}
}
