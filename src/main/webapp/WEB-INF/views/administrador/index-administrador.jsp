<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Ícone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/dedicated/img/administrador/adm-icon.ico">

<!-- Título -->
<title>Big Dog | Index Administrador</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/index-administrador.css">

<!-- Script para gráfico de tipo de agendamento -->
<script type="text/javascript" charset="utf-8">
	// Consumir
	function consumir() {
		// Atributos
		var qtdAgendamento = 0;
		var qtdEstetica = 0;
		var qtdVeterinario = 0;

		// Requisição Agendamentos
		$.getJSON({
			url : 'adm/agendamento',
			headers : {
				'Authorization' : localStorage.getItem("tokenBigDog")
			},
			async : false,
			type : 'GET',
			success : function(agendamentos) {
				// Atribuindo quantidade total
				qtdAgendamento = agendamentos.length;

				// Atribuindo valor por tipo de serviço
				$.each(agendamentos, function(key, agendamento) {
					if (agendamento.servico.tipoServico == 'Estetica') {
						qtdEstetica++;
					} else {
						qtdVeterinario++;
					}
				});
			},
			error : function(e) {
				console.log('ERROR : ' + e);
			}
		});

		// Atribuindo valores de porcentagem
		qtdEstetica = (qtdEstetica / qtdAgendamento);
		qtdEstetica *= 100;
		qtdVeterinario = (qtdVeterinario / qtdAgendamento);
		qtdVeterinario *= 100;

		// Gráfico
		Highcharts.chart('container', {
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : 0,
				plotShadow : false
			},
			title : {
				text : 'Tipo de serviço agendado',
				align : 'center',
			},
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.2f}%</b>'
			},
			plotOptions : {
				pie : {
					dataLabels : {
						enabled : true,
						distance : -50,
						style : {
							fontWeight : 'bold',
							color : 'white'
						}
					},
					startAngle : -90,
					endAngle : 90,
					center : [ '50%', '75%' ]
				}
			},
			series : [ {
				type : 'pie',
				name : 'Porcentagem',
				innerSize : '60%',
				data : [ [ 'Estética', qtdEstetica ],
						[ 'Veterinário', qtdVeterinario ], {
							name : 'Proprietary or Undetectable',
							y : 0.2,
							dataLabels : {
								enabled : false
							}
						} ]
			} ]
		});
	}
</script>
</head>
<body>
	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- Main - container principal -->
	<main class="container"> <!-- Row --> <!-- Título e descrição -->
	<div class="row">
		<!-- Section -->
		<div class="section">
			<!-- Título -->
			<h4 class="center-align">Área do Administrador</h4>

			<!-- Divider -->
			<div class="divider"></div>
		</div>
	</div>

	<!-- Tab Links -->
	<div class="row">
		<div class="col s12 m12 l12">
			<!-- Tabs -->
			<ul class="tabs">
				<!-- Dashboarb -->
				<li class="tab col s4 m4 l4"
					onclick="Materialize.fadeInImage('#swipe-dashboard')"><a
					href="#swipe-dashboard"><i
						class="material-icons center blue-text text-blue">trending_up</i>Dashboard</a></li>

				<!-- Gerenciar -->
				<li class="tab col s4 m4 l4"
					onclick="Materialize.fadeInImage('#swipe-gerenciar')"><a
					href="#swipe-gerenciar"><i
						class="material-icons center grey-text text-grey">settings</i>Gerenciar</a></li>

				<!-- Agenda -->
				<li class="tab col s4 m4 l4"
					onclick="Materialize.fadeInImage('#swipe-agenda')"><a
					id="btn-agenda-hoje" href="#swipe-agenda"><i
						class="material-icons center cyan-text text-cyan">event_note</i>Agenda</a></li>
			</ul>
		</div>
	</div>

	<!-- Swipe's -->
	<div class="row">
		<!-- Dashboard -->
		<div id="swipe-dashboard" class="col s12 m12 l12 center">
			<!-- Botão para carregar gráficos -->
			<div class="row">
				<h5 align="center"></h5>

				<a class="waves-effect btn cyan white-text truncate"
					onclick="consumir()"><i class="material-icons left">trending_up</i>Abrir
					Gráficos</a>
			</div>

			<!-- divider -->
			<div class="divider"></div>

			<!-- Caixa pra gráfico -->
			<div class="row">
				<div id="container"
					style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
			</div>
		</div>
		<!-- /.swipe-dashboard -->

		<!-- Gerenciar -->
		<div id="swipe-gerenciar" class="col s12 m12 l12">

			<!-- Descrição de gerenciamento -->
			<h5 align="center">Opções de gerenciamento</h5>

			<!-- divider -->
			<div class="divider"></div>

			<!-- br -->
			<br>

			<!-- Cliente -->
			<div id="#painel-cliente" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-cliente.png"
									class="responsive-img"> <span class="card-title">Cliente</span>
								<a id="btn-gerenciar-cliente"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">recent_actors</i></a>
							</div>
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Consulte clientes.</h6>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Loja -->
			<div id="#painel-loja" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-loja.png"
									class="responsive-img"> <span class="card-title">Loja</span>
								<a id="btn-gerenciar-loja"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">store</i></a>
							</div>
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Gerencie seu pet shop.</h6>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Agenda -->
			<div id="#painel-agenda" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-agenda.png"
									class="responsive-img"> <span class="card-title">Agenda</span>
								<a id="btn-gerenciar-agenda"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">event_note</i></a>
							</div>
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Consulte agenda.</h6>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Serviço -->
			<div id="#painel-servico" class="col s6 m3 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="card hoverable">
							<div class="card-image">
								<img
									src="resources/dedicated/img/administrador/gerenciar/gerenciar-servico.png"
									class="responsive-img"> <span class="card-title">Serviço</span>
								<a id="btn-gerenciar-servico"
									class="btn-floating halfway-fab waves-effect waves-light red"><i
									class="material-icons">pets</i></a>
							</div>
							<div class="card-content center">
								<!-- divider e br -->
								<br>
								<div class="divider"></div>

								<h6 class="red-text text-lighten-2">Gerencie serviços.</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.swipe-gerenciar -->

		<!-- Agenda -->
		<div id="swipe-agenda" class="col s12 m12 l12">
			<div class="row">
				<!-- Descrição para agendamentos de hoje -->
				<h5 align="center">Agendamentos de hoje</h5>

				<!-- Quantidade de agendamentos do dia -->
				<p id="qtd-agendamentos-hoje" align="right"></p>

				<!-- divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Lista de agendamentos -->
				<div id="lista-agendamentos-hoje"></div>
			</div>
		</div>
	</div>
	</main>
	<!-- /.container -->

	<!-- import footer -->
	<c:import url="component/footer.jsp" />

	<!-- Script's dedicado -->
	<!-- JS com AJAX dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/index-administrador.js"
		charset="utf-8" defer></script>

	<!-- Scripts para gráficos -->
	<script src="resources/highcharts/highcharts.js" defer></script>
	<script src="resources/highcharts/exporting.js" defer></script>
</body>
</html>