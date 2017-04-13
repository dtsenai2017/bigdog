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

@Entity
public class Categoria {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_categoria", nullable = false, columnDefinition = "bigint unsigned")
	private Long idCategoria;
	@Column(length = 100, nullable = false)
	private String categoria;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "id_categoria", nullable = false)
	private List<SubCategoria> subCategorias;

	// Getters e Setters
	public Long getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Long idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public List<SubCategoria> getSubCategorias() {
		return subCategorias;
	}

	public void setSubCategorias(List<SubCategoria> subCategorias) {
		this.subCategorias = subCategorias;
	}

	@Override
	public String toString() {
		return "Categoria [idCategoria=" + idCategoria + ", categoria=" + categoria + ", subCategorias=" + subCategorias
				+ "]";
	}
}
