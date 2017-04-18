// Requisições Ajax
// Endereço
function buscarCliente(idCliente) {
	// Limpando listas...
	limparListas();

	// Limpar listas
	function limparListas() {
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
			// FOREACH Endereços
			$.each(cliente.enderecos, function(index, endereco) {
				// Atributos
				var enderecoList = "<span>Logradouro: " + endereco.logradouro
						+ "</span><br>" + "<span>CEP: " + endereco.cep
						+ "</span><br>" + "<span>Nº: " + endereco.numero
						+ "</span><br>" + "<span>Bairro: " + endereco.bairro
						+ "</span><br>" + "<span>Cidade: " + endereco.cidade
						+ "</span><br>" + "<span>UF: " + endereco.uf
						+ "<div class='divider'></div><br>";

				// Adicionando para lista de endereços
				$("#lista-endereco").append(enderecoList)
			});

			// FOREACH Pets
			$.each(cliente.pets, function(index, pet) {
				// Atributos
				var petList = "<span>Nome: " + pet.nome + "</span><br>"
						+ "<span>Espécie: " + pet.especie + "</span><br>"
						+ "<span>Raça: " + pet.raca + "</span><br>"
						+ "<span>RGA: " + pet.rga + "</span><br>"
						+ "<span>Peso: " + pet.peso + "</span><br>"
						+ "<span>Observações: " + pet.observacoes
						+ "<div class='divider'></div><br>";

				// Adicionando para lista de endereços
				$("#lista-pet").append(petList)
			});

			// FOREACH Compras

			// FOREACH Agendamentos
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}
