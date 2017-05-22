package br.com.bigdog.admcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.AgendamentoDAO;
import br.com.bigdog.model.Agendamento;

@RestController
@RequestMapping(value = "adm/")
public class AdmAgendamentoController {
	// Atributos
	private AgendamentoDAO agendamentoDAO;

	// Construtor
	@Autowired
	public AdmAgendamentoController(AgendamentoDAO agendamentoDAO) {
		this.agendamentoDAO = agendamentoDAO;
	}

	// Requisições
	// Listar (idCliente)
	@RequestMapping(value = "agendamentoCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Agendamento> listarAgendamento(@PathVariable("id") Long idCliente) {
		try {
			// Retornando
			return agendamentoDAO.listarAgendamentoCliente(idCliente);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
