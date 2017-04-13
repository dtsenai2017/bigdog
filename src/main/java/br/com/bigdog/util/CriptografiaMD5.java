package br.com.bigdog.util;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class CriptografiaMD5 {
	// Encriptar senha em MD5
	public static String encriptar(String senha) {

		// Objeto que irá criptar String senha
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();

		// Passa senha para criptografar
		senha = encoder.encodePassword(senha, null);

		// Retorna senha
		return senha;
	}
}
