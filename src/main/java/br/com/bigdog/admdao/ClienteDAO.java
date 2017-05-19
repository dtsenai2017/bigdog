package br.com.bigdog.admdao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Cliente;

@Repository
public class ClienteDAO implements GenericDAO<Cliente> {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Cliente cliente) {
		manager.persist(cliente);
	}

	// Listar
	public List<Cliente> listar() {
		TypedQuery<Cliente> query = manager.createQuery("SELECT c FROM Cliente c", Cliente.class);
		return query.getResultList();
	}

	// Listar (id)
	public Cliente listar(Long id) {
		return manager.find(Cliente.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Cliente cliente) {
		manager.merge(cliente);
	}

	// Excluir (id)
	@Transactional
	public void excluir(Long id) {
		Cliente cliente = listar(id);
		manager.remove(cliente);
	}
}
