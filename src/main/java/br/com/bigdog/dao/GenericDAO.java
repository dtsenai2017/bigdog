package br.com.bigdog.dao;

import java.util.List;

public interface GenericDAO<T> {
	// Inserir
	void inserir(T t);
	
	// Listar
	List<T> listar();
	
	// Listar (id) 
	T listar(Long id);
	
	// Alterar
	void alterar(T t);
	
	// Excluir (id)
	void excluir(Long id);
}
