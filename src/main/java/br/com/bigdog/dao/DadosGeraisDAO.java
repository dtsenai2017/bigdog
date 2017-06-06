package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Compra;

@Repository
public class DadosGeraisDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Count de Cliente
	public Long countCliente() {
		return (Long) manager.createQuery("SELECT COUNT(c) FROM Cliente c").getSingleResult();
	}

	// Count de Pet
	public Long countPet() {
		return (Long) manager.createQuery("SELECT COUNT(p) FROM Pet p").getSingleResult();
	}

	// Count de Endereço de Cliente
	public Long countEnderecoCliente() {
		return (Long) manager.createQuery("SELECT COUNT(ec) FROM endereco_cliente ec").getSingleResult();
	}

	// Count de Fornecedor
	public Long countFornecedor() {
		return (Long) manager.createQuery("SELECT COUNT(f) FROM Fornecedor f").getSingleResult();
	}

	// Count de Endereço de Fornecedor
	public Long countEnderecoFornecedor() {
		return (Long) manager.createQuery("SELECT COUNT(ef) FROM endereco_fornecedor ef").getSingleResult();
	}

	// Count de Categoria
	public Long countCategoria() {
		return (Long) manager.createQuery("SELECT COUNT(c) FROM Categoria c").getSingleResult();
	}

	// Count de SubCategoria
	public Long countSubCategoria() {
		return (Long) manager.createQuery("SELECT COUNT(sb) FROM sub_categoria sb").getSingleResult();
	}

	// Count de Produto
	public Long countProduto() {
		return (Long) manager.createQuery("SELECT COUNT(p) FROM Produto p").getSingleResult();
	}

	// Count de Compra
	public Long countCompra() {
		return (Long) manager.createQuery("SELECT COUNT(c) FROM Compra c").getSingleResult();
	}

	// Count de Serviço
	public Long countServico() {
		return (Long) manager.createQuery("SELECT COUNT(s) FROM Servico s").getSingleResult();
	}

	// Count de Agendamento
	public Long countAgendamento() {
		return (Long) manager.createQuery("SELECT COUNT(a) FROM Agendamento a").getSingleResult();
	}

	// Lista Últimos Clientes Cadastrados
	public List<Cliente> ultimosClientes() {
		TypedQuery<Cliente> query = manager.createQuery("SELECT c FROM Cliente c ORDER BY c.idCliente DESC",
				Cliente.class);
		query.setMaxResults(10);
		return query.getResultList();
	}

	// Lista Últimas Compras Realizadas
	public List<Compra> ultimasCompras() {
		TypedQuery<Compra> query = manager.createQuery("SELECT c FROM Compra c ORDER BY c.dataCompra DESC",
				Compra.class);
		query.setMaxResults(10);
		return query.getResultList();
	}
}
