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
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class Compra {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_compra", nullable = false, columnDefinition = "bigint unsigned")
	private Long idCompra;
	@Column(name = "data_compra", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", locale = "pt-BR", timezone = "America/Sao_Paulo")
	private Date dataCompra;
	@Column(length = 50)
	private String status;
	@Column(columnDefinition = "decimal(10,2) unsigned", nullable = false)
	private Double valor;
	@Column(columnDefinition = "decimal(10,2) unsigned default 0", nullable = false)
	private Double frete;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_compra", nullable = false)
	private List<ItemCompra> itensCompra;
	@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_endereco_compra", nullable = false)
	private EnderecoCompra endereco;
	@OneToOne(orphanRemoval = false)
	@JoinColumn(name = "id_cliente", nullable = false)
	private Cliente cliente;

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public List<ItemCompra> getItensCompra() {
		return itensCompra;
	}

	public void setItensCompra(List<ItemCompra> itensCompra) {
		this.itensCompra = itensCompra;
	}

	public EnderecoCompra getEndereco() {
		return endereco;
	}

	public void setEndereco(EnderecoCompra endereco) {
		this.endereco = endereco;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public String toString() {
		return "Compra [idCompra=" + idCompra + ", dataCompra=" + dataCompra + ", status=" + status + ", valor=" + valor
				+ ", frete=" + frete + ", itensCompra=" + itensCompra + ", endereco=" + endereco + ", cliente="
				+ cliente + "]";
	}
}
