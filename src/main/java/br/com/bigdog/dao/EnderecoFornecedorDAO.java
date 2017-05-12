package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.EnderecoFornecedor;

@Repository
public class EnderecoFornecedorDAO implements GenericDAO<EnderecoFornecedor> {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(EnderecoFornecedor enderecoFornecedor) {
		manager.persist(enderecoFornecedor);
	}

	// Listar
	public List<EnderecoFornecedor> listar() {
		TypedQuery<EnderecoFornecedor> query = manager.createQuery("SELECT e FROM EnderecoFornecedor e",
				EnderecoFornecedor.class);
		return query.getResultList();
	}

	// Listar (id)
	public EnderecoFornecedor listar(Long id) {
		return manager.find(EnderecoFornecedor.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(EnderecoFornecedor enderecoFornecedor) {
		manager.merge(enderecoFornecedor);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		EnderecoFornecedor enderecoFornecedor = listar(id);
		manager.remove(enderecoFornecedor);
	}
}
