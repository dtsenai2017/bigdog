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
		<img src="resources/loja/imagens/icones/avatarMasc.png" class="avatar">
		<div class="cx08">
			<h2>${clienteLogado.nome }</h2>
		</div>
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>
		<div class="cx05">
			<ul id="ul">
				<li id="pf"><a href="home-user"><i class="fa fa-home"
						aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png">
						<p id="lip">Meus Pets</p></a></li>
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
			<div class="input-field col s12" id="input-f">
				<label class="active" for="f1" style="margin-left: -1em;">Tipo
					de Serviço</label> <select id="selectTipoServico" required>
					<option value="0">Selecione uma opção</option>
					<option value="1">Veterinário</option>
					<option value="0">Estética</option>
				</select>
			</div>
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

			<div style="width: 100%; height: auto;">
				<p id="descricao">
					<b>Descrição</b> :
				</p>
				<p id="tempoEstimado">
					<b>Tempo estimado do serviço</b> :
				</p>
				<p id="preco">
					<b>Preço</b> :
				</p>
			</div>

			<a href="">
				<button type="button" id="btnAgendar" class="btn brown">
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
									tratarInputsFinais(data);
									$('#selectHorario').material_select();
									$('#selectPet').material_select();
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
									$('#descricao').empty();
									$('#descricao').append(
											'<p>Descrição: ' + data.observacao
													+ '</p>');
									$('#tempoEstimado').empty();
									$('#tempoEstimado').append(
											'<p>Tempo Estimado: '
													+ data.tempoEstimado
													+ '</p>');
									$('#preco').empty();
									$('#preco').append('Preco: ' + data.valor);

								},
								error : function(e) {
									console.log('ERROR : ' + e);
								}
							});

						});

				$('#inputDataMarcada').on("change", function() {

					if ($('#selectHorario').is(':enabled')) {
						$('#selectHorario').prop("disabled", true);
						$('#selectPet').prop("disabled", true);
						$('#selectHorario').material_select();
						$('#selectPet').material_select();
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
