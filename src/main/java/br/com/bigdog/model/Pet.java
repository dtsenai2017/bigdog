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

import com.fasterxml.jackson.annotation.JsonFormat;

import br.com.bigdog.value.Especie;
import br.com.bigdog.value.Sexo;

@Entity
public class Pet {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_pet", nullable = false, columnDefinition = "bigint unsigned")
	private Long idPet;
	@Column(nullable = false)
	private String nome;
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "enum ('Cachorro','Gato','Ave','Roedor')", nullable = false)
	private Especie especie;
	@Column(length = 50)
	private String raca;
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "enum ('Macho','Fêmea')", nullable = false)
	private Sexo sexo;
	@Temporal(TemporalType.DATE)
	@Column(name = "data_nascimento")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", locale = "pt-BR", timezone = "America/Sao_Paulo")
	private Date dataNascimento;
	@Column(columnDefinition = "boolean", nullable = false)
	private boolean castrado;
	@Column(length = 20, unique = true)
	private String rga;
	@Column(name = "carteira_vacina", length = 20, unique = true)
	private String carteiraVacina;
	@Column(length = 50)
	private String pelagem;
	@Column(length = 20, unique = true)
	private String pedigree;
	@Column(columnDefinition = "decimal(5,2) default 0")
	private Double peso;
	@Column
	private String observacoes;

	// Getters e Setters
	public Long getIdPet() {
		return idPet;
	}

	public void setIdPet(Long idPet) {
		this.idPet = idPet;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Especie getEspecie() {
		return especie;
	}

	public void setEspecie(Especie especie) {
		this.especie = especie;
	}

	public String getRaca() {
		return raca;
	}

	public void setRaca(String raca) {
		this.raca = raca;
	}

	public Sexo getSexo() {
		return sexo;
	}

	public void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public boolean isCastrado() {
		return castrado;
	}

	public void setCastrado(boolean castrado) {
		this.castrado = castrado;
	}

	public String getRga() {
		return rga;
	}

	public void setRga(String rga) {
		this.rga = rga;
	}

	public String getCarteiraVacina() {
		return carteiraVacina;
	}

	public void setCarteiraVacina(String carteiraVacina) {
		this.carteiraVacina = carteiraVacina;
	}

	public String getPelagem() {
		return pelagem;
	}

	public void setPelagem(String pelagem) {
		this.pelagem = pelagem;
	}

	public String getPedigree() {
		return pedigree;
	}

	public void setPedigree(String pedigree) {
		this.pedigree = pedigree;
	}

	public Double getPeso() {
		return peso;
	}

	public void setPeso(Double peso) {
		this.peso = peso;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	@Override
	public String toString() {
		return "Pet [idPet=" + idPet + ", nome=" + nome + ", especie=" + especie + ", raca=" + raca + ", sexo=" + sexo
				+ ", dataNascimento=" + dataNascimento + ", castrado=" + castrado + ", rga=" + rga + ", carteiraVacina="
				+ carteiraVacina + ", pelagem=" + pelagem + ", pedigree=" + pedigree + ", peso=" + peso
				+ ", observacoes=" + observacoes + "]";
	}
}
