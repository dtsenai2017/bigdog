package br.com.bigdog.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Carrinho;

@Repository
public class CarrinhoDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	@Transactional
	public void inserir(Carrinho carrinho) {
		manager.persist(carrinho);
	}

	@Transactional
	public void alterar(Carrinho carrinho) {
		manager.merge(carrinho);
	}

	public Carrinho listar(long id) {
		return manager.find(Carrinho.class, id);
	}

	@Transactional
	public void excluir(long id) {
		Carrinho carrinho = listar(id);
		manager.remove(carrinho);
	}

}
