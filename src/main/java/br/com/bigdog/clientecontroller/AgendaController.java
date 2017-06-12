package br.com.bigdog.clientecontroller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.AgendamentoDAO;
import br.com.bigdog.dao.AgendamentosVerificarDAO;
import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.dao.ListarServicoPorTipoDAO;
import br.com.bigdog.model.Agendamento;
import br.com.bigdog.model.Servico;
import br.com.bigdog.value.TipoServico;

@RestController
public class AgendaController {
	// Atributos
	private ListarServicoPorTipoDAO listarServicoPorTipoDAO;
	private AgendamentosVerificarDAO agendamentosVerificarDAO;
	private AgendamentoDAO agendamentoDAO;
	private GenericDAO<Servico> servicoDAO;
	DateFormat formatterDate;

	// Construtor
	@Autowired
	public AgendaController(ListarServicoPorTipoDAO listarServicoPorTipoDAO,
			AgendamentosVerificarDAO agendamentosVerificarDAO, AgendamentoDAO agendamentoDAO,
			GenericDAO<Servico> servicoDAO) {
		this.listarServicoPorTipoDAO = listarServicoPorTipoDAO;
		this.agendamentoDAO = agendamentoDAO;
		this.agendamentosVerificarDAO = agendamentosVerificarDAO;
		this.servicoDAO = servicoDAO;
		formatterDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}

	// Listar serviço
	@RequestMapping(value = "rest/dinamic/servico/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Servico listarId(@PathVariable("id") long id) {
		return servicoDAO.listar(id);
	}

	// Listar Serviço por tipo
	@RequestMapping(value = "rest/dinamic/agendar/servico/{valor}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Servico> listarServicoPorTipo(@PathVariable("valor") int valor) {
		// 1 - para clinica
		// 2 - para banho e tosa
		TipoServico tipoServico;

		// Verifica tipo de serviço
		if (valor == 1) {
			tipoServico = TipoServico.Veterinario;
		} else {
			tipoServico = TipoServico.Estetica;
		}

		// Retornando...
		return listarServicoPorTipoDAO.listarServicoPorTipoDAO(tipoServico);
	}

	// Listar serviço por tipo
	@RequestMapping(value = "rest/agendar/{date}/{valor}/{idServico}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<String> listarServicoPorTipo(@PathVariable("date") String sDate, @PathVariable("valor") int valor,
			@PathVariable long idServico) throws ParseException {
		// 9h até 18h, o sistema foi restrigindo para a minimo agendamento de 30
		// min
		// em dias de semana normais, são 18 campos de reserva tanto para a
		// estética
		// como para o veterinario

		List<String> datasDispo = new ArrayList<String>();
		Date dateVerificada = new Date(formatterDate.parse(sDate).getTime());
		Calendar c = Calendar.getInstance();
		Date dataAntes = new Date();
		Date dataDepois = new Date();
		System.err.println(idServico);
		Servico servico = servicoDAO.listar(idServico);

		// Setando dados para busca no banco
		c.setTime(dateVerificada);
		dataAntes = c.getTime();
		c.add(Calendar.HOUR, 9);
		dataDepois = c.getTime();
		c = null;
		c = Calendar.getInstance();
		c.setTime(dateVerificada);
		List<Agendamento> agendamentos = agendamentosVerificarDAO.listarAgenda(dataAntes, dataDepois, valor);

		for (int i = 0; i < 19; i++) {
			datasDispo.add(formatterDate.format(c.getTime()));
			c.add(Calendar.MINUTE, 30);
		}

		datasDispo = removerIndexOcupados(datasDispo, agendamentos, servico);

		return datasDispo;
	}

	// Remover agendamentos já ocupados
	private List<String> removerIndexOcupados(List<String> datasDipo, List<Agendamento> agendamentos,
			Servico servicoParaAgendar) throws ParseException {
		for (Agendamento agendamento : agendamentos) {
			for (int i = 0; i < datasDipo.size(); i++) {
				String dataPercorrida = datasDipo.get(i);

				if (formatterDate.format(agendamento.getDataAgendada()).equals(dataPercorrida)) {
					Calendar c1 = Calendar.getInstance();
					c1.setTime(agendamento.getServico().getTempoEstimado());
					if (c1.get(Calendar.MINUTE) > 30 || c1.get(Calendar.HOUR) == 1) {
						datasDipo.remove(i + 1);
					}
					datasDipo.remove(i);
					c1.setTime(servicoParaAgendar.getTempoEstimado());
					if (i > 0) {
						if (c1.get(Calendar.HOUR) > 1 || c1.get(Calendar.HOUR) == 1) {
							datasDipo.remove(i - 1);
						}
					}
				}
			}
		}

		return datasDipo;
	}

	// Agendar
	@RequestMapping(value = "rest/agendar/{sDate}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Agendamento> agendar(@RequestBody Agendamento agendamento, @PathVariable String sDate)
			throws ParseException {

		Date date = formatterDate.parse(sDate);
		agendamento.setDataAgendada(date);

		agendamentoDAO.inserir(agendamento);

		return ResponseEntity.ok(agendamento);
	}
}
