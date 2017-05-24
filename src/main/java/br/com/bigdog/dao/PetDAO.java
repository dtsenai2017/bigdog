package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bigdog.model.Pet;

@Repository
public class PetDAO {
	@PersistenceContext
	private EntityManager manager;

	// Inserir
	@Transactional
	public void inserir(Pet pet) {
		manager.persist(pet);
	}

	// Listar
	public List<Pet> listar() {
		TypedQuery<Pet> query = manager.createQuery("SELECT p FROM Pet p", Pet.class);
		return query.getResultList();
	}

	// Listar (id)
	public Pet listar(Long id) {
		return manager.find(Pet.class, id);
	}

	// Alterar
	@Transactional
	public void alterar(Pet pet) {
		manager.merge(pet);
	}

	// Excluir
	@Transactional
	public void excluir(Long id) {
		Pet pet = listar(id);
		manager.remove(pet);
	}

	// Listar com limite
	public List<Pet> listarComLimite(long primeiroIndex, long ultimoIndex) {
		// TODO Auto-generated method stub
		return null;
	}
}
