package br.com.bigdog.model;

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

@Entity
public class Fornecedor {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_fornecedor", columnDefinition = "bigint unsigned")
	private Long idFornecedor;
	@Column(name = "nome_fantasia", nullable = false)
	private String nomeFantasia;
	@Column(name = "razao_social", nullable = false)
	private String razaoSocial;
	@Column(length = 20, nullable = false, unique = true)
	private String cnpj;
	@OneToOne(optional = false, cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_contato", nullable = false)
	private Contato contato;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_fornecedor", nullable = false)
	private List<EnderecoFornecedor> enderecos;

	// Getters e Setters
	public Long getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(Long idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public List<EnderecoFornecedor> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<EnderecoFornecedor> enderecos) {
		this.enderecos = enderecos;
	}

	@Override
	public String toString() {
		return "Fornecedor [idFornecedor=" + idFornecedor + ", nomeFantasia=" + nomeFantasia + ", razaoSocial="
				+ razaoSocial + ", cnpj=" + cnpj + ", contato=" + contato + ", enderecos=" + enderecos + "]";
	}
}
