// Requisições Ajax
// Endereço
function buscarCliente(idCliente) {
	// Limpando listas...
	limparListas();

	// Limpar listas
	function limparListas() {
		$(".modal-content h5").empty();
		$("#lista-endereco").empty();
		$("#lista-pet").empty();
		$("#lista-compra").empty();
		$("#lista-agendamento").empty();
	}

	// Listar (id)
	$.getJSON({
		url : "cliente/" + idCliente,
		type : "GET",
		success : function(cliente) {
			// Setando cliente para modal
			$(".modal-content h5").append(cliente.nome);

			// FOREACH Endereços
			$.each(cliente.enderecos, function(index, endereco) {
				// Atributos
				var enderecoList = "<span><b>Logradouro:</b> "
						+ endereco.logradouro + "</span><br>"
						+ "<span><b>CEP:</b> " + endereco.cep + "</span><br>"
						+ "<span><b>Nº:</b> " + endereco.numero + "</span><br>"
						+ "<span><b>Bairro:</b> " + endereco.bairro
						+ "</span><br>" + "<span><b>Cidade:</b> "
						+ endereco.cidade + "</span><br>" + "<span><b>UF:</b> "
						+ endereco.uf + "</span><br>"
						+ "<a href='#modal-editar-endereco'"
						+ "onclick='editarEndereco("
						+ endereco.idEnderecoCliente + ");' class='right'>"
						+ "Editar" + "</a><br>" + "<div class='divider'>"
						+ "</div><br>";

				// Adicionando para lista de endereços
				$("#lista-endereco").append(enderecoList)
			});

			// FOREACH Pets
			$.each(cliente.pets, function(index, pet) {
				// Atributos
				var petList = "<span><b>Nome:</b> " + pet.nome + "</span><br>"
						+ "<span><b>Espécie:</b> " + pet.especie
						+ "</span><br>" + "<span><b>Raça:</b> " + pet.raca
						+ "</span><br>" + "<span><b>RGA:</b> " + pet.rga
						+ "</span><br>" + "<span><b>Peso:</b> " + pet.peso
						+ "</span><br>" + "<span><b>Observações:</b> "
						+ pet.observacoes + "</span><br>"
						+ "<a href='#modal-editar-pet' " + "class='right'>"
						+ "Editar" + "</a><br>" + "<div class='divider'>"
						+ "</div><br>";

				// Adicionando para lista de endereços
				$("#lista-pet").append(petList)
			});

			// FOREACH Compras
			// ...

			// FOREACH Agendamentos
			// ...
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// EDITAR
// Endereço
function editarEndereco(id) {
	// Listando e atribuindo valores para formulário
	// ...
}
