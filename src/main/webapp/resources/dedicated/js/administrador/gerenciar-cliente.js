// BUSCAR CLIENTE COMPLETO
function buscarCliente(idCliente) {
	// Limpando listas de endereco, pet, compra e agendamento...
	limparListas();

	// Limpar listas
	function limparListas() {
		$('#modal-cliente-info h5').empty();
		$('#dados-cliente').empty();
		$('#dados-cliente').removeClass('blue lighten-1');
		$('#dados-cliente').removeClass('pink lighten-1');
		$('#lista-endereco').empty();
		$('#lista-pet').empty();
		$('#lista-compra').empty();
		$('#lista-agendamento').empty();
	}

	// Listar (id)
	$.getJSON({
		url : "visualizarCliente/" + idCliente,
		type : "GET",
		success : function(cliente) {
			// Setando cliente para modal
			$("#modal-cliente-info h5").append(cliente.nome);

			// Dados do cliente
			var clienteDados = "<span><b>Nome Completo: </b>" + cliente.nome
					+ "</span><br>" + "<span><b>CPF: </b>" + cliente.cpf
					+ "</span><br>" + "<span><b>Data de Nascimento: </b>"
					+ cliente.dataNascimento + "</span><br>"
					+ "<span><b>Email de Acesso: </b>" + cliente.email
					+ "</span><br>" + "<span><b>Gênero: </b>" + cliente.genero
			"</span><br>";

			// Define cor de fundo dos dados do CLIENTE de acordo com gênero
			if (cliente.genero == 'Masculino') {
				$('#dados-cliente').addClass('blue lighten-1');
			} else {
				$('#dados-cliente').addClass('pink lighten-1');
			}

			// Adicionando dados para view
			$('#dados-cliente').append(clienteDados);

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
						+ endereco.uf + "</span><div class='divider'>"
						+ "</div><br>";

				// Adicionando para lista de endereços
				$('#lista-endereco').append(enderecoList);
			});

			// FOREACH Pets
			$.each(cliente.pets, function(index, pet) {
				// Atributo castrado
				var castrado;
				var peso;
				var observacao;

				// Valor para exibição de castrado
				if (pet.castrado == true) {
					castrado = 'Sim.';
				} else {
					castrado = 'Não.';
				}

				// Valor de exibição para peso null
				if (pet.peso == null) {
					peso = "Não há informação!";
				} else {
					peso = pet.peso;
				}

				// Valor para exibição de observações
				if (pet.observacoes.length == 0) {
					observacoes = "Não há informação!";
				} else {
					observacoes = pet.observacoes;
				}

				// Objeto de lista
				var petList = "<span><b>Nome:</b> " + pet.nome + "</span><br>"
						+ "<span><b>Espécie:</b> " + pet.especie
						+ "</span><br>" + "<span><b>Raça:</b> " + pet.raca
						+ "</span><br>" + "<span><b>RGA:</b> " + pet.rga
						+ "</span><br>" + "<span><b>Pedigree:</b> "
						+ pet.pedigree + "</span><br>"
						+ "<span><b>Carteira Vacina:</b> " + pet.carteiraVacina
						+ "</span><br>" + "<span><b>Nascimento:</b> "
						+ pet.dataNascimento + "</span><br>"
						+ "<span><b>Pelagem:</b> " + pet.pelagem
						+ "</span><br><span><b>Castrado:</b> " + castrado
						+ "</span><br>" + "<span><b>Peso:</b> " + peso
						+ "</span><br>" + "<span><b>Observações:</b> "
						+ observacoes + "</span><br>"
						+ "<a href='#modal-editar-pet' onclick='visualizarPet("
						+ pet.idPet + ");'" + " class='right'>" + "Editar"
						+ "</a><br>" + "<div class='divider'>" + "</div><br>";

				// Adicionando para lista de endereços
				$('#lista-pet').append(petList);
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

// * EDITAR
// PET
// Abri pet no formulario
function visualizarPet(idPet) {
	// Limpando formulario
	limparFormPet();

	// Limpar campos
	function limparFormPet() {
		$('#modal-editar-pet h5').empty();
		$('#idPet').empty();
		$('#castrado').prop('checked', false);
		$('#peso').empty();
		$('#observacoes').empty();
	}

	// Listando e atribuindo valores para formulário de alteração
	$.getJSON({
		url : "pet/" + idPet,
		type : "GET",
		success : function(pet) {
			// Ativando labels de input
			$('#labelPeso').addClass("active");
			$('#labelObservacoes').addClass("active");

			// Adicionando dados para modal com formulário de alteração
			$('#modal-editar-pet h5').append("Editar '" + pet.nome + "'");
			$('#idPet').val(pet.idPet);
			$('#castrado').prop('checked', pet.castrado);
			$('#peso').val(pet.peso);
			$('#observacoes').val(pet.observacoes);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Alterar pet
function alterarPet() {
	// Verifica alteração
	$.confirm({
		title : 'Alteração',
		animation : 'top',
		useBootstrap : false,
		theme : 'material',
		boxWidth : '50%',
		content : 'Deseja alterar pet?',
		buttons : {
			// Confirmar
			confirm : {
				text : 'Confirmar',
				btnClass : 'btn-green',
				action : function() {
					// Pet alterado
					var pet = {
						idPet : $('#idPet').val(),
						castrado : $('#castrado').is(":checked"),
						peso : $('#peso').val(),
						observacoes : $('#observacoes').val()
					}

					// Alterando pet com id
					$.ajax({
						url : 'admPet/' + pet.idPet,
						type : 'put',
						data : JSON.stringify(pet),
						contentType : "application/json",
						success : function(data) {
							// Sucesso
							$.dialog({
								type : 'green',
								boxWidth : '30%',
								useBootstrap : false,
								title : 'Alteração efetuada com sucesso!',
								content : 'O Pet foi alterado!',
								close : function() {
									// Recarregando página de clientes
									window.location.reload();
								}
							});
						},
						error : function(e) {
							// Erro
							console.log("ERRO: " + e.toString());
						}
					});
				}
			},
			cancel : {
				// Cancelar
				text : 'Cancelar',
				action : function() {
				}
			}
		}
	});
}
