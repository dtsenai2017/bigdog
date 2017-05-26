package br.com.bigdog.clientecontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.CategoriaDAO;
import br.com.bigdog.dao.ClienteDAO;
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
	private EnderecoClienteDAO enderecoDAO;
	private PetDAO petDAO;

	// Construtor
	@Autowired
	public LinkController(ProdutoDAO produtoDAO, CategoriaDAO categoriaDAO, ClienteDAO clienteDAO,
			EnderecoClienteDAO enderecoDAO, PetDAO petDAO) {
		this.produtoDAO = produtoDAO;
		this.categoriaDAO = categoriaDAO;
		this.clienteDAO = clienteDAO;
		this.enderecoDAO = enderecoDAO;
		this.petDAO = petDAO;
	}

	// Cadastrar endereço
	@RequestMapping("cadastra-endereco")
	public String cadastrarEnderecos(Long id, EnderecoCliente enderecoCliente, HttpSession session) {
		if (enderecoCliente.getIdEnderecoCliente() == null) {
			Cliente cliente = new Cliente();
			cliente.setIdCliente(id);
			cliente = clienteDAO.listar(cliente.getIdCliente());
			List<EnderecoCliente> enderecos = cliente.getEnderecos();
			enderecos.add(enderecoCliente);
			cliente.setEnderecos(enderecos);
			clienteDAO.alterar(cliente);
			session.setAttribute("clienteLogado", clienteDAO.listar(id));
			return "redirect:home-user";
		} else {
			enderecoDAO.alterar(enderecoCliente);
			session.setAttribute("clienteLogado", clienteDAO.listar(id));
			return "redirect:home-user";
		}
	}

	// Cadastrar ou altera pet
	@RequestMapping("cadastra-pet")
	public String cadastrarPet(Long id, Pet pet, HttpSession session) {
		// Verifica tipo de operação
		if (pet.getIdPet() == null) {
			Cliente cliente = new Cliente();
			cliente.setIdCliente(id);
			cliente = clienteDAO.listar(cliente.getIdCliente());
			List<Pet> pets = cliente.getPets();
			pets.add(pet);
			cliente.setPets(pets);
			clienteDAO.alterar(cliente);
			session.setAttribute("clienteLogado", clienteDAO.listar(id));
			return "redirect:lista-pet";
		} else {
			petDAO.alterar(pet);
			session.setAttribute("clienteLogado", clienteDAO.listar(id));
			return "redirect:lista-pet";
		}
	}

	// Deleta Endereço de Cliente
	@RequestMapping("deleta-endereco")
	public String deletarEndereco(Long id, HttpSession session, Long idCliente) {
		enderecoDAO.excluir(id);
		session.setAttribute("clienteLogado", clienteDAO.listar(idCliente));

		// Redireciona para ...
		return "redirect:home-user";
	}

	// Deleta pet de Cliente
	@RequestMapping("deleta-pet")
	public String deletarPet(Long id, HttpSession session, Long idCliente) {
		petDAO.excluir(id);
		session.setAttribute("clienteLogado", clienteDAO.listar(idCliente));
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

			// Redirecionando
			return "redirect:../home-user";
		} catch (NullPointerException e) {
			// TODO: handle exception
			e.printStackTrace();

			// Recirecionando
			return "redirect:../entrar";
		}
	}

	// Index cliente
	@RequestMapping("indexCliente")
	public String homeCliente(HttpSession session, Long id) {
		session.setAttribute("clienteLogado", clienteDAO.listar(id));
		return "redirect:home-user";
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
		// Ir para...
		return "cliente/listPets";
	}

	// Formulário de inserção ou alteração
	@RequestMapping("novo-pet")
	public String pets(Model model, Long id) {
		// Verifica tipo de operação (Inserção ou alteração)
		if (id == null) {
			return "cliente/formPet";
		} else {
			model.addAttribute("alterarPet", petDAO.listar(id));
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
		session.invalidate();
		return "cliente/login";
	}

	// Index Cliente
	@RequestMapping("home-user")
	public String clienteHome(HttpSession session) {
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		if (cliente != null) {
			return "cliente/indexCliente";
		} else {
			return "redirect:entrar";
		}
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

		// Ir para...
		return "cliente/produto";
	}

	// Formulário de cadastro de cliente
	@RequestMapping("faca-parte")
	public String cadastro(Model model) {
		return "cliente/formCadastro";
	}

	// Ir para página de categoria e produtos da loja
	@RequestMapping("categoria")
	public String categoria(Model model) {
		// Adicionando lista de categoria e produto para view
		model.addAttribute("listaCategoria", categoriaDAO.listar());
		model.addAttribute("listaProduto", produtoDAO.listar());

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
		for (Produto produto : produtoDAO.listar()) {
			if (produto.getNome().toLowerCase().contains(busca.toLowerCase())
					|| produto.getDescricao().toLowerCase().contains(busca.toLowerCase())) {
				listaBusca.add(produto);
			}
		}

		// Texto de busca
		model.addAttribute("buscaFeita", busca);

		// Lista de produtos encontrados
		model.addAttribute("listaBusca", listaBusca);

		// Ir para...
		return "cliente/search";
	}
}
