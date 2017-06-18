<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Logo da aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
</head>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Menu do cliente -->
	<div class="cxAvatar">
		<!-- Ícone -->
		<img
			src="resources/loja/imagens/icones/${clienteLogado.genero == 'Masculino' ? 'man-icon':'female-icon' }.png"
			class="avatar" title="${clienteLogado.nome }">

		<!-- Nome do cliente -->
		<div class="cx08">
			<h2>${clienteLogado.nome }</h2>
		</div>

		<!-- Menu -->
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>

		<!-- Link de menu -->
		<div class="cx05">
			<ul id="ul">
				<li id="pf"><a href="home-user"><i class="fa fa-home"
						aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png"> Meus Pets</a></li>
				<li><a href="listPedidos"><i class="fa fa-shopping-cart"
						aria-hidden="true"></i> Pedidos</a></li>
				<li class="id"><a href="listAgendamentos"><i
						class="fa fa-calendar" aria-hidden="true"></i> Agendamentos</a></li>
				<li><a href="logout"><i class="fa fa-sign-in"
						aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>
		<div class="cx03">
			<i class="fa fa-calendar" aria-hidden="true"></i> Novo Agendamento
		</div>

		<!-- Formulário de agendamento -->
		<form id="form" class="form">

			<c:if test="${existePet == true }">
				<div class="input-field col s12" id="input-f">
					<label class="active" for="f1" style="margin-left: -1em;">Tipo
						de Serviço</label> <select id="selectTipoServico" required>
						<option value="0">Selecione uma opção</option>
						<option value="1">Veterinário</option>
						<option value="0">Estética</option>
					</select>
				</div>
			</c:if>
			<c:if test="${existePet == false }">
				<p>
					<a href="novo-pet">Para fazer um agendamento você precisa de um
						pet!, Clique aqui para cadastrar.</a>
				</p>
				<div class="input-field col s12" id="input-f">
					<label class="active" for="f1" style="margin-left: -1em;">Tipo
						de Serviço</label> <select id="selectTipoServico" disabled required>
						<option value="0">Selecione uma opção</option>
						<option value="1">Veterinário</option>
						<option value="0">Estética</option>
					</select>
				</div>
			</c:if>
			<input type="hidden" id="idCliente"
				value="${clienteLogado.idCliente }">
			<div class="input-field col s12" id="input-f">
				<label class="active" for="f1" style="margin-left: -1em;">Serviço
					a ser realizado</label> <select id="selectServicos" disabled>

				</select>
			</div>

			<div class="input-field col s12" id="input-f">
				<label class="active" for="first_name2" style="margin-left: -1em;">Selecione
					uma data</label> <input type="date" id="inputDataMarcada" disabled>
			</div>

			<div class="input-field col s12" id="input-f"
				style="margin-top: 10px; margin-bottom: 50px;">
				<a id="buscarHorario" style="cursor: pointer;"></a>
			</div>

			<div class="input-field col s12" id="input-f">
				<label class="active" for="first_name2" style="margin-left: -1em;">Horário</label>
				<select id="selectHorario" disabled required>
					<option>Selecione um horario</option>
				</select>
			</div>

			<div class="divp" style="margin-top: 5em;">
				<div class="input-field col s12" id="input-f asd">
					<label class="active" for="f3" style="margin-left: -1em;">Pet</label>
					<select id="selectPet" disabled required>
						<c:forEach var="pet" items="${clienteLogado.pets }">
							<option value="${pet.idPet }">${pet.nome }</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- br -->
			<br>

			<!-- Serviço selecionado -->
			<div style="width: 100%; height: auto;">
				<h6>Descrição de Serviço</h6>

				<div class="divider"></div>

				<p id="tempoEstimado" style="font-size: 12px;">
					<b>Tempo Estimado</b> :
				</p>
				<p id="preco" style="font-size: 12px;">
					<b>Preço</b> :
				</p>
				<p id="descricao" style="font-size: 12px;">
					<b>Descrição</b> :
				</p>
			</div>

			<!-- br -->
			<br>

			<!-- Botão para agendar -->
			<a href="">
				<button type="button" id="btnAgendar" class="btn brown" disabled>
					Confirmar
					<div class="ripples buttonRipples">
						<span class="ripplesCircle"></span>
					</div>
				</button>
			</a>
		</form>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script's -->
<script>
	$(document).ready(
			function() {

				$(".button-collapse").sideNav();
				Materialize.updateTextFields();
				$('select').material_select();
				$("#ul").toggle();

				$('.menu-anchor').on('click touchstart', function(e) {
					$('html').toggleClass('menu-active');
					e.preventDefault();
				});

				// Função para agendar
				$('#btnAgendar').click(
						function agendar() {
							// Data
							var data = $('#selectHorario option:selected')
									.val()
									+ ' '
									+ $('#selectHorario option:selected')
											.text();

							// Agendamento
							var agendamento = {
								servico : {
									idServico : $('#selectServicos').val()
								},
								cliente : {
									idCliente : $('#idCliente').val()
								},
								pet : {
									idPet : $('#selectPet').val()
								}
							}

							$.ajax({
								headers : {
									'Content-Type' : 'application/json'
								},
								type : 'POST',
								url : 'rest/agendar/' + data,
								dataType : 'json',
								data : JSON.stringify(agendamento),
								success : function(data) {
								},
								error : function(e){
									console.log('ERROR : ' + e);
								}
								
							});
						});

				// Horarios livres para o dia selecionado
				$('#buscarHorario').click(
						function buscarHorarios() {
							var valData = $('#inputDataMarcada').val();
							
							valData += ' 09:00:00';

							$.ajax({
								headers : {
									'Content-Type' : 'application/json'
								},
								type : 'GET',
								url : 'rest/agendar/' + valData + '/'
										+ $('#selectTipoServico').val() + '/'
										+ $('#selectServicos').val(),
								dataType : 'json',
								success : function(data) {
									// Verifica data
									if (data.length > 0) {
										tratarInputsFinais(data);
										$('#selectHorario').material_select();
										$('#selectPet').material_select();
										
										$.ajax({
											headers : {
												'Content-Type' : 'application/json'
											},
											type : 'GET',
											url : 'rest/dinamic/servico/' + valSelect,
											dataType : 'json',
											success : function(data) {
												// Atribui valor para descrições								
												$('#tempoEstimado').empty();
												$('#tempoEstimado').append('<b>Tempo estimado</b> : ' + data.tempoEstimado);
												$('#preco').empty();
												$('#preco').append('<b>Preço</b> : R$' + data.valor.toFixed(2));
												$('#descricao').empty();
												$('#descricao').append(
														'<b>Descrição</b>  : ' + data.observacao);
											},
											error : function(e) {
												console.log('ERROR : ' + e);
											}
										});
									} else {
										Materialize.toast("Selecione uma data válida!", 2000);
									}	
									
								},
								error : function(e) {
									console.log('ERROR : '+ e);
								}
							});
						});
				
				// Popula os camos de horario e pet, e desbloqueia
				function tratarInputsFinais(horarios) {
					$('#selectHorario').find('option').remove().end();

					for (var int = 0; int < horarios.length; int++) {
						$('#selectHorario').append(
								'<option value='+ horarios[int] +' >'
										+ horarios[int].substring(10, 19)
										+ '</option>');
					}

					$('#selectHorario').prop("disabled", false);
					$('#selectPet').prop("disabled", false);
					$('#btnAgendar').prop("disabled", false);
				}

				$('#selectServicos').on(
						"change",
						function() {

							if ($('#selectHorario').is(':enabled')) {
								$('#selectHorario').prop("disabled", true);
								$('#selectPet').prop("disabled", true);
								$('#selectHorario').material_select();
								$('#selectPet').material_select();
							}

							var valSelect = $("option:selected", this).val();
							$.ajax({
								headers : {
									'Content-Type' : 'application/json'
								},
								type : 'GET',
								url : 'rest/dinamic/servico/' + valSelect,
								dataType : 'json',
								success : function(data) {
									// Atribuindo valores para descrição de serviço
									$('#tempoEstimado').empty();
									$('#tempoEstimado').append('<b>Tempo estimado</b> : ' + data.tempoEstimado);
									$('#preco').empty();
									$('#preco').append('<b>Preço</b> : R$' + data.valor.toFixed(2));
									$('#descricao').empty();
									$('#descricao').append(
											'<b>Descrição</b>  : ' + data.observacao);
								},
								error : function(e) {
									console.log('ERROR : ' + e);
								}
							});

						});

				// Input data marcada change
				$('#inputDataMarcada').on("change", function() {
					if ($('#selectHorario').is(':enabled')) {
						$('#selectHorario').prop("disabled", true);
						$('#selectPet').prop("disabled", true);
						$('#selectHorario').material_select();
						$('#selectPet').material_select();
						$('#btnAgendar').prop("disabled", true);
					}
				});

				// Procura os servicos do tipo selecionado, assim que o select é selecionado
				$('#selectTipoServico').on("change", function() {
					// Habilita campos de select
					if ($('#selectHorario').is(':enabled')) {
						$('#selectHorario').prop("disabled", true);
						$('#selectPet').prop("disabled", true);
						$('#selectHorario').material_select();
						$('#selectPet').material_select();
						$('#btnAgendar').prop("disabled", true);
					}

					// Recebe valor do tipo de serviço selecionado
					var valSelect = $("option:selected", this).val();

					// Requisição para listar serviços do tipo selecionado
					$.ajax({
						headers : {
							'Content-Type' : 'application/json'
						},
						type : 'GET',
						url : 'rest/dinamic/agendar/servico/' + valSelect,
						dataType : 'json',
						success : function(data) {
							tratarDadosInputs(data);
							$('#selectServicos').material_select();
							Materialize.updateTextFields();

						},
						error : function() {
							console.log('ERROR : '+ e);
						}
					});

				});

				// Popula e remove os servicos
				function tratarDadosInputs(dados) {

					$('#selectServicos').find('option').remove().end();

					for (var int = 0; int < dados.length; int++) {
						$('#selectServicos').append(
								'<option value='+ dados[int].idServico +' >'
										+ dados[int].nome + '</option>');
					}

					$('#selectServicos').prop("disabled", false);
					$('#inputDataMarcada').prop("disabled", false);
					$('#buscarHorario').empty();
					$('#buscarHorario').append('Horários disponíveis');
					$('#buscarHorario').addClass('btn');
					$('#buscarHorario').addClass('cyan');
				}

			});
</script>
</body>
</html>