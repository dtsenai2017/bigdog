package br.com.bigdog.model;

public class Administrador {
	// Atributos
	private String email;
	private String senha;

	// Getters e Setters
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
		this.senha = senha;
	}

	@Override
	public String toString() {
		return "Administrador [email=" + email + ", senha=" + senha + "]";
	}
}
