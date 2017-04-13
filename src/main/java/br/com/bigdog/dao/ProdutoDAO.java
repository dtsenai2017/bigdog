package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Produto;

@Repository
public class ProdutoDAO implements GenericDAO<Produto> {
	// Gerenciador de entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Produto produto) {
		manager.persist(produto);
	}

	// Listar
	public List<Produto> listar() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p", Produto.class);
		return query.getResultList();
	}

	// Listar (id)
	public Produto listar(Long id) {
		return manager.find(Produto.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Produto produto) {
		manager.merge(produto);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Produto produto = listar(id);
		manager.remove(produto);
	}
}
