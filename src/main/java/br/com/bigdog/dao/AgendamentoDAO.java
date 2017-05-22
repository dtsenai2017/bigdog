package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Agendamento;

@Repository
public class AgendamentoDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Agendamento agendamento) {
		manager.persist(agendamento);
	}

	// Listar
	public List<Agendamento> listar() {
		TypedQuery<Agendamento> query = manager.createQuery("SELECT a FROM Agendamento a", Agendamento.class);
		return query.getResultList();
	}

	// Listar (id)
	public Agendamento listar(Long id) {
		return manager.find(Agendamento.class, id);
	}

	// Listar (idCliente
	public List<Agendamento> listarAgendamentoCliente(Long id) {
		// Query
		TypedQuery<Agendamento> query = manager
				.createQuery("SELECT a FROM Agendamento a WHERE a.cliente.idCliente = :idCliente", Agendamento.class);

		// Atribuindo parāmetros
		query.setParameter("idCliente", id);

		// Retornando
		return query.getResultList();
	}

	// Alterar
	@Transactional
	public void alterar(Agendamento agendamento) {
		manager.merge(agendamento);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Agendamento agendamento = listar(id);
		manager.remove(agendamento);
	}
}
