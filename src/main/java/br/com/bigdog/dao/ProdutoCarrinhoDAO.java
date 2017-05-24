package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.ProdutoCarrinho;

@Repository
public class ProdutoCarrinhoDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(ProdutoCarrinho produtoCarrinho) {
		manager.persist(produtoCarrinho);
	}

	// Listar
	public List<ProdutoCarrinho> listar() {
		TypedQuery<ProdutoCarrinho> query = manager.createQuery("SELECT pc FROM ProdutoCarrinho pc",
				ProdutoCarrinho.class);
		return query.getResultList();
	}

	// Listar (id)
	public ProdutoCarrinho listar(Long id) {
		return manager.find(ProdutoCarrinho.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(ProdutoCarrinho produtoCarrinho) {
		// TODO Auto-generated method stub
		manager.merge(produtoCarrinho);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		ProdutoCarrinho produtoCarrinho = listar(id);
		manager.remove(produtoCarrinho);
	}

	// Listar com Limite
	public List<ProdutoCarrinho> listarComLimite(long primeiroIndex, long ultimoIndex) {
		// TODO Auto-generated method stub
		return null;
	}
}
