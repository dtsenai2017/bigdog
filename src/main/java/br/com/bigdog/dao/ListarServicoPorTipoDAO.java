package br.com.bigdog.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.bigdog.model.Servico;
import br.com.bigdog.value.StatusServico;
import br.com.bigdog.value.TipoServico;

@Repository
public class ListarServicoPorTipoDAO {
	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	public List<Servico> listarServicoPorTipoDAO(TipoServico tipoServico) {
		// Query
		TypedQuery<Servico> query = manager.createQuery(
				"SELECT s FROM Servico s WHERE s.tipoServico = :tipoServico AND s.status = :status", Servico.class);

		// Atribuindo parâmetros
		query.setParameter("tipoServico", tipoServico);
		query.setParameter("status", StatusServico.Ativo);

		try {
			return query.getResultList();
		} catch (Exception e) {
			System.err.println(e);
			return null;
		}
	}

}
