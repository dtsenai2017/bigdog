package br.com.bigdog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "sub_categoria")
public class SubCategoria {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_sub_categoria", nullable = false, columnDefinition = "bigint unsigned")
	private Long idSubCategoria;
	@Column(length = 100, name = "sub_categoria", nullable = false)
	private String subCategoria;

	// Getters e Setters
	public Long getIdSubCategoria() {
		return idSubCategoria;
	}

	public void setIdSubCategoria(Long idSubCategoria) {
		this.idSubCategoria = idSubCategoria;
	}

	public String getSubCategoria() {
		return subCategoria;
	}

	public void setSubCategoria(String subCategoria) {
		this.subCategoria = subCategoria;
	}

	@Override
	public String toString() {
		return "SubCategoria [idSubCategoria=" + idSubCategoria + ", subCategoria=" + subCategoria + "]";
	}
}
