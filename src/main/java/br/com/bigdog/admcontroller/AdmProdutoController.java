package br.com.bigdog.admcontroller;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.bigdog.dao.ProdutoDAO;
import br.com.bigdog.model.Produto;

@RestController
@RequestMapping(value = "adm/")
public class AdmProdutoController {
	// Atributos
	private ProdutoDAO produtoDAO;

	// Construtor
	@Autowired
	public AdmProdutoController(ProdutoDAO produtoDAO) {
		this.produtoDAO = produtoDAO;
	}

	// Inserir produto
	@RequestMapping(value = "produto", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserir(@RequestBody Produto produto) {
		try {
			// Insere novo produto
			produtoDAO.inserir(produto);

			// Retornando OK
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Alterar produto
	@RequestMapping(value = "produto/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long idProduto, @RequestBody Produto produto) {
		try {
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
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Alterar foto de produto
	@RequestMapping(value = "produtoImagem/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterarImagem(@PathVariable("id") Long idProduto, @RequestBody Produto produto) {
		try {
			// Produto atual
			Produto produtoAtual = produtoDAO.listar(idProduto);

			// Setando imagem
			produtoAtual.setFoto(produto.getFoto());

			// Alterando
			produtoDAO.alterar(produtoAtual);

			// Retornando
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Listar
	@RequestMapping(value = "produto", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listar() {
		try {
			// Retornando
			return produtoDAO.listar();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Listar (id)
	@RequestMapping(value = "produto/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Produto listar(@PathVariable("id") Long idProduto) {
		try {
			// Retornando
			return produtoDAO.listar(idProduto);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Listar ordenado por nome
	@RequestMapping(value = "produtoOrdenadoNome", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Produto> listarOrdenadoNome() {
		try {
			// Retornando
			return produtoDAO.listarNome();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// Excluir
	@RequestMapping(value = "produto/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long idProduto) {
		try {
			// Excluindo
			produtoDAO.excluir(idProduto);

			// Retornando
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
