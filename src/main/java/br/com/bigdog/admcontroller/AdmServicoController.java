package br.com.bigdog.admcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Servico;

@RestController
@RequestMapping(value = "adm/")
public class AdmServicoController {
	// Atributos
	private GenericDAO<Servico> servicoDAO;

	// Construtor
	@Autowired
	public AdmServicoController(GenericDAO<Servico> servicoDAO) {
		this.servicoDAO = servicoDAO;
	}

	// Requisições
	// Inserir serviço
	@RequestMapping(value = "servico", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserir(@RequestBody Servico servico) {
		// Inserindo
		servicoDAO.inserir(servico);

		// Retornando
		return ResponseEntity.ok().build();
	}

	// Listar
	@RequestMapping(value = "servico", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Servico> listar() {
		// Retornando
		return servicoDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "servico/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Servico listar(@PathVariable("id") Long idServico) {
		// Retornando
		return servicoDAO.listar(idServico);
	}

	// Alterar
	@RequestMapping(value = "servico/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long idServico, @RequestBody Servico servico) {
		// Serviço atual
		Servico servicoAtual = servicoDAO.listar(idServico);

		// Atribuindo valores
		servicoAtual.setNome(servico.getNome());
		servicoAtual.setTipoServico(servico.getTipoServico());
		servicoAtual.setTempoEstimado(servico.getTempoEstimado());
		servicoAtual.setValor(servico.getValor());
		servicoAtual.setObservacao(servico.getObservacao());

		// Alterando
		servicoDAO.alterar(servicoAtual);

		// Retornando
		return ResponseEntity.ok().build();
	}

	// Excluir
	@RequestMapping(value = "servico/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idServico) {
		// Excluindo
		servicoDAO.excluir(idServico);

		// Retornando
		return ResponseEntity.ok().build();
	}
}
