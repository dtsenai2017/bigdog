package br.com.bigdog.model;

public class UsuarioRS {
	// Atributos
	private String email;
	private String cpf;
	private String senhaNova;

	// Getters e Setters
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getSenhaNova() {
		return senhaNova;
	}

	public void setSenhaNova(String senhaNova) {
		this.senhaNova = senhaNova;
	}

	@Override
	public String toString() {
		return "UsuarioRS [email=" + email + ", cpf=" + cpf + ", senhaNova=" + senhaNova + "]";
	}
}
