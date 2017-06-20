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

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar ordenado por nome
	public List<Produto> listarNome() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p ORDER BY p.nome", Produto.class);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar ORDER
	public List<Produto> listar() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p ORDER BY RAND()", Produto.class);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar (id)
	public Produto listar(Long id) {
		try {
			return manager.find(Produto.class, id);
		} catch (Exception e) {
			return null;
		}
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
				"SELECT p FROM Produto p WHERE p.subCategoria.idSubCategoria = :idSubCategoria and p.qtdEstoque > 0",
				Produto.class);
		query.setParameter("idSubCategoria", id);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar com Limite
	public List<Produto> listarComLimite(int primeiroIndex, int ultimoIndex) {
		TypedQuery<Produto> query = manager
				.createQuery("SELECT p FROM Produto p WHERE p.qtdEstoque > 0 ORDER BY RAND()", Produto.class);
		query.setFirstResult(primeiroIndex);
		query.setMaxResults(ultimoIndex);

		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar apenas produtos que tem em estoque
	public List<Produto> listarDisp() {
		TypedQuery<Produto> query = manager.createQuery("SELECT p FROM Produto p WHERE p.qtdEstoque > 0",
				Produto.class);
		try {
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}
}
