package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.SubCategoria;

@Repository
public class SubCategoriaDAO implements GenericDAO<SubCategoria> {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(SubCategoria subCategoria) {
		manager.persist(subCategoria);
	}

	// Listar
	public List<SubCategoria> listar() {
		TypedQuery<SubCategoria> query = manager.createQuery("SELECT sc FROM SubCategoria sc", SubCategoria.class);
		return query.getResultList();
	}

	// Listar (id)
	public SubCategoria listar(Long id) {
		return manager.find(SubCategoria.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(SubCategoria subCategoria) {
		manager.merge(subCategoria);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		SubCategoria subCategoria = listar(id);
		manager.remove(subCategoria);
	}
}
