// Buscar cliente selecionado
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
			// Setando nome cliente para modal
			$("#modal-cliente-info h5").append(cliente.nome);

			// Atributos para valores nulos
			var telefone;

			// Atribui valores caso for nulo
			if (cliente.contato.telefone == null) {
				telefone = "Não informou telefone.";
			} else {
				telefone = cliente.contato.telefone;
			}

			// Dados do cliente
			var clienteDados = "<span><b>Nome Completo: </b>" + cliente.nome
					+ "</span><br>" + "<span><b>CPF: </b>" + cliente.cpf
					+ "</span><br>" + "<span><b>Gênero: </b>" + cliente.genero
					+ "</span><br>" + "<span><b>Data de Nascimento: </b>"
					+ cliente.dataNascimento + "</span><br>"
					+ "<span><b>Email de Contato: </b>" + cliente.contato.email
					+ "</span><br>" + "<span><b>Celular: </b>"
					+ cliente.contato.celular + "</span><br>"
					+ "<span><b>Telefone: </b>" + telefone + "</span><br>";

			// Define cor de fundo dos dados do CLIENTE de acordo com
			// gênero
			if (cliente.genero == 'Masculino') {
				$('#dados-cliente').addClass('blue lighten-1');
			} else {
				$('#dados-cliente').addClass('pink lighten-1');
			}

			// Adicionando dados para collection de dados de cliente em
			// modal
			$('#dados-cliente').append(clienteDados);

			// FOREACH Endereços do cliente
			$.each(cliente.enderecos, function(index, endereco) {
				// Atributo de lista de endereços do cliente
				var enderecoList = "<span><b>Logradouro:</b> "
						+ endereco.logradouro + "</span><br>"
						+ "<span><b>CEP:</b> " + endereco.cep + "</span><br>"
						+ "<span><b>Nº:</b> " + endereco.numero + "</span><br>"
						+ "<span><b>Bairro:</b> " + endereco.bairro
						+ "</span><br>" + "<span><b>Cidade:</b> "
						+ endereco.cidade + "</span><br>" + "<span><b>UF:</b> "
						+ endereco.uf + "</span><div class='divider'>"
						+ "</div><br>";

				// Adicionando para collection de endereços em
				// modal
				$('#lista-endereco').append(enderecoList);
			});

			// FOREACH Pets
			$.each(cliente.pets, function(index, pet) {
				// Atributos para valores nulos
				var castrado;
				var rga;
				var carteiraVacina;
				var peso;
				var pedigree;
				var pelagem;
				var observacao;
				var dataNascimento;
				var raca;

				// Valor para exibição de valores null
				// Castrado
				if (pet.castrado == true) {
					castrado = 'Sim.';
				} else {
					castrado = 'Não.';
				}

				// Rga
				if (pet.rga.lenght == 0) {
					rga = "Não há informação."
				} else {
					rga = pet.rga;
				}

				// Carteina de Vacina
				if (pet.carteiraVacina.length == 0) {
					carteiraVacina = "Não há informação."
				} else {
					carteiraVacina = pet.carteiraVacina;
				}

				// Peso
				if (pet.peso == null) {
					peso = "Não há informação!";
				} else {
					peso = pet.peso;
				}

				// Pedigree
				if (pet.pedigree.length == 0) {
					pedigree = "Não há informação.";
				} else {
					pedigree = pet.pedigree;
				}

				// Pelagem
				if (pet.pelagem.length == 0) {
					pelagem = "Não há informação.";
				} else {
					pelagem = pet.pelagem;
				}

				// Observações
				if (pet.observacoes.length == 0) {
					observacoes = "Não há informação!";
				} else {
					observacoes = pet.observacoes;
				}

				// Data de Nascimento
				if (pet.dataNascimento.length == 0) {
					dataNascimento = "Não há informação.";
				} else {
					dataNascimento = pet.dataNascimento;
				}

				// Raça
				if (pet.raca.length == 0) {
					raca = "Não há informação!";
				} else {
					raca = pet.raca;
				}

				// Objeto de lista
				var petList = "<span><b>Nome:</b> " + pet.nome + "</span><br>"
						+ "<span><b>Espécie:</b> " + pet.especie
						+ "</span><br>" + "<span><b>Raça:</b> " + raca
						+ "</span><br>" + "<span><b>RGA:</b> " + rga
						+ "</span><br>" + "<span><b>Pedigree:</b> " + pedigree
						+ "</span><br>" + "<span><b>Carteira Vacina:</b> "
						+ carteiraVacina + "</span><br>"
						+ "<span><b>Nascimento:</b> " + dataNascimento
						+ "</span><br>" + "<span><b>Pelagem:</b> " + pelagem
						+ "</span><br><span><b>Castrado:</b> " + castrado
						+ "</span><br>" + "<span><b>Peso:</b> " + peso
						+ "</span><br>" + "<span><b>Observações:</b> "
						+ observacoes + "</span><br>"
						+ "<a href='#modal-editar-pet' onclick='visualizarPet("
						+ pet.idPet + ");' style='color: brown' "
						+ " class='right'>" + "<b>Editar</b>" + "</a><br>"
						+ "<div class='divider'>" + "</div><br>";

				// Adicionando para collection de pets
				// em modal
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
// Buscar cliente selecionado

// * EDITAR DADOS DO CLIENTE (Dados do cliente, pets, compra e agendamentos)
// PET
// Abri dados do pet no formulario
function visualizarPet(idPet) {
	// Limpar formulario
	limparFormPet();

	// Limpar campos do formulário
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
			// Ativando labels de inputs
			$('#labelPeso').addClass("active");
			$('#labelObservacoes').addClass("active");

			// Adicionando dados para formulário
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
// Abri dados do pet no formulario

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
			// CONFIRMAR
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
								boxWidth : '40%',
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
			// Opção Confirmar
			},
			cancel : {
				// CANCELAR
				text : 'Cancelar',
				action : function() {
					// ...
				}
			}
		// Opção Cancelar
		}
	// Botões (Confirmar e Cancelar)
	});
	// Caixa de confirmação
}
// Alterar Pet
