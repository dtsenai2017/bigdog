package br.com.bigdog.util;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import org.jrimum.bopepo.BancosSuportados;
import org.jrimum.bopepo.Boleto;
import org.jrimum.bopepo.view.BoletoViewer;
import org.jrimum.domkee.comum.pessoa.endereco.CEP;
import org.jrimum.domkee.comum.pessoa.endereco.Endereco;
import org.jrimum.domkee.comum.pessoa.endereco.UnidadeFederativa;
import org.jrimum.domkee.comum.pessoa.id.cprf.CNPJ;
import org.jrimum.domkee.comum.pessoa.id.cprf.CPF;
import org.jrimum.domkee.financeiro.banco.febraban.Agencia;
import org.jrimum.domkee.financeiro.banco.febraban.Carteira;
import org.jrimum.domkee.financeiro.banco.febraban.Cedente;
import org.jrimum.domkee.financeiro.banco.febraban.ContaBancaria;
import org.jrimum.domkee.financeiro.banco.febraban.NumeroDaConta;
import org.jrimum.domkee.financeiro.banco.febraban.Sacado;
import org.jrimum.domkee.financeiro.banco.febraban.SacadorAvalista;
import org.jrimum.domkee.financeiro.banco.febraban.Titulo;
import org.springframework.stereotype.Component;

import br.com.bigdog.model.Compra;

@Component
public class GeradorPDF {
	// Gerar boleto
	public void gerarBoleto(Compra compra, HttpServletResponse response) {
		ContaBancaria contaBancaria = new ContaBancaria();
		contaBancaria.setBanco(BancosSuportados.BANCO_BRADESCO.create());
		contaBancaria.setAgencia(new Agencia(1226));
		contaBancaria.setCarteira(new Carteira(06));
		contaBancaria.setNumeroDaConta(new NumeroDaConta(260590, "2"));

		Cedente cedente = new Cedente("Pet Shop Big Dog");
		cedente.setCPRF(new CNPJ("15.335.316/0001-01"));

		Sacado sacado = new Sacado(compra.getCliente().getNome());
		sacado.setCPRF(new CPF(compra.getCliente().getCpf()));

		Titulo titulo = new Titulo(contaBancaria, sacado, cedente);

		Endereco endereco = new Endereco();
		endereco.setCep(new CEP("06436-000"));
		endereco.setLogradouro("Avenida Zélia");
		endereco.setNumero("225");
		endereco.setBairro("Parque dos Camargos");
		endereco.setLocalidade("Barueri");
		endereco.setUF(UnidadeFederativa.SP);

		SacadorAvalista sacadorAvalista = new SacadorAvalista(cedente.getNome());
		sacadorAvalista.setCPRF(cedente.getCPRF());
		sacadorAvalista.addEndereco(endereco);

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, 15);

		titulo.setCedente(cedente);
		titulo.setSacadorAvalista(sacadorAvalista);
		titulo.setValor(BigDecimal.valueOf(compra.getValor()));
		titulo.setDesconto(null);
		titulo.setDataDoVencimento(cal.getTime());
		titulo.setSacado(sacado);
		titulo.setNossoNumero("99345678912");
		titulo.setDigitoDoNossoNumero("5");
		titulo.setNumeroDoDocumento("042");

		Boleto boleto = new Boleto(titulo);
		boleto.setInstrucaoAoSacado(null);
		boleto.setInstrucao1(
				"Após Gerar o Boleto Bancário assim que a Compra for Finalizada o Prazo de Vencimento será de 10 dias");
		boleto.setInstrucao2(
				"Caso Haja o Vencimento do Mesmo Somente Gerando um novo Boleto será Possível Realizar a Compra.");
		boleto.setInstrucao3(null);
		boleto.setInstrucao4(null);
		boleto.setInstrucao5(null);
		boleto.setInstrucao6(null);
		boleto.setInstrucao7(null);
		boleto.setInstrucao8(null);
		boleto.setLocalPagamento("Pagamento Poderá Ser Realizada Na Agência Bancária ou Lotéricas");

		BoletoViewer viewer = new BoletoViewer(boleto);
		byte[] pdfAsBytes = viewer.getPdfAsByteArray();
		mostreBoletoNaTela(pdfAsBytes, response);
	}

	// Mostra boleto na tela
	final static void mostreBoletoNaTela(byte[] pdf, HttpServletResponse response) {
		Gerador gerador = new Gerador();
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition",
				"attachment; filename=bigdog_boleto" + gerador.gerarIdLogin() + ".pdf");
		OutputStream output;

		try {
			output = response.getOutputStream();
			output.write(pdf);
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}