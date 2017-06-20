package br.com.bigdog.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Carrinho;
import br.com.bigdog.model.ProdutoCarrinho;

@Repository
public class CarrinhoDoClienteDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Listar Carrinho do cliente
	public Carrinho listarCarrinhoDoCliente(Long idCliente) {
		// Query
		TypedQuery<Carrinho> query = manager
				.createQuery("SELECT c FROM Carrinho c WHERE c.cliente.idCliente =:idCliente ", Carrinho.class);

		// Atribuindo parâmetros
		query.setParameter("idCliente", idCliente);

		// Retornando...
		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	// Limpar Carrinho do cliente
	@Transactional
	public void limpaCarrinhoDoCliente(long idCarrinho) {
		// Query
		Query query = manager
				.createNativeQuery("DELETE FROM produto_carrinho WHERE produto_carrinho.id_carrinho = " + idCarrinho);

		// Executando query
		query.executeUpdate();
	}

	// Listar produto do carrinho
	public ProdutoCarrinho listarProdutoCarrinho(Long idProdutoCarrinho) {
		// Query
		TypedQuery<ProdutoCarrinho> query = manager.createQuery(
				"SELECT p FROM produto_carrinho p WHERE p.idProdutoCarrinho =:idProdutoCarrinho ",
				ProdutoCarrinho.class);

		// Atribuindo parâmetros
		query.setParameter("idProdutoCarrinho", idProdutoCarrinho);

		// Retornando...
		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
