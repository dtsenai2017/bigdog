package br.com.bigdog.admcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.bigdog.admdao.GenericDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Servico;
import br.com.bigdog.value.TipoServico;

@RestController
public class AdmController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;
	private GenericDAO<Servico> servicoDAO;

	// Construtor
	@Autowired
	public AdmController(GenericDAO<Cliente> clienteDAO, GenericDAO<Servico> serviceDAO) {
		this.clienteDAO = clienteDAO;
		this.servicoDAO = serviceDAO;
	}

	// Requisições
	// Gerenciar Cliente
	// Ir para Gerenciar Cliente
	@RequestMapping(value = "gerenciarCliente", method = RequestMethod.GET)
	public ModelAndView gerenciarCliente(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar-cliente");

		// Adicionando lista
		mav.addObject("clientes", clienteDAO.listar());

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
