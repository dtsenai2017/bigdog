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
import br.com.bigdog.model.Produto;

@RestController
@RequestMapping("adm/")
public class AdmProdutoController {
	// Atributos
	private GenericDAO<Produto> produtoDAO;

	// Construtor
	@Autowired
	public AdmProdutoController(GenericDAO<Produto> produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	// Inserir ou alterar produto
	@RequestMapping(value = "produto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserir(@RequestBody Produto produto) {
		// Insere novo produto
		produtoDAO.inserir(produto);

		// Retornando OK
		return ResponseEntity.ok().build();
	}

	// Alterar produto
	@RequestMapping(value = "produto/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long idProduto, @RequestBody Produto produto) {
		// Produto atual
		Produto produtoAtual = produtoDAO.listar(idProduto);

		// Atribuindo valores de produto alterado para produto atual
		produtoAtual.setNome(produto.getNome());
		produtoAtual.setDescricao(produto.getDescricao());
		produtoAtual.setMarca(produto.getMarca());
		produtoAtual.setCategoria(produto.getCategoria());
		produtoAtual.setSubCategoria(produto.getSubCategoria());
		produtoAtual.setValor(produto.getValor());
		produtoAtual.setCor(produto.getCor());
		produtoAtual.setDataVigencia(produto.getDataVigencia());
		produtoAtual.setQtdEstoque(produto.getQtdEstoque());
		produtoAtual.setQuantidade(produto.getQuantidade());
		produtoAtual.setFornecedor(produto.getFornecedor());
		produtoAtual.setTamanho(produto.getTamanho());

		// Alterando
		produtoDAO.alterar(produtoAtual);

		// Retornando OK
		return ResponseEntity.ok().build();
	}

	// Alterar foto de produto
	@RequestMapping(value = "produtoImagem/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterarImagem(@PathVariable("id") Long idProduto, @RequestBody Produto produto) {
		// Produto atual
		Produto produtoAtual = produtoDAO.listar(idProduto);

		// Setando imagem
		produtoAtual.setFoto(produto.getFoto());

		// Alterando
		produtoDAO.alterar(produtoAtual);

		// Retornando
		return ResponseEntity.ok().build();
	}

	// Listar
	@RequestMapping(value = "produto", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listar() {
		return produtoDAO.listar();
	}

	// Listar (id)
	@RequestMapping(value = "produto/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Produto listar(@PathVariable("id") Long idProduto) {
		return produtoDAO.listar(idProduto);
	}

	// Excluir
	@RequestMapping(value = "produto/{id}", method = RequestMethod.DELETE)
	public void excluir(@PathVariable("id") Long idProduto) {
		produtoDAO.excluir(idProduto);
	}
}
