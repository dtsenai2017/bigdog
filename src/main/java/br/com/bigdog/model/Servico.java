package br.com.bigdog.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import br.com.bigdog.value.StatusServico;
import br.com.bigdog.value.TipoServico;

@Entity
public class Servico {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_servico", nullable = false, columnDefinition = "bigint unsigned")
	private Long idServico;
	@Column(nullable = false)
	private String nome;
	@Enumerated(EnumType.STRING)
	@Column(name = "tipo_servico", columnDefinition = "enum ('Veterinario','Estetica')", nullable = false)
	private TipoServico tipoServico;
	@Column(nullable = false, columnDefinition = "decimal(10,2)")
	private Double valor;
	@DateTimeFormat(pattern = "HH:mm:ss")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss", locale = "pt-BR", timezone = "America/Sao_Paulo")
	@Temporal(TemporalType.TIME)
	@Column(name = "tempo_estimado", nullable = false)
	private Date tempoEstimado;
	@Column(nullable = true)
	private String observacao;
	@Enumerated(EnumType.STRING)
	@Column(name = "status", columnDefinition = "enum ('Ativo','Desativado')", nullable = false)
	private StatusServico status;

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

	public StatusServico getStatus() {
		return status;
	}

	public void setStatus(StatusServico status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Servico [idServico=" + idServico + ", nome=" + nome + ", tipoServico=" + tipoServico + ", valor="
				+ valor + ", tempoEstimado=" + tempoEstimado + ", observacao=" + observacao + ", status=" + status
				+ "]";
	}
}
