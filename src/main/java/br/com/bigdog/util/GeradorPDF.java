package br.com.bigdog.util;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Component;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

@Component
public class GeradorPDF {

	public Document gerarPdf(String caminho) {
		Document document = new Document();

		try {
			PdfWriter.getInstance(document, new FileOutputStream(caminho));

			document.open();

			document.add(new Paragraph("Exemplo Geração de Arquivo PDF via iText - Java"));

		} catch (DocumentException de) {
			// TODO: handle exception
			System.err.println(de.getMessage());
		} catch (IOException ioe) {
			// TODO Auto-generated catch block
			System.err.println(ioe.getMessage());
		}

		document.close();

		return document;
	}
}