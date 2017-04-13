package br.com.bigdog.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class Compra {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_compra", nullable = false, columnDefinition = "bigint unsigned")
	private Long idCompra;
	@Column(name = "data_compra", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCompra;
	@Column(nullable = false, columnDefinition = "decimal(5,2)")
	private Double valor;

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
}
