package br.com.bigdog.restcontroller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

	// Método de logar
	@RequestMapping(value = "logar", method = RequestMethod.POST)
	public void logar() {
		System.out.println("Loguei !");
	}

}
