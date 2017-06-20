// Recarregar página
function recarregarGerenciarCliente() {
	// Recarregando...
	var xhr = new XMLHttpRequest();

	// Tipo, url e async
	xhr.open('GET', "adm/gerenciarCliente", false);

	// Atribuindo token
	xhr.setRequestHeader("Authorization", localStorage.getItem("tokenBigDog"));

	// Response
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			$(document.body).html(xhr.response);
		}
	};

	// Request send()
	xhr.send();
}

// Buscar cliente selecionado
function buscarCliente(idCliente) {
	// Limpando listas de endereco, pet, compra e agendamento...
	limparListas();

	// Limpar listas
	function limparListas() {
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
		url : "adm/cliente/" + idCliente,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(cliente) {
			// Setando id e nome cliente para modal
			$('#idCliente-selecionado').val(cliente.idCliente);

			// Atributos para valores nulos
			var telefone;
			var email;
			var nascimento = new Date(cliente.dataNascimento);
			nascimento.setDate(nascimento.getDate() + 1);

			// Atribui valores caso for nulo
			if (cliente.contato.telefone == null) {
				telefone = "-";
			} else {
				telefone = cliente.contato.telefone;
			}

			if (cliente.email == null) {
				email = "-"
			} else {
				email = cliente.email;
			}

			// Dados do cliente
			var clienteDados = "<h5 align='center'><b>" + cliente.nome
					+ "</b></h5><br>" + "<span><b>CPF : </b>" + cliente.cpf
					+ "</span><br>" + "<span><b>Gênero : </b>" + cliente.genero
					+ "</span><br>" + "<span><b>Data de Nascimento : </b>"
					+ $.datepicker.formatDate("dd/mm/yy", nascimento)
					+ "</span><br>" + "<span><b>Email : </b>" + email
					+ "</span><br>" + "<span><b>Celular : </b>"
					+ cliente.contato.celular + "</span><br>"
					+ "<span><b>Telefone : </b>" + telefone + "</span><br>";

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

			// Endereços do cliente
			if (cliente.enderecos.length != 0) {
				$.each(cliente.enderecos, function(index, endereco) {
					// Atribui valor para caso for nulo
					var complemento = endereco.complemento;

					// Atribuindo valor
					if (complemento == '') {
						complemento = '-';
					}

					// Atributo de lista de endereços do cliente
					var enderecoList = "<h5 align='center'><b>"
							+ endereco.logradouro + "</b></h5>"
							+ "<span><b>CEP :</b> " + endereco.cep
							+ "</span><br>" + "<span><b>Nº :</b> "
							+ endereco.numero + "</span><br>"
							+ "<span><b>Complemento :</b> " + complemento
							+ "</span><br>" + "<span><b>Bairro :</b> "
							+ endereco.bairro + "</span><br>"
							+ "<span><b>Cidade :</b> " + endereco.cidade
							+ "</span><br>" + "<span><b>UF :</b> "
							+ endereco.uf + "</span><div class='divider'>"
							+ "</div><br>";

					// Adicionando para collection de endereços em
					// modal e atribuindo qtd de endereços
					$('#lista-endereco').append(enderecoList);
					$('#qtd-endereco').html(cliente.enderecos.length);
				});
			} else {
				// Caso não tenha endereços cadastrado
				$('#qtd-endereco').html(0);
			}

			// Pets do cliente
			// Verifica se há pet cadastrado
			if (cliente.pets.length != 0) {
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

					// Valor para exibição de valores
					// null
					// Castrado
					if (pet.castrado == true) {
						castrado = 'Sim.';
					} else {
						castrado = 'Não.';
					}

					// Rga
					if (pet.rga == null) {
						rga = "-"
					} else {
						rga = pet.rga;
					}

					// Carteina de Vacina
					if (pet.carteiraVacina == null) {
						carteiraVacina = "-"
					} else {
						carteiraVacina = pet.carteiraVacina;
					}

					// Peso
					if (pet.peso == null) {
						peso = "-";
					} else {
						peso = pet.peso;
					}

					// Pedigree
					if (pet.pedigree == null) {
						pedigree = "-";
					} else {
						pedigree = pet.pedigree;
					}

					// Pelagem
					if (pet.pelagem.length == 0) {
						pelagem = "-";
					} else {
						pelagem = pet.pelagem;
					}

					// Observações
					if (pet.observacoes.length == 0) {
						observacoes = "-";
					} else {
						observacoes = pet.observacoes;
					}

					// Data de Nascimento
					if (pet.dataNascimento.length == 0) {
						dataNascimento = "-";
					} else {
						dataNascimento = new Date(pet.dataNascimento);
						dataNascimento.setDate(dataNascimento.getDate() + 1);
					}

					// Raça
					if (pet.raca.length == 0) {
						raca = "-";
					} else {
						raca = pet.raca;
					}

					// Objeto de lista
					var petList = "<h5 align='center' ><b>"
							+ pet.nome
							+ "</b></h5>"
							+ "<span><b>Espécie :</b> "
							+ pet.especie
							+ "</span><br>"
							+ "<span><b>Raça :</b> "
							+ raca
							+ "</span><br>"
							+ "<span><b>RGA :</b> "
							+ rga
							+ "</span><br>"
							+ "<span><b>Pedigree :</b> "
							+ pedigree
							+ "</span><br>"
							+ "<span><b>Carteira Vacina :</b> "
							+ carteiraVacina
							+ "</span><br>"
							+ "<span><b>Nascimento :</b> "
							+ $.datepicker.formatDate("dd/mm/yy",
									dataNascimento) + "</span><br>"
							+ "<span><b>Pelagem :</b> " + pelagem
							+ "</span><br><span><b>Castrado :</b> " + castrado
							+ "</span><br>" + "<span><b>Peso :</b> " + peso
							+ " kg</span><br>" + "<span><b>Observações :</b> "
							+ observacoes + "</span><br>"
							+ "<a href='#modal-editar-pet' "
							+ "onclick='visualizarPet(" + pet.idPet
							+ ");' class='right'>"
							+ "<i class='material-icons "
							+ "red-text'>mode_edit</i>" + "</a><br>"
							+ "<div class='divider'>" + "<br>";

					// Adicionando para collection de
					// pets
					// em modal
					$('#lista-pet').append(petList);
				});

				// Atribuindo outras informações
				$('#qtd-pet').html(cliente.pets.length);
			} else {
				// Caso não tenha pet cadastrado
				$('#qtd-pet').html(0);
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});

	// Listando compras de cliente
	$.getJSON({
		url : "adm/compraCliente/" + idCliente,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(compras) {
			// Verifica se há compras
			if (compras.length != 0) {
				// Compras realizadas do cliente
				$.each(compras, function(index, compra) {
					// Atribui 0 para minutos
					function addZero(i) {
						if (i < 10) {
							i = "0" + i;
						}
						return i;
					}

					// Atributo date
					var dataCompra = new Date(compra.dataCompra);
					var horas = addZero(dataCompra.getHours());
					var minutos = addZero(dataCompra.getMinutes());

					// Atributo de lista de compras do
					// cliente
					var compraList = "<h5 align='center'><b>"
							+ $.datepicker.formatDate("dd/mm/yy", dataCompra)
							+ "</b></h5>" + "<span><b>Qtd de Itens : </b>"
							+ compra.itensCompra.length + "</span><br>"
							+ "<span><b>Horário : </b>" + horas + ":" + minutos
							+ "hrs.</span><br>" + "<span><b>Valor : </b>R$ "
							+ compra.valor.toFixed(2)
							+ "</span><br><span><b>Endereço : </b>"
							+ compra.endereco.logradouro + ", "
							+ compra.endereco.numero + " / "
							+ compra.endereco.cep + "</span><br>"
							+ "<span><b>Status da Compra : </b><i>"
							+ compra.status + "</i></span><br><a "
							+ "href='#modal-compra-cliente' "
							+ "onclick='abrirCompraCliente(" + compra.idCompra
							+ ")'" + ">" + "STATUS</a><div class='divider'>";

					// Adicionando para collection de
					// compras
					$('#lista-compra').append(compraList);
				});

				// Outras informações
				// Atributos
				var ultimaCompra = compras[compras.length - 1];
				var dataUltimaCompra = new Date(ultimaCompra.dataCompra);

				// Atribuindo valores
				$('#qtd-compra').html(compras.length);
				$('#ultima-compra').html(
						$.datepicker.formatDate("dd/mm/yy", dataUltimaCompra));
			} else {
				// Caso não tenha compras...
				$('#qtd-compra').html(0);
				$('#ultima-compra').html('Não há compra(s).');
			}
		},
		error : function(e) {
			// Error
			console.log("ERROR : " + e);
		}
	});

	// Listando agendamentos de cliente
	$.getJSON({
		url : "adm/agendamentoCliente/" + idCliente,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(agendamentos) {
			// Verifica se há agendamentos
			if (agendamentos.length != 0) {
				// Agendamentos realizados do cliente
				$.each(agendamentos, function(index, agendamento) {
					// Adiciona zero para horário
					function addZero(i) {
						if (i < 10) {
							i = "0" + i;
						}
						return i;
					}

					// Atributo date
					var dataAgendamento = new Date(agendamento.dataAgendada);
					var hora = addZero(dataAgendamento.getHours());
					var minutos = addZero(dataAgendamento.getMinutes());

					// Atributo da lista de agendamento
					var agendamentoList = "<h5 align='center'><b>"
							+ $.datepicker.formatDate("dd/mm/yy",
									dataAgendamento) + "</b></h5>"
							+ "<span><b>Horário : </b>" + hora + ":" + minutos
							+ "hrs.</span><br>"
							+ "<span><b>Tipo de Serviço : </b>"
							+ agendamento.servico.tipoServico
							+ "</span><br><span><b>Valor : R$ </b>"
							+ agendamento.servico.valor.toFixed(2)
							+ "</span><br><span>" + "<b>Nome do Pet : </b>"
							+ agendamento.pet.nome + "</span><br>"
							+ "<div class='divider'>";

					// Adicionando para collection de
					// agendamentos
					$('#lista-agendamento').append(agendamentoList);
				});

				// Outras informações
				// Atributos
				var ultimoAgendamento = agendamentos[agendamentos.length - 1];
				var dataUltimoAgendamento = new Date(
						ultimoAgendamento.dataAgendada);

				// Atribuindo valores
				$('#qtd-agendamento').html(agendamentos.length);
				$('#ultimo-agendamento').html(
						$.datepicker.formatDate("dd/mm/yy",
								dataUltimoAgendamento));
			} else {
				// Caso não tenha compras...
				$('#qtd-agendamento').html(0);
				$('#ultimo-agendamento').html('Não há agendamento(s).');
			}
		},
		error : function(e) {
			// Error
			console.log("ERROR : " + e);
		}
	});
}

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
		url : "adm/pet/" + idPet,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
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

// Abrir dados da compra para modal
function abrirCompraCliente(idCompra) {
	// Listando compra
	$.getJSON({
		url : "adm/compra/" + idCompra,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(compra) {
			// Ativando label de input
			$('#label-status-compra-selecionada').addClass('active');

			// Atribuindo valor para input (id e status)
			$('#idCompra-selecionada').val(compra.idCompra);
			$('#status-compra-selecionada').val(compra.status);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Alterar status de compra
$("#form-status-compra").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Atributos
	var mensagem;
	var compra = {
		idCompra : $('#idCompra-selecionada').val(),
		status : $('#status-compra-selecionada').val()
	}

	// Listando compra
	$.ajax({
		url : "adm/alterarStatus/" + compra.idCompra,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "PUT",
		data : JSON.stringify(compra),
		contentType : "application/json",
		success : function(s) {
			// Mensagem
			mensagem = "Status alterado!";

			// Fechando modal's
			$('#modal-compra-cliente').modal('close');
			$('#modal-cliente-info').modal('close');
		},
		error : function(e) {
			console.log("ERROR: ", e);

			// Mensagem
			mensagem = "Ops, houve um problema!";
		},
		complete : function(e) {
			Materialize.toast(mensagem, 2000);
		}
	});
});

// Alterar pet
function alterarPet() {
	// Atributo
	var mensagem;

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
						url : 'adm/pet/' + pet.idPet,
						headers : {
							'Authorization' : localStorage
									.getItem("tokenBigDog")
						},
						type : 'put',
						data : JSON.stringify(pet),
						contentType : "application/json",
						success : function(data) {
							// Recarregando página de clientes
							recarregarGerenciarCliente();
						},
						error : function(e) {
							// Erro
							console.log('ERROR :' + e);
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

// Excluir cliente
$('#btn-excluir-cliente').click(
		function() {
			// Verifica alteração
			$.confirm({
				title : 'Exclusão de cliente',
				animation : 'top',
				useBootstrap : false,
				theme : 'material',
				boxWidth : '50%',
				content : 'Deseja realmente excluir ?',
				buttons : {
					// CONFIRMAR
					confirm : {
						text : 'Confirmar',
						btnClass : 'btn-green',
						action : function() {
							// Id do cliente
							var idCliente = $('#idCliente-selecionado').val();

							// Excluindo cliente...
							$.ajax({
								url : 'adm/cliente/' + idCliente,
								headers : {
									'Authorization' : localStorage
											.getItem("tokenBigDog")
								},
								type : 'DELETE',
								contentType : "application/json",
								success : function(s) {
									// Recarregando página de clientes
									recarregarGerenciarCliente();
								},
								error : function(e) {
									// Erro
									console.log('ERROR :' + e);
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
		});
