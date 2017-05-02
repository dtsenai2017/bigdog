package br.com.bigdog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "endereco_fornecedor")
public class EnderecoFornecedor {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_endereco_fornecedor", nullable = false, columnDefinition = "bigint unsigned")
	private Long idEnderecoFornecedor;
	@Column(length = 10, nullable = false)
	private String cep;
	@Column(nullable = false)
	private String logradouro;
	@Column(length = 10, nullable = false)
	private String numero;
	@Column(length = 50)
	private String complemento;
	@Column(length = 100, nullable = false)
	private String bairro;
	@Column(length = 100, nullable = false)
	private String cidade;
	@Column(nullable = false, columnDefinition = "char(2)")
	private String uf;

	// Getters e Setters
	public Long getIdEnderecoFornecedor() {
		return idEnderecoFornecedor;
	}

	public void setIdEnderecoFornecedor(Long idEnderecoFornecedor) {
		this.idEnderecoFornecedor = idEnderecoFornecedor;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	@Override
	public String toString() {
		return "EnderecoFornecedor [idEnderecoFornecedor=" + idEnderecoFornecedor + ", cep=" + cep + ", logradouro="
				+ logradouro + ", numero=" + numero + ", complemento=" + complemento + ", bairro=" + bairro
				+ ", cidade=" + cidade + ", uf=" + uf + "]";
	}
}
