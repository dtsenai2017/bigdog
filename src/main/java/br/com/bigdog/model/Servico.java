package br.com.bigdog.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import br.com.bigdog.value.TipoServico;

public class Servico {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_servico", nullable = false, columnDefinition = "bigint unsigned")
	private Long idServico;
	@Column(nullable = false)
	private String nome;
	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_servico", columnDefinition = "enum ('Clínica Veterinária','Banho e Tosa')", nullable = false)
	private TipoServico tipoServico;
	@Column(nullable = false, columnDefinition = "decimal(4,2)")
	private Double valor;
	@DateTimeFormat(pattern = "hh:mm:ss")
	@Temporal(TemporalType.TIME)
	@Column(name = "tempo_estimado", nullable = false)
	private Date tempoEstimado;
	@Column(nullable = true)
	private String observacao;

	// Getters e Setters
	public Long getIdServico() {
		return idServico;
	}

	public void setIdServico(Long idServico) {
		this.idServico = idServico;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public TipoServico getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(TipoServico tipoServico) {
		this.tipoServico = tipoServico;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Date getTempoEstimado() {
		return tempoEstimado;
	}

	public void setTempoEstimado(Date tempoEstimado) {
		this.tempoEstimado = tempoEstimado;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
}
