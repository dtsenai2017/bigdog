package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Fornecedor;

@Repository
public class FornecedorDAO implements GenericDAO<Fornecedor> {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Fornecedor fornecedor) {
		manager.persist(fornecedor);
	}

	// Listar
	public List<Fornecedor> listar() {
		TypedQuery<Fornecedor> query = manager.createQuery("SELECT f FROM Fornecedor f ORDER BY f.nomeFantasia",
				Fornecedor.class);
		return query.getResultList();
	}

	// Listar (id)
	public Fornecedor listar(Long id) {
		return manager.find(Fornecedor.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Fornecedor fornecedor) {
		manager.merge(fornecedor);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Fornecedor fornecedor = listar(id);
		manager.remove(fornecedor);
	}
}
