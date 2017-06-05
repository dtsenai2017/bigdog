package br.com.bigdog.admcontroller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	// Listar
	@RequestMapping(value = "agendamento", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Agendamento> listarAgendamento() {
		// Retornando agendamentos referentes ao dia
		try {
			return agendamentoDAO.listar();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Listar (id)
	@RequestMapping(value = "agendamento/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Agendamento listar(@PathVariable("id") Long idAgendamento) {
		try {
			// Retornando
			return agendamentoDAO.listar(idAgendamento);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

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

	// Listar agendamentos de hoje
	@RequestMapping(value = "agendamentoHoje", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Agendamento> listarAgendamentoHoje() {
		// Atribuindo valor de data para pesquisa (Data de Hoje)
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String data = sdf.format(today);

		// Retornando agendamentos referentes ao dia
		try {
			return agendamentoDAO.listarAgendamentoHoje(data);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Excluir
	@RequestMapping(value = "agendamento/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idAgendamento) {
		try {
			// Excluindo
			agendamentoDAO.excluir(idAgendamento);

			// Retornando
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
