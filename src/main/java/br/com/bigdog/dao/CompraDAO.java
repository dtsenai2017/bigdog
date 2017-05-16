package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Compra;

@Repository
public class CompraDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Compra compra) {
		manager.persist(compra);
	}

	// Listar
	public List<Compra> listar() {
		TypedQuery<Compra> query = manager.createQuery("SELECT c FROM Compra c", Compra.class);
		return query.getResultList();
	}

	// Listar (id)
	public Compra listar(Long id) {
		return manager.find(Compra.class, id);
	}

	// Listar (idCliente
	public List<Compra> listarCompraCliente(Long id) {
		// Query
		TypedQuery<Compra> query = manager.createQuery("SELECT c FROM Compra c WHERE c.cliente.idCliente = :idCliente",
				Compra.class);

		// Atribuindo parâmetros
		query.setParameter("idCliente", id);

		// Retornando
		return query.getResultList();
	}

	// Alterar
	@Transactional
	public void alterar(Compra compra) {
		manager.merge(compra);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Compra categoria = listar(id);
		manager.remove(categoria);
	}
}
