package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.bigdog.model.Servico;
import br.com.bigdog.value.TipoServico;

@Repository
public class ListarServicoPorTipoDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	public List<Servico> listarServicoPorTipoDAO(TipoServico tipoServico) {
		System.out.println(tipoServico);

		TypedQuery<Servico> query = manager.createQuery("SELECT s FROM Servico s WHERE s.tipoServico = :tipoServico",
				Servico.class);
		query.setParameter("tipoServico", tipoServico);
		return query.getResultList();
	}

}
