// Gerenciamento
$("#swipe-gerenciar a").click(
		function() {
			// Atributo
			var tipo = $(this).attr('id').split('-');

			// Verifica tipo de gerenciamento
			if (tipo[2] == 'cliente') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarCliente", false);

				// Atribuindo toke
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'loja') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarLoja", false);

				// Atribuindo toke
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'agenda') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarAgenda", false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'servico') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarServico", false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			}
		});

// JS dedicado para página de index do administrador
// Requisições
// Agenda de Hoje
$("#btn-agenda-hoje").click(
		function() {
			// Limpando lista
			$('#lista-agendamentos-hoje').html('');

			// Requisição
			$.getJSON({
				url : "adm/agendamentoHoje",
				headers : {
					'Authorization' : localStorage.getItem("tokenBigDog")
				},
				type : "GET",
				success : function(agendamentos) {
					$.each(agendamentos, function(index, agendamento) {
						// Atributos
						var imgServico;
						var dataAgendada = new Date(agendamento.dataAgendada);

						// Atribui valor de imagem de acordo com serviço
						if (agendamento.servico.tipoServico == 'Veterinario') {
							imgServico = 'resources/dedicated/img/'
									+ 'administrador/gerenciar/'
									+ 'icone-servico-veterinario.png';
						} else {
							imgServico = 'resources/dedicated/img/'
									+ 'administrador/gerenciar/'
									+ 'icone-servico-estetica.png';
						}

						// Card
						var cardAgendamento = '<div class="card '
								+ 'col s12 m12 l12 hoverable '
								+ 'grey darken-2' + '">'
								+ '<div id="card-agendamento-imagem" '
								+ 'class="card-image waves-effect'
								+ 'waves-block waves-light">'
								+ '<img class="activator '
								+ 'img-agendamento-hoje"' + 'src="'
								+ imgServico
								+ '">'
								+ '</div>'
								+ '<div class="card-content">'
								+ '<span class="card-title activator truncate '
								+ 'grey-text text-lighten-3" title="'
								+ agendamento.cliente.nome
								+ '">'
								+ agendamento.cliente.nome
								+ '<br><i class="material-icons right">'
								+ 'more_vert</i></span><p class="'
								+ 'white-text">'
								+ '<b>Horário : </b>'
								+ dataAgendada.getHours()
								+ ':'
								+ dataAgendada.getMinutes()
								+ 'hrs.</p></div>'
								+ '<div class="card-reveal grey '
								+ 'white-text'
								+ '">'
								+ '<span class="card-title white-text">'
								+ 'Informações'
								+ '<i class="material-icons right">'
								+ 'close'
								+ '</i></span>'
								+ '<div class="divider"></div>'
								+ '<p><b>Nome do Pet </b>: '
								+ agendamento.pet.nome
								+ '</p>'
								+ '<p><b>Serviço </b>: '
								+ agendamento.servico.nome
								+ '</p>'
								+ '<p><b>Valor </b>: R$'
								+ agendamento.servico.valor.toFixed(2)
								+ '</p>'
								+ '<p><b>Observações </b>: '
								+ agendamento.servico.observacao
								+ '</p>'
								+ '<div class="divider"></div>'
								+ '<a href="#!" class="red-text" '
								+ 'onclick="excluirAgendamento('
								+ agendamento.idAgendamento
								+ ')"'
								+ 'right" >Excluir</a>' + '</div></div>';

						// Atribuindo card para lista
						$('#lista-agendamentos-hoje').append(
								'<div class="col s12 m4 l4">' + cardAgendamento
										+ '</div>');
					});
				},
				error : function(e) {
					console.log("ERROR : " + e);
				}
			});
		});

// Excluir agendamento
function excluirAgendamento(idAgendamento) {
	// Confirmar exclusão
	$.confirm({
		title : 'Exclusão!',
		animation : 'top',
		useBootstrap : false,
		theme : 'material',
		boxWidth : '50%',
		content : 'Deseja excluir agendamento?',
		buttons : {
			// CONFIRMAR
			confirm : {
				text : 'Excluir',
				btnClass : 'btn-red',
				action : function() {
					// Requisição
					$.ajax({
						url : 'adm/agendamento/' + idAgendamento,
						type : "DELETE",
						headers : {
							'Authorization' : localStorage
									.getItem("tokenBigDog")
						},
						success : function(s) {
							// Reload em agendamento, clicando em botão
							$('#btn-agenda-hoje').click();
						},
						error : function(e) {
							Materialize.toast('Ops, houve um problema!');
							console.log('ERROR : ' + e);
						}
					});
				}
			},
			cancel : {
				// CANCELAR
				text : 'Cancelar',
				action : function() {
				}
			}
		}
	});
}
