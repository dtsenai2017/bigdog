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

	// Cadastrar Pet
	@RequestMapping("cadastra-pet")
	public String cadastrarPet(Long id, Pet pet, HttpSession session) {
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

	@RequestMapping("deleta-endereco")
	public String deletarEndereco(Long id, HttpSession session, Long idCliente) {
		enderecoDAO.excluir(id);
		session.setAttribute("clienteLogado", clienteDAO.listar(idCliente));
		return "redirect:home-user";
	}

	@RequestMapping("deleta-pet")
	public String deletarPet(Long id, HttpSession session, Long idCliente) {
		petDAO.excluir(id);
		session.setAttribute("clienteLogado", clienteDAO.listar(idCliente));
		return "redirect:lista-pet";
	}

	@RequestMapping("home")
	public String indexLoja(Model model) {
		model.addAttribute("listaProdutosHome", produtoDAO.listarComLimite(0, 6));

		model.addAttribute("listaCategoria", categoriaDAO.listar());

		return "cliente/index";
	}

	@RequestMapping("entrar")
	public String loginLoja(Model model) {
		return "cliente/login";
	}

	@RequestMapping("loja/logar")
	public String clienteLogar(Cliente cliente, HttpSession session) {

		try {
			cliente = clienteDAO.logar(cliente);

			session.setAttribute("clienteLogado", cliente);

			System.out.println(cliente.toString());

			return "redirect:../home-user";

		} catch (NullPointerException e) {
			// TODO: handle exception
			e.printStackTrace();

			return "redirect:../entrar";
		}

	}

	@RequestMapping("indexCliente")
	public String homeCliente(HttpSession session, Long id) {
		session.setAttribute("clienteLogado", clienteDAO.listar(id));
		return "redirect:home-user";
	}

	@RequestMapping("novo-endereco")
	public String endereco(Model model, Long id) {
		if (id == null) {
			return "cliente/formEndereco";
		} else {
			model.addAttribute("alterarEndereco", enderecoDAO.listar(id));
			return "cliente/formEndereco";
		}

	}

	@RequestMapping("novo-pet")
	public String pets(Model model, Long id) {
		if (id == null) {
			return "cliente/formPet";
		} else {
			model.addAttribute("alterarPet", petDAO.listar(id));
			return "cliente/formPet";
		}

	}

	@RequestMapping("lista-pet")
	public String pets(HttpSession session) {
		return "cliente/listPets";
	}

	@RequestMapping("lista-dados")
	public String dadosCliente(HttpSession session) {
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		cliente.getContato().setCelular(clienteDAO.listar(cliente.getIdCliente()).getContato().getCelular());
		return "cliente/formPerfil";
	}

	@RequestMapping("logout")
	public String sair(HttpSession session) {
		session.invalidate();
		return "cliente/login";
	}

	@RequestMapping("home-user")
	public String clienteHome(HttpSession session) {
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");

		if (cliente != null) {
			return "cliente/indexCliente";
		} else {
			return "redirect:entrar";
		}
	}

	@RequestMapping("produto")
	public String produto(Model model, Long idProduto) {

		model.addAttribute("listaCategoria", categoriaDAO.listar());

		model.addAttribute("produto", produtoDAO.listar(idProduto));

		model.addAttribute("outrosProdutos", produtoDAO.listarComLimite(0, 10));
		return "cliente/produto";
	}

	@RequestMapping("faca-parte")
	public String cadastro(Model model) {
		return "cliente/formCadastro";
	}

	@RequestMapping("categoria")
	public String categoria(Model model) {
		model.addAttribute("listaCategoria", categoriaDAO.listar());
		model.addAttribute("listaProduto", produtoDAO.listar());
		return "cliente/listCategorias";
	}

	@RequestMapping("produtos")
	public String produtos(Model model, long idCategoria, long idSubCategoria) {
		model.addAttribute("listaCategoria", categoriaDAO.listar());
		model.addAttribute("cat", categoriaDAO.listar(idCategoria));
		model.addAttribute("listaProduto", produtoDAO.buscar(idSubCategoria));
		return "cliente/listProdutos";
	}

	@RequestMapping("search")
	public String search(Model model, String busca) {

		List<Produto> listaBusca = new ArrayList<Produto>();

		for (Produto produto : produtoDAO.listar()) {
			if (produto.getNome().toLowerCase().contains(busca.toLowerCase())
					|| produto.getDescricao().toLowerCase().contains(busca.toLowerCase())) {
				listaBusca.add(produto);
			}

		}

		model.addAttribute("buscaFeita", busca);

		model.addAttribute("listaBusca", listaBusca);

		return "cliente/search";
	}

}
