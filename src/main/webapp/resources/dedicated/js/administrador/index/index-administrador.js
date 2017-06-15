// Preloader
$('.preloader-background').delay(2000).fadeOut('slow');
$('.preloader-wrapper').delay(2000).fadeOut();

// Gerenciamento com timeout por causa
// do preloader da página de index
setTimeout(
		function() {
			$("#swipe-gerenciar a").click(
					function() {
						// Atributo
						var tipo = $(this).attr('id').split('-');

						// Verifica tipo de gerenciamento
						if (tipo[2] == 'cliente') {
							// Requisição
							var xhr = new XMLHttpRequest();

							// Tipo, url e async
							xhr.open('GET', "adm/gerenciarCliente", false);

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
							xhr.open('GET', "adm/gerenciarLoja", false);

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
							xhr.open('GET', "adm/gerenciarAgenda", false);

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
							xhr.open('GET', "adm/gerenciarServico", false);

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
			$("#btn-agenda-hoje")
					.click(
							function() {
								// Limpando lista
								$('#lista-agendamentos-hoje').html('');

								// Requisição
								$
										.getJSON({
											url : "adm/agendamentoHoje",
											headers : {
												'Authorization' : localStorage
														.getItem("tokenBigDog")
											},
											type : "GET",
											success : function(agendamentos) {
												// Atribui quantidade para caso
												// null
												if (agendamentos.length == 0) {
													$('#qtd-agendamentos-hoje')
															.text(
																	'Nenhum agendamento marcado para hoje.');
												} else if (agendamentos.length == 1) {
													$('#qtd-agendamentos-hoje')
															.text(
																	'Há '
																			+ agendamentos.length
																			+ ' agendamento marcado para hoje.');
												} else {
													$('#qtd-agendamentos-hoje')
															.text(
																	'Há '
																			+ agendamentos.length
																			+ ' agendamentos marcados para hoje.');
												}

												// Atribui card para cada
												// agendamento
												$
														.each(
																agendamentos,
																function(index,
																		agendamento) {
																	// Atribui 0
																	// para
																	// minutos
																	function addZero(
																			i) {
																		if (i < 10) {
																			i = "0"
																					+ i;
																		}
																		return i;
																	}

																	// Atributos
																	var imgServico;
																	var dataAgendada = new Date(
																			agendamento.dataAgendada);
																	var minutos = addZero(dataAgendada
																			.getMinutes());
																	var telefone;
																	var celular;

																	// Atribui
																	// valor
																	// para
																	// telefone
																	// e celular
																	// para caso
																	// null
																	if (agendamento.cliente.contato.telefone == null) {
																		telefone = "-";
																	} else {
																		telefone = agendamento.cliente.contato.telefone;
																	}
																	if (agendamento.cliente.contato.celular == null) {
																		celular = "-";
																	} else {
																		celular = agendamento.cliente.contato.celular;
																	}

																	// Atribui
																	// valor de
																	// imagem de
																	// acordo
																	// com
																	// serviço
																	if (agendamento.servico.tipoServico == 'Veterinario') {
																		imgServico = 'resources/dedicated/img/'
																				+ 'administrador/gerenciar/'
																				+ 'icone-servico-veterinario.png';
																	} else {
																		imgServico = 'resources/dedicated/img/'
																				+ 'administrador/gerenciar/'
																				+ 'icone-servico-estetica.png';
																	}

																	// Card para
																	// agendamento
																	var cardAgendamento = '<div class="card '
																			+ 'col s12 m12 l12 hoverable '
																			+ 'brown darken-1'
																			+ '">'
																			+ '<div id="card-agendamento-imagem" '
																			+ 'class="card-image waves-effect'
																			+ 'waves-block waves-light">'
																			+ '<img class="activator '
																			+ 'img-agendamento-hoje"'
																			+ 'src="'
																			+ imgServico
																			+ '">'
																			+ '</div>'
																			+ '<div class="card-content">'
																			+ '<span class="card-title activator truncate '
																			+ 'red-text text-lighten-3" title="'
																			+ agendamento.cliente.nome
																			+ '">'
																			+ agendamento.cliente.nome
																			+ '<br><i class="material-icons '
																			+ 'red-text text-lighten-1 '
																			+ 'right">'
																			+ 'keyboard_arrow_up</i></span>'
																			+ '<h6 class="'
																			+ 'white-text"><b>'
																			+ dataAgendada
																					.getHours()
																			+ ':'
																			+ minutos
																			+ '</b>hrs.</h6></div>'
																			+ '<div class="card-reveal brown lighten-1 '
																			+ 'white-text'
																			+ '">'
																			+ '<span class="card-title white-text">'
																			+ 'Informações'
																			+ '<i class="material-icons '
																			+ 'red-text text-lighten-2 '
																			+ 'right">'
																			+ 'keyboard_arrow_down'
																			+ '</i></span>'
																			+ '<div class="divider"></div>'
																			+ '<p><b>Nome do Pet </b>: '
																			+ agendamento.pet.nome
																			+ '</p>'
																			+ '<p> <b>Telefone </b>: '
																			+ telefone
																			+ '<br>'
																			+ '<b>Celular </b>: '
																			+ celular
																			+ '</p>'
																			+ '<p><b>Serviço </b>: '
																			+ agendamento.servico.nome
																			+ '<br>'
																			+ '<b>Valor </b>: R$ '
																			+ agendamento.servico.valor
																					.toFixed(2)
																			+ '<br>'
																			+ '<b>Observações </b>: '
																			+ agendamento.servico.observacao
																			+ '</p>'
																			+ '<div class="divider"></div><br>'
																			+ '<a href="#!" class="red-text '
																			+ 'text-lighten-2 right"'
																			+ 'onclick="excluirAgendamento('
																			+ agendamento.idAgendamento
																			+ ')">'
																			+ '<i class="material-icons">'
																			+ 'delete</i>'
																			+ '</a>'
																			+ '</div></div>';

																	// Atribuindo
																	// card para
																	// lista
																	$(
																			'#lista-agendamentos-hoje')
																			.append(
																					'<div class="col s12 m4 l4">'
																							+ cardAgendamento
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
				$
						.confirm({
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
										$
												.ajax({
													url : 'adm/agendamento/'
															+ idAgendamento,
													type : "DELETE",
													headers : {
														'Authorization' : localStorage
																.getItem("tokenBigDog")
													},
													success : function(s) {
														// Reload em
														// agendamento, clicando
														// em botão
														$('#btn-agenda-hoje')
																.click();
													},
													error : function(e) {
														Materialize
																.toast('Ops, houve um problema!');
														console.log('ERROR : '
																+ e);
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
		}, 2100);