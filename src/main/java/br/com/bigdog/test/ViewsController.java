package br.com.bigdog.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewsController {
	// VIEWS ~
	// Navbar
	// @RequestMapping("/navbar")
	// public String navbar() {
	// return "administrador/component/navbar";
	// }

	// @RequestMapping("/footer")
	// public String footer() {
	// return "administrador/component/footer";
	// }

	@RequestMapping("/indexAdm")
	public String footer() {
		return "administrador/index-administrador";
	}
}
