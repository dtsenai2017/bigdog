package br.com.bigdog.admdao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.EnderecoCliente;

@Repository
public class EnderecoClienteDAO implements GenericDAO<EnderecoCliente> {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(EnderecoCliente endereco) {
		manager.persist(endereco);
	}

	// Listar
	public List<EnderecoCliente> listar() {
		TypedQuery<EnderecoCliente> query = manager.createQuery("SELECT e FROM Endereco e", EnderecoCliente.class);
		return query.getResultList();
	}

	// Listar (id)
	public EnderecoCliente listar(Long id) {
		return manager.find(EnderecoCliente.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(EnderecoCliente endereco) {
		manager.merge(endereco);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		EnderecoCliente endereco = listar(id);
		manager.remove(endereco);
	}
}
