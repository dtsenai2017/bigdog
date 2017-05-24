package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Produto;

@Repository
public class ProdutoDAO {
	// Gerenciador de entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Produto produto) {
		manager.persist(produto);
	}

	// Listar
	public List<Produto> listarOrdenado() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p", Produto.class);
		return query.getResultList();
	}

	// Listar ORDER
	public List<Produto> listar() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p ORDER BY RAND()", Produto.class);
		return query.getResultList();
	}

	// Listar (id)
	public Produto listar(Long id) {
		return manager.find(Produto.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Produto produto) {
		manager.merge(produto);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Produto produto = listar(id);
		manager.remove(produto);
	}

	// Listar por subcategoria
	public List<Produto> buscar(Long id) {
		TypedQuery<Produto> query = manager.createQuery(
				"SELECT p FROM Produto p WHERE p.subCategoria.idSubCategoria = :idSubCategoria", Produto.class);
		query.setParameter("idSubCategoria", id);
		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar com Limite
	public List<Produto> listarComLimite(int primeiroIndex, int ultimoIndex) {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p ORDER BY RAND()", Produto.class);
		query.setFirstResult(primeiroIndex);
		query.setMaxResults(ultimoIndex);
		return query.getResultList();
	}
}
