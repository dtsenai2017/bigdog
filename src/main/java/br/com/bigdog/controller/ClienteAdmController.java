package br.com.bigdog.controller;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Cliente;

@Controller
public class ClienteAdmController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;

	// Construtor
	@Autowired
	public ClienteAdmController(GenericDAO<Cliente> clienteDAO) {
		this.clienteDAO = clienteDAO;
	}

	// REQUISIÇÔES
	// Abrir Gerenciar Cliente
	@RequestMapping(value = "gerenciarCliente")
	public String gerenciarCliente(Model model) {
		// Adicionando lista
		model.addAttribute("clientes", clienteDAO.listar());

		// Retornando
		return "administrador/gerenciar_cliente";
	}

	// Visualizar cliente
	@RequestMapping(value = "visualizarCliente")
	public Cliente visualizarCliente(Long idCliente) {
		// Buscando cliente
		Cliente cliente = clienteDAO.listar(idCliente);

		// Inicializando objetos(listas) de cliente
		Hibernate.initialize(cliente.getEnderecos());
		Hibernate.initialize(cliente.getPets());

		// Retornando
		return cliente;
	}
}
