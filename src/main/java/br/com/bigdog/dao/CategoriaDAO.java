package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Categoria;

@Repository
public class CategoriaDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Categoria categoria) {
		manager.persist(categoria);
	}

	// Listar
	public List<Categoria> listar() {
		TypedQuery<Categoria> query = manager.createQuery("SELECT c FROM Categoria c", Categoria.class);
		return query.getResultList();
	}

	// Listar (id)
	public Categoria listar(Long id) {
		return manager.find(Categoria.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Categoria categoria) {
		manager.merge(categoria);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Categoria categoria = listar(id);
		manager.remove(categoria);
	}

	// Listar com limite
	public List<Categoria> listarComLimite(long primeiroIndex, long ultimoIndex) {
		// TODO Auto-generated method stub
		return null;
	}
}
