package br.com.bigdog.clientecontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.AgendamentoDAO;
import br.com.bigdog.dao.CategoriaDAO;
import br.com.bigdog.dao.ClienteDAO;
import br.com.bigdog.dao.CompraDAO;
import br.com.bigdog.dao.EnderecoClienteDAO;
import br.com.bigdog.dao.PetDAO;
import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.model.Cliente;
import br.com.bigdog.model.EnderecoCliente;
import br.com.bigdog.model.Pet;
import br.com.bigdog.model.Produto;

@Controller
public class LinkController {
	// Atributos
	private ProdutoDAO produtoDAO;
	private CategoriaDAO categoriaDAO;
	private ClienteDAO clienteDAO;
	private CompraDAO compraDAO;
	private EnderecoClienteDAO enderecoDAO;
	private PetDAO petDAO;
	private AgendamentoDAO agendamentoDAO;

	// Construtor
	@Autowired
	public LinkController(ProdutoDAO produtoDAO, CategoriaDAO categoriaDAO, ClienteDAO clienteDAO, CompraDAO compraDAO,
			EnderecoClienteDAO enderecoDAO, PetDAO petDAO, AgendamentoDAO agendamentoDAO) {
		this.produtoDAO = produtoDAO;
		this.categoriaDAO = categoriaDAO;
		this.clienteDAO = clienteDAO;
		this.enderecoDAO = enderecoDAO;
		this.petDAO = petDAO;
		this.compraDAO = compraDAO;
		this.agendamentoDAO = agendamentoDAO;
	}

	// Sobre Nós
	@RequestMapping(value = "sobreNos")
	public String sobreNos() {
		// Retornando..
		return "cliente/sobre-nos";
	}

	// Esqueci Senha
	@RequestMapping("esqueciSenha")
	public String esqueciSenha(Model model) {
		// Retornando...
		return "cliente/recuperarSenha";
	}

	// Cadastrar endereço
	@RequestMapping("cadastra-endereco")
	public String cadastrarEnderecos(EnderecoCliente enderecoCliente, HttpSession session) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica se endereço é existente
		if (enderecoCliente.getIdEnderecoCliente() == null) {
			// Lista de endereços
			List<EnderecoCliente> enderecos = cliente.getEnderecos();

			// Adicionando endereço em lista de endereço
			enderecos.add(enderecoCliente);

			// Adicionando endereço em cliente
			cliente.setEnderecos(enderecos);

			// Alterando cliente
			clienteDAO.alterar(cliente);

			// Atualizando session
			session.setAttribute("clienteLogado", clienteDAO.listar(cliente.getIdCliente()));

			// Retornando...
			return "redirect:home-user";
		} else {
			// Efetua alteração em endereço
			enderecoDAO.alterar(enderecoCliente);

			// Atualizando session
			session.setAttribute("clienteLogado", clienteDAO.listar(cliente.getIdCliente()));

			// Retornando...
			return "redirect:home-user";
		}
	}

	// Verificar input em branco de pet cadastrado ou alterado
	public Pet verificarCamposPet(Pet pet) {
		// Verifica campos...
		// Carteira de vacina
		if (pet.getCarteiraVacina().equals("")) {
			pet.setCarteiraVacina(null);
		}

		// Pedigree
		if (pet.getPedigree().equals("")) {
			pet.setPedigree(null);
		}

		// RGA
		if (pet.getRga().equals("")) {
			pet.setRga(null);
		}

		// Retornando...
		return pet;
	}

	// Cadastrar ou altera pet
	@RequestMapping("cadastra-pet")
	public String cadastrarPet(Pet pet, HttpSession session) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica se endereço é existente
		if (pet.getIdPet() == null) {
			// Verifica campos
			pet = verificarCamposPet(pet);

			// Listando pets
			List<Pet> pets = cliente.getPets();

			// Adicionando pet
			pets.add(pet);

			// Adicionando pet em lista de pet do cliente
			cliente.setPets(pets);

			// Alterando...
			clienteDAO.alterar(cliente);

			// Retornando...
			return "redirect:lista-pet";
		} else {
			// Verificar campos
			pet = verificarCamposPet(pet);

			// Altera pet
			petDAO.alterar(pet);

			session.setAttribute("clienteLogado", clienteDAO.listar(cliente.getIdCliente()));

			// Retornando...
			return "redirect:lista-pet";
		}
	}

	// Deleta Endereço de Cliente
	@RequestMapping("deleta-endereco")
	public String deletarEndereco(Long id, HttpSession session) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Excluindo endereço
		enderecoDAO.excluir(id);

		// Atualizando cliente logado
		session.setAttribute("clienteLogado", clienteDAO.listar(cliente.getIdCliente()));

		// Redireciona para ...
		return "redirect:home-user";
	}

	// Deleta pet de Cliente
	@RequestMapping("deleta-pet")
	public String deletarPet(Long idPet, HttpSession session) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Excluindo...
		try {
			petDAO.excluir(idPet);
		} catch (Exception e) {
			// ...
		}

		// Listando cliente logado
		session.setAttribute("clienteLogado", clienteDAO.listar(cliente.getIdCliente()));

		// Retornando...
		return "redirect:lista-pet";
	}

	// Index de cliente logado
	@RequestMapping("home")
	public String indexLoja(Model model) {
		// Atribuindo lista de produto e categoria para view
		model.addAttribute("listaProdutosHome", produtoDAO.listarComLimite(0, 6));
		model.addAttribute("listaCategoria", categoriaDAO.listar());

		// Ir para view...
		return "cliente/index";
	}

	// Formulário de login
	@RequestMapping("entrar")
	public String loginLoja(Model model) {
		// Retornando...
		return "cliente/login";
	}

	// Logar
	@RequestMapping("loja/logar")
	public String clienteLogar(Cliente cliente, HttpSession session) {
		try {
			// Logando...
			cliente = clienteDAO.logar(cliente);

			// Adicionando sessão
			session.setAttribute("clienteLogado", cliente);

			// Retornando...
			return "redirect:../home-user";
		} catch (NullPointerException e) {
			e.printStackTrace();

			// Retornando...
			return "redirect:../entrar";
		}
	}

	// Index cliente
	@RequestMapping("indexCliente")
	public String homeCliente(HttpSession session, Long id) {
		// Verifica cliente
		if (clienteDAO.listar(id) != null) {
			session.setAttribute("clienteLogado", clienteDAO.listar(id));

			return "redirect:home-user";
		} else {
			return "redirect:entrar";
		}
	}

	// Formulário de inserção ou alteração
	@RequestMapping("novo-endereco")
	public String endereco(Model model, Long id) {
		// Verifica tipo de operação
		if (id == null) {
			return "cliente/formEndereco";
		} else {
			model.addAttribute("alterarEndereco", enderecoDAO.listar(id));
			return "cliente/formEndereco";
		}
	}

	// Lista de pets de cliente
	@RequestMapping("lista-pet")
	public String pets(HttpSession session) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Atualizando cliente logado
		session.setAttribute("clienteLogado", clienteDAO.listar(cliente.getIdCliente()));

		// Retornando...
		return "cliente/listPets";
	}

	// Formulário de inserção ou alteração
	@RequestMapping("novo-pet")
	public String pets(Model model, Long idPet) {
		// Verifica tipo de operação (Inserção ou alteração)
		if (idPet == null) {
			// Retornando...
			return "cliente/formPet";
		} else {
			model.addAttribute("alterarPet", petDAO.listar(idPet));

			// Retornando...
			return "cliente/formPet";
		}
	}

	// Listar dados do cliente
	@RequestMapping("lista-dados")
	public String dadosCliente(HttpSession session) {
		// Recebendo cliente de sessão
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		cliente.getContato().setCelular(clienteDAO.listar(cliente.getIdCliente()).getContato().getCelular());

		// Ir para...
		return "cliente/formPerfil";
	}

	// Deslogar
	@RequestMapping("logout")
	public String sair(HttpSession session) {
		// Limpando sessão
		session.invalidate();

		// Retornando...
		return "cliente/login";
	}

	// Index Cliente
	@RequestMapping("home-user")
	public String clienteHome(HttpSession session) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica cliente
		if (cliente != null) {
			// Retornando...
			return "cliente/indexCliente";
		} else {
			// Retornando...
			return "redirect:entrar";
		}
	}

	// Lista de pedidos
	@RequestMapping("listPedidos")
	public String pedidos(HttpSession session, Model model) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Pedidos
		model.addAttribute("listarPedidos", compraDAO.listarCompraCliente(cliente.getIdCliente()));

		// Retornando...
		return "cliente/listPedidos";
	}

	// Lista de agendamentos
	@RequestMapping("listAgendamentos")
	public String agendamentos(HttpSession session, Model model) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Agendamentos
		model.addAttribute("listarAgendamentos", agendamentoDAO.listarAgendamentoCliente(cliente.getIdCliente()));

		// Retornando...
		return "cliente/listAgendamentos";
	}

	// Lista de agendamento
	@RequestMapping("novo-agendamento")
	public String agendamento(HttpSession session, Model model) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		// Verifica cliente
		if (cliente == null) {
			// Retornando..
			return "cliente/login";
		} else {
			// Verifica se há pet
			if (cliente.getPets().isEmpty()) {
				model.addAttribute("existePet", false);
			} else {
				model.addAttribute("existePet", true);
			}

			// Retornando...
			return "cliente/formAgendamento";
		}
	}

	// Cancelar Agendamento
	@RequestMapping("cancela-agendamento")
	public String cancelarAgendamento(Long idAgendamento, HttpSession session, Model model) {
		// Cliente logado
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		try {
			// Excluindo
			agendamentoDAO.excluir(idAgendamento);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Agendamentos
		model.addAttribute("listarAgendamentos", agendamentoDAO.listarAgendamentoCliente(cliente.getIdCliente()));

		// Retornando
		return "cliente/listAgendamentos";
	}

	// Adicionar produto no carrinho
	@RequestMapping("produto")
	public String produto(Model model, Long idProduto) {
		// Lista de categorias
		model.addAttribute("listaCategoria", categoriaDAO.listar());

		// Lista de produtos
		model.addAttribute("produto", produtoDAO.listar(idProduto));

		// Lista de produtos com limite
		model.addAttribute("outrosProdutos", produtoDAO.listarComLimite(0, 10));

		// Retornando...
		return "cliente/produto";
	}

	// Formulário de cadastro de cliente
	@RequestMapping("faca-parte")
	public String cadastro(Model model) {
		// Retornando...
		return "cliente/formCadastro";
	}

	// Ir para página de categoria e produtos da loja
	@RequestMapping("categoria")
	public String categoria(Model model) {
		// Adicionando lista de categoria e produto para view
		model.addAttribute("listaCategoria", categoriaDAO.listar());
		model.addAttribute("listaProduto", produtoDAO.listarDisp());

		// Ir para...
		return "cliente/listCategorias";
	}

	// Listagem de produtos
	@RequestMapping("produtos")
	public String produtos(Model model, long idCategoria, long idSubCategoria) {
		model.addAttribute("listaCategoria", categoriaDAO.listar());
		model.addAttribute("cat", categoriaDAO.listar(idCategoria));
		model.addAttribute("listaProduto", produtoDAO.buscar(idSubCategoria));
		return "cliente/listProdutos";
	}

	// Pesquisa de produto
	@RequestMapping("search")
	public String search(Model model, String busca) {
		// Lista de produtos encontrados
		List<Produto> listaBusca = new ArrayList<Produto>();

		// Adicionando produtos encontrados na lista
		for (Produto produto : produtoDAO.listarDisp()) {
			if (produto.getNome().toLowerCase().contains(busca.toLowerCase())
					|| produto.getDescricao().toLowerCase().contains(busca.toLowerCase())) {
				listaBusca.add(produto);
			}
		}

		// Texto de busca
		model.addAttribute("buscaFeita", busca);

		// Lista de produtos encontrados
		model.addAttribute("listaBusca", listaBusca);

		// Retornando...
		return "cliente/search";
	}
}
