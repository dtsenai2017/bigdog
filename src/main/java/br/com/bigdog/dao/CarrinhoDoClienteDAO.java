package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.ProdutoCarrinho;

@Repository
public class CarrinhoDoClienteDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Listar Carrinho do cliente
	public List<ProdutoCarrinho> listarCarrinhoDoCliente(Long id) {
		TypedQuery<ProdutoCarrinho> query = manager.createQuery(
				"SELECT pc FROM produto_carrinho pc WHERE pc.cliente.idCliente =:idCliente ", ProdutoCarrinho.class);
		query.setParameter("idCliente", id);
		return query.getResultList();
	}

	// Limpar Carrinho
	@Transactional
	public void limpaCarrinhoDoCliente(long idCliente) {
		try {
			Query query = manager.createQuery("DELETE produto_carrinho p WHERE p.cliente.idCliente = :idCliente");
			query.setParameter("idCliente", idCliente);
			int result = query.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
