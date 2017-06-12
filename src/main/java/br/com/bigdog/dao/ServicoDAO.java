package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Servico;
import br.com.bigdog.value.StatusServico;

@Repository
public class ServicoDAO {
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

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar (id)
	public Servico listar(Long id) {
		try {
			return manager.find(Servico.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	// Listar serviços por status
	public List<Servico> listarAtivos(StatusServico status) {
		TypedQuery<Servico> query = manager.createQuery("SELECT s FROM Servico s WHERE s.status = :status",
				Servico.class);

		// Atribuindo parâmetro
		query.setParameter("status", status);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
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
