package br.com.bigdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DAOJdbc {
	// Conexão
	private Connection conexao;

	@Autowired
	public DAOJdbc(DataSource dataSource) {
		try {
			this.conexao = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Requisição
	public Integer[] mesCompra() {
		// Query
		String query = "SELECT month(data_compra) as mes, count(*) as qtd_compra from Compra group by mes order by month(data_compra) asc";
		Integer[] mesCompra = new Integer[12];

		try {
			// Prepared Statement
			PreparedStatement stmt = conexao.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();

			// Atribuindo valores
			while (rs.next()) {
				mesCompra[rs.getInt("mes") - 1] = rs.getInt("qtd_compra");
			}

			// Fechando statement, conexao e result set
			rs.close();
			stmt.close();

			// Retornando
			return mesCompra;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
