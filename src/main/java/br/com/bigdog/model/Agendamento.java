package br.com.bigdog.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class Agendamento {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_agendamento", columnDefinition = "bigint unsigned")
	private Long idAgendamento;
	@Column(name = "data_agendada", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", locale = "pt-BR", timezone = "America/Sao_Paulo")
	private Date dataAgendada;
	@OneToOne(orphanRemoval = false)
	@JoinColumn(name = "id_cliente", nullable = false)
	private Cliente cliente;
	@OneToOne(orphanRemoval = false)
	@JoinColumn(name = "id_servico", nullable = false)
	private Servico servico;
	@OneToOne(orphanRemoval = false)
	@JoinColumn(name = "id_pet", nullable = false)
	private Pet pet;

	// Getters e Setters
	public Long getIdAgendamento() {
		return idAgendamento;
	}

	public void setIdAgendamento(Long idAgendamento) {
		this.idAgendamento = idAgendamento;
	}

	public Date getDataAgendada() {
		return dataAgendada;
	}

	public void setDataAgendada(Date dataAgendada) {
		this.dataAgendada = dataAgendada;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	@Override
	public String toString() {
		return "Agendamento [idAgendamento=" + idAgendamento + ", dataAgendada=" + dataAgendada + ", cliente=" + cliente
				+ ", servico=" + servico + ", pet=" + pet + "]";
	}
}
