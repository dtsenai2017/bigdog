package br.com.bigdog.model;

public class TokenCliente {
	// Atributo
	private String token;
	private Cliente cliente;

	// Getters e Setters
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public String toString() {
		return "TokenCliente [token=" + token + ", cliente=" + cliente + "]";
	}
}
