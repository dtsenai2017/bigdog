package br.com.bigdog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bigdog.dao.GenericDAO;
import br.com.bigdog.model.Fornecedor;

@Controller
public class FornecedorController {
	// Atributos
	private GenericDAO<Fornecedor> fornecedorDAO;

	// Construtor
	@Autowired
	public FornecedorController(GenericDAO<Fornecedor> fornecedorDAO) {
		this.fornecedorDAO = fornecedorDAO;
	}

	// Inserir
	@RequestMapping(value = "/inserirFornecedor")
	public void inserir(Fornecedor fornecedor) {
		// Verifica se fornecedor já é cadastrado
		if (fornecedor.getIdFornecedor() == null) {
			// Inserindo novo fornecedor
			fornecedorDAO.inserir(fornecedor);
		} else {
			// Alterando fornecedor existente
			fornecedorDAO.alterar(fornecedor);
		}
	}

	// Listar
	@RequestMapping(value = "/listarFornecedores")
	public List<Fornecedor> listar() {
		return fornecedorDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "/listarFornecedor")
	public Fornecedor listar(Long id) {
		return fornecedorDAO.listar(id);
	}

	// Excluir
	@RequestMapping(value = "/excluirFornecedor")
	public void excluir(Long id) {
		fornecedorDAO.excluir(id);
	}
}
