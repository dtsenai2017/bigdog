package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Cliente;

@Repository
public class ClienteDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Cliente cliente) {
		manager.persist(cliente);
	}

	// Listar
	public List<Cliente> listar() {
		TypedQuery<Cliente> query = manager.createQuery("SELECT c FROM Cliente c", Cliente.class);
		return query.getResultList();
	}

	// Listar ordenado por letra do nome
	public List<Cliente> listarOrdenado() {
		TypedQuery<Cliente> query = manager.createQuery("SELECT c FROM Cliente c ORDER BY c.nome", Cliente.class);
		return query.getResultList();
	}

	// Listar (id)
	public Cliente listar(Long id) {
		return manager.find(Cliente.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Cliente cliente) {
		manager.merge(cliente);
	}

	// Excluir (id)
	@Transactional
	public void excluir(Long id) {
		Cliente cliente = listar(id);
		manager.remove(cliente);
	}

	// Buscar cliente por id
	public Cliente buscaCliente(Long id) {
		TypedQuery<Cliente> query = manager.createQuery("select c from Cliente c where c.idCliente = :idCliente",
				Cliente.class);
		query.setParameter("idCliente", id);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// Buscar cliente por idRedes
	public Cliente busca(String id) {
		TypedQuery<Cliente> query = manager.createQuery("select c from Cliente c where c.id_redes = :id_redes",
				Cliente.class);
		query.setParameter("id_redes", id);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// Buscar CPF
	public Cliente buscaCpf(String id) {
		// Query
		TypedQuery<Cliente> query = manager.createQuery("select c from Cliente c where c.cpf = :cpf", Cliente.class);

		// Atribuindo par�metro
		query.setParameter("cpf", id);

		// Retornando...
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	// Buscar Email
	public Cliente buscaEmail(String email) {
		// Query
		TypedQuery<Cliente> query = manager.createQuery("select c from Cliente c where c.email = :email",
				Cliente.class);

		// Atribuindo par�metro
		query.setParameter("email", email);

		// Retornando...
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	// Listar com Limite
	public List<Cliente> listarComLimite(int primeiroIndex, int ultimoIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	// Logar
	public Cliente logar(Cliente cliente) {
		TypedQuery<Cliente> query = manager
				.createQuery("SELECT c FROM Cliente c WHERE c.email = :email AND c.senha = :senha", Cliente.class);
		query.setParameter("email", cliente.getEmail());
		query.setParameter("senha", cliente.getSenha());
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
