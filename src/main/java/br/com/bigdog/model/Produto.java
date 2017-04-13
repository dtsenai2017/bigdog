package br.com.bigdog.model;

import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Produto {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_produto", nullable = false, columnDefinition = "bigint unsigned")
	private Long idProduto;
	@Column(length = 100, nullable = false)
	private String nome;
	@Column(nullable = false, columnDefinition = "varchar(255) default 'N�o h�.'")
	private String descricao;
	@Column(name = "qtd_estoque", nullable = false, columnDefinition = "bigint unsigned")
	private Long qtdEstoque;
	@Column(nullable = false, columnDefinition = "decimal(4,2) unsigned")
	private Double valor;
	@Column(length = 100, nullable = false)
	private String marca;
	@Column(length = 100)
	private String cor;
	@Column(length = 100)
	private String tamanho;
	@Column(length = 100, nullable = false)
	private String quantidade;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(name = "data_vigencia", nullable = false)
	private Date dataVigencia;
	@Column(columnDefinition = "mediumblob")
	private byte[] foto;
	@ManyToOne(optional = false)
	@JoinColumn(name = "id_categoria")
	private Categoria categoria;
	@ManyToOne
	@JoinColumn(name = "id_sub_categoria")
	private SubCategoria subCategoria;
	@ManyToOne(optional = false)
	@JoinColumn(name = "id_fornecedor")
	private Fornecedor fornecedor;

	// Getters e Setters
	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Long getQtdEstoque() {
		return qtdEstoque;
	}

	public void setQtdEstoque(Long qtdEstoque) {
		this.qtdEstoque = qtdEstoque;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getTamanho() {
		return tamanho;
	}

	public void setTamanho(String tamanho) {
		this.tamanho = tamanho;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public Date getDataVigencia() {
		return dataVigencia;
	}

	public void setDataVigencia(Date dataVigencia) {
		this.dataVigencia = dataVigencia;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public SubCategoria getSubCategoria() {
		return subCategoria;
	}

	public void setSubCategoria(SubCategoria subCategoria) {
		this.subCategoria = subCategoria;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	@Override
	public String toString() {
		return "Produto [idProduto=" + idProduto + ", nome=" + nome + ", descricao=" + descricao + ", qtdEstoque="
				+ qtdEstoque + ", valor=" + valor + ", marca=" + marca + ", cor=" + cor + ", tamanho=" + tamanho
				+ ", quantidade=" + quantidade + ", dataVigencia=" + dataVigencia + ", foto=" + Arrays.toString(foto)
				+ ", categoria=" + categoria + ", subCategoria=" + subCategoria + ", fornecedor=" + fornecedor + "]";
	}
}
