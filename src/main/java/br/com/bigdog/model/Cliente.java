package br.com.bigdog.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

import br.com.bigdog.util.CriptografiaMD5;
import br.com.bigdog.value.Genero;

@Entity
public class Cliente {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_cliente", nullable = false, columnDefinition = "bigint unsigned")
	private Long idCliente;
	@Column(nullable = false, unique = true)
	private String email;
	@Column(length = 32, nullable = false)
	private String senha;
	@Column(nullable = false)
	private String nome;
	@Column(length = 20, nullable = false, unique = true)
	private String cpf;
	@Temporal(TemporalType.DATE)
	@Column(name = "data_nascimento", nullable = false)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", locale = "pt-BR", timezone = "America/Sao_Paulo")
	private Date dataNascimento;
	@Enumerated(EnumType.STRING)
	@Column(nullable = false, columnDefinition = "enum ('Masculino','Feminino')")
	private Genero genero;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_cliente", nullable = false)
	private List<EnderecoCliente> enderecos;
	@OneToOne(optional = false, cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_contato", nullable = false)
	private Contato contato;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_cliente", nullable = false)
	private List<Pet> pets;
	private String id_redes;

	// Getters e Setters
	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = CriptografiaMD5.encriptar(senha);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public Genero getGenero() {
		return genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	public List<EnderecoCliente> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<EnderecoCliente> enderecos) {
		this.enderecos = enderecos;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public List<Pet> getPets() {
		return pets;
	}

	public void setPets(List<Pet> pets) {
		this.pets = pets;
	}

	public String getId_redes() {
		return id_redes;
	}

	public void setId_redes(String id_redes) {
		this.id_redes = id_redes;
	}

	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", email=" + email + ", senha=" + senha + ", nome=" + nome + ", cpf="
				+ cpf + ", dataNascimento=" + dataNascimento + ", genero=" + genero + ", enderecos=" + enderecos
				+ ", contato=" + contato + ", pets=" + pets + ", id_redes=" + id_redes + "]";
	}
}
