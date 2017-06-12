package br.com.bigdog.admcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.bigdog.dao.AgendamentoDAO;
import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.dao.DAOJdbc;
import br.com.bigdog.dao.DadosGeraisDAO;
import br.com.bigdog.dao.ServicoDAO;
import br.com.bigdog.model.DadosGerais;
import br.com.bigdog.model.Servico;
import br.com.bigdog.value.TipoServico;

@RestController
@RequestMapping(value = "adm/")
public class AdmController {
	// Atributos
	private DadosGeraisDAO dadosGeraisDAO;
	private ClienteDAO clienteDAO;
	private ServicoDAO servicoDAO;
	private AgendamentoDAO agendamentoDAO;
	private DAOJdbc daoJDBC;

	// Construtor
	@Autowired
	public AdmController(DadosGeraisDAO dadosGeraisDAO, ClienteDAO clienteDAO, ServicoDAO servicoDAO,
			AgendamentoDAO agendamentoDAO, DAOJdbc daoJDBC) {
		this.dadosGeraisDAO = dadosGeraisDAO;
		this.clienteDAO = clienteDAO;
		this.servicoDAO = servicoDAO;
		this.agendamentoDAO = agendamentoDAO;
		this.daoJDBC = daoJDBC;
	}

	// Index Administrador
	@RequestMapping(value = "indexAdministrador")
	public ModelAndView indexAdministrador(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/index-administrador");

		// Retornando
		return mav;
	}

	// Requisições
	// Dados gerais para Dashboard
	@RequestMapping(value = "dadosGerais", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public DadosGerais dadosGerais() {
		// Atributo
		DadosGerais dadosGerais = new DadosGerais();

		// Atribuindo informações gerais
		dadosGerais.setQtdCliente(dadosGeraisDAO.countCliente());
		dadosGerais.setQtdPet(dadosGeraisDAO.countPet());
		dadosGerais.setQtdEnderecoCliente(dadosGeraisDAO.countEnderecoCliente());
		dadosGerais.setQtdFornecedor(dadosGeraisDAO.countFornecedor());
		dadosGerais.setQtdEnderecoFornecedor(dadosGeraisDAO.countEnderecoFornecedor());
		dadosGerais.setQtdCategoria(dadosGeraisDAO.countCategoria());
		dadosGerais.setQtdSubCategoria(dadosGeraisDAO.countSubCategoria());
		dadosGerais.setQtdProduto(dadosGeraisDAO.countProduto());
		dadosGerais.setQtdCompra(dadosGeraisDAO.countCompra());
		dadosGerais.setQtdServico(dadosGeraisDAO.countServico());
		dadosGerais.setQtdAgendamento(dadosGeraisDAO.countAgendamento());
		dadosGerais.setMesCompra(daoJDBC.mesCompra());

		// Atribuindo informações de últimas atualizações(Últimos 10 cadastros
		// de clientes e últimas 10 compras realizadas)
		dadosGerais.setUltimosClientes(dadosGeraisDAO.ultimosClientes());
		dadosGerais.setUltimasCompras(dadosGeraisDAO.ultimasCompras());

		// Retornando...
		return dadosGerais;
	}

	// Gerenciar Cliente
	// Ir para Gerenciar Cliente
	@RequestMapping(value = "gerenciarCliente", method = RequestMethod.GET)
	public ModelAndView gerenciarCliente(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar-cliente");

		// Adicionando lista
		mav.addObject("clientes", clienteDAO.listarOrdenado());

		// Retornando
		return mav;
	}

	// Gerenciar Loja
	// Ir para Gerenciar Loja
	@RequestMapping(value = "gerenciarLoja", method = RequestMethod.GET)
	public ModelAndView gerenciarLoja(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar-loja");

		// Retornando
		return mav;
	}

	// Gerenciar Agendamentos
	// Ir para Gerenciar Agendamentos
	@RequestMapping(value = "gerenciarAgenda", method = RequestMethod.GET)
	public ModelAndView agendaAdm(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar-agenda");

		// Adicionando lista
		mav.addObject("agendamentos", agendamentoDAO.listar());

		// Retornando
		return mav;
	}

	// Serviço
	// Ir para Gerenciar Serviço
	@RequestMapping(value = "gerenciarServico", method = RequestMethod.GET)
	public ModelAndView gerenciarServico(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar-servico");

		// Lista de serviços
		List<Servico> servicoEstetica = new ArrayList<Servico>();
		List<Servico> servicoVeterinario = new ArrayList<Servico>();

		// Atribuindo valores para listas
		for (Servico servico : servicoDAO.listar()) {
			// Verifica tipo de servico e atribui para lista
			if (servico.getTipoServico().equals(TipoServico.Estetica)) {
				servicoEstetica.add(servico);
			} else {
				servicoVeterinario.add(servico);
			}
		}

		// Adicionando lista de serviços de estética
		mav.addObject("servicoEstetica", servicoEstetica);

		// Adicionando lista de serviços veterinários
		mav.addObject("servicoVeterinario", servicoVeterinario);

		// Retornando
		return mav;
	}
}
