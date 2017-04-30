package br.com.bigdog.admcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Cliente;

@RestController
public class AdmController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;

	// Construtor
	@Autowired
	public AdmController(GenericDAO<Cliente> clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	// Requisições
	// Dashboard
	// ...
	// -------------------- Dashboard

	// Gerenciar Cliente
	// Ir para Gerenciar Cliente
	@RequestMapping(value = "gerenciarCliente", method = RequestMethod.GET)
	public ModelAndView gerenciarCliente(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar_cliente");

		// Adicionando lista
		mav.addObject("clientes", clienteDAO.listar());

		// Retornando
		return mav;
	}
	// -------------------- Gerenciar Cliente

	// Gerenciar Loja
	// Ir para Gerenciar Loja
	@RequestMapping(value = "gerenciarLoja", method = RequestMethod.GET)
	public ModelAndView gerenciarLoja(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar_loja");

		// Retornando
		return mav;
	}
	// -------------------- Gerenciar Loja

	// Gerenciar Agendamentos
	// ...
	// -------------------- Gerenciar Agendamentos

	// Agendamento
	// ...
	// -------------------- Agendamento
}
