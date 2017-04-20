package br.com.bigdog.restcontroller;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.Pet;

@RestController
public class AdmController {
	// Atributos
	private GenericDAO<Cliente> clienteDAO;
	private GenericDAO<Pet> petDAO;

	// Construtor
	@Autowired
	public AdmController(GenericDAO<Cliente> clienteDAO, GenericDAO<Pet> petDAO) {
		this.clienteDAO = clienteDAO;
		this.petDAO = petDAO;
	}

	// Abrir Gerenciar Cliente
	@RequestMapping(value = "/gerenciarCliente", method = RequestMethod.GET)
	public ModelAndView gerenciarCliente(ModelAndView mav) {
		// Adicionando view
		mav.setViewName("administrador/gerenciar_cliente");

		// Adicionando lista
		mav.addObject("clientes", clienteDAO.listar());

		// Retornando
		return mav;
	}

	// Visualizar cliente (Endere�o, Pets, Compras e Agendamentos)
	@RequestMapping(value = "/visualizarCliente/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Cliente visualizarCliente(@PathVariable("id") Long id) {
		// Buscando cliente
		Cliente cliente = clienteDAO.listar(id);

		// Inicializando objetos(listas) de cliente
		Hibernate.initialize(cliente.getEnderecos());
		Hibernate.initialize(cliente.getPets());
		// Hibernate.initialize(cliente.getCompras());
		// Hibernate.initialize(cliente.getAgendamentos());

		// Retornando
		return cliente;
	}

	// Altera��es do administrador
	// Alterar Cliente (Nome, CPF, Email, Genero, Nascimento)
	// ...

	// Alterar Pet (Castrado, Peso e Observa��es)
	@RequestMapping(value = "/admPet/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterarPet(@PathVariable("id") Long id, @RequestBody Pet pet) {
		// Pet atual
		Pet petAtual = petDAO.listar(id);

		// Setando valores
		petAtual.setCastrado(pet.isCastrado());
		petAtual.setPeso(pet.getPeso());
		petAtual.setObservacoes(pet.getObservacoes());

		// Alterando...
		petDAO.alterar(petAtual);

		// Retornando
		return ResponseEntity.ok().build();
	}

	// Compra
	// ...

	// Agendamento
	// ...
}