package br.com.bigdog.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.bigdog.model.Agendamento;
import br.com.bigdog.value.TipoServico;

@Repository
public class AgendamentosVerificarDAO {

	// Gerenciador de Entidades
	@PersistenceContext
	private EntityManager manager;

	public List<Agendamento> listarAgenda(Date dataAntes, Date dataDepois, int tipoServicoI) {

		TipoServico tipoServicoEnum = verificarTipoServico(tipoServicoI);

		TypedQuery<Agendamento> query = manager.createQuery(
				"SELECT a FROM Agendamento a WHERE a.dataAgendada BETWEEN :dataAntes AND :dataDepois AND a.servico.tipoServico = :tipoServico",
				Agendamento.class);

		query.setParameter("dataAntes", dataAntes);
		query.setParameter("dataDepois", dataDepois);
		query.setParameter("tipoServico", tipoServicoEnum);
		return query.getResultList();
	}

	private TipoServico verificarTipoServico(int tipoServicoI) {
		// TODO Auto-generated method stub
		TipoServico tipoServicoEnum;
		if (tipoServicoI == 1) {
			tipoServicoEnum = TipoServico.Veterinario;
		} else {
			tipoServicoEnum = TipoServico.Estetica;
		}
		return tipoServicoEnum;
	}

}
