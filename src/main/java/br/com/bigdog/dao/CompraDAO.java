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

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar ordenado por data
	public List<Compra> listarOrdenado() {
		TypedQuery<Compra> query = manager.createQuery("SELECT c FROM Compra c ORDER BY DATE(c.dataCompra)",
				Compra.class);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar (id)
	public Compra listar(Long id) {
		try {
			return manager.find(Compra.class, id);
		} catch (Exception e) {
			return null;
		}
	}

	// Listar (idCliente
	public List<Compra> listarCompraCliente(Long id) {
		// Query
		TypedQuery<Compra> query = manager.createQuery("SELECT c FROM Compra c WHERE c.cliente.idCliente = :idCliente",
				Compra.class);

		// Atribuindo parâmetros
		query.setParameter("idCliente", id);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
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
