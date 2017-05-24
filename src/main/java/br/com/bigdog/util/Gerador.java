package br.com.bigdog.util;

import java.util.Random;

public class Gerador {

	public long gerarIdLogin() {
		Random gerador = new Random();
		return gerador.nextInt(999999999) + 99999999;
	}
}
