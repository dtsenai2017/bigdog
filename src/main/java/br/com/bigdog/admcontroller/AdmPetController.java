package br.com.bigdog.admcontroller;

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

import br.com.bigdog.dao.PetDAO;
import br.com.bigdog.model.Pet;

@RestController
@RequestMapping(value = "adm/")
public class AdmPetController {
	// Atributos
	private PetDAO petDAO;

	// Construtor
	@Autowired
	public AdmPetController(PetDAO petDAO) {
		this.petDAO = petDAO;
	}

	// Requisições
	// Listar (id)
	@RequestMapping(value = "pet/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Pet listar(@PathVariable("id") Long id) {
		try {
			return petDAO.listar(id);
		} catch (NullPointerException e) {
			return null;
		}
	}

	// Alterar Pet (Castrado, Peso e Observações)
	@RequestMapping(value = "pet/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterarPet(@PathVariable("id") Long id, @RequestBody Pet pet) {
		try {
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
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
