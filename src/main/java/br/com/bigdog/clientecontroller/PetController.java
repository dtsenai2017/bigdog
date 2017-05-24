package br.com.bigdog.clientecontroller;

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
public class PetController {
	// Atributos
	private PetDAO petDAO;

	// Construtor
	@Autowired
	public PetController(PetDAO petDAO) {
		this.petDAO = petDAO;
	}

	// Inserir
	@RequestMapping(value = "pet", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> inserir(@RequestBody Pet pet) {
		try {
			// Inserindo novo pet
			petDAO.inserir(pet);
			return ResponseEntity.ok().build();
		} catch (ConstraintViolationException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Listar (id)
	@RequestMapping(value = "pet/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Pet listar(@PathVariable("id") Long id) {
		try {
			return petDAO.listar(id);
		} catch (NullPointerException e) {
			return null;
		}
	}

	// Alterar
	@RequestMapping(value = "pet/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Void> alterar(@PathVariable("id") Long id, Pet pet) {
		// ???
		return ResponseEntity.ok().build();
	}

	// Excluir
	@RequestMapping(value = "pet/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> excluir(@PathVariable("id") Long id) {
		petDAO.excluir(id);
		return ResponseEntity.ok().build();
	}
}
