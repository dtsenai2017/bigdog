package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Servico;

@Repository
public class ServicoDAO implements GenericDAO<Servico> {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Servico servico) {
		manager.persist(servico);
	}

	// Listar
	public List<Servico> listar() {
		TypedQuery<Servico> query = manager.createQuery("SELECT s FROM Servico s", Servico.class);
		return query.getResultList();
	}

	// Listar (id)
	public Servico listar(Long id) {
		return manager.find(Servico.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Servico servico) {
		manager.merge(servico);
	}

	// Excluir (id)
	@Transactional
	public void excluir(Long id) {
		Servico servico = listar(id);
		manager.remove(servico);
	}
}
