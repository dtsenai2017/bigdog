<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Ícone da aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- CSS dedicado -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/sobre-nos.css">

<!-- Materialize CSS min. -->
<link rel="stylesheet" href="resources/materialize/css/materialize.css">

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Import's JS -->
<!-- JQuery -->
<script src="resources/jquery/jquery-3.2.1.js" defer></script>

<!-- Materialize min. -->
<script type="text/javascript"
	src="resources/materialize/js/materialize.min.js" defer></script>

<!-- Título -->
<title>Big Dog - Sobre Nós</title>
</head>
<body>
	<!-- Banner -->
	<div class="row">
		<img id="banner-sobre-nos"
			src="resources/loja/imagens/banner-sobre-nos.png">
	</div>

	<!-- Informações -->
	<div class="container">
		<!-- Título -->
		<div class="row">
			<div class="col s12 m12 l12">
				<h4 align="center">
					<i class="material-icons red-text text-accent-1 left">pets</i> <b>Sobre
						nós</b> <i class="material-icons red-text text-accent-1 right">pets</i>
				</h4>
			</div>
		</div>

		<!-- divider -->
		<div class="divider"></div>

		<!-- br -->
		<br>

		<!-- Missão -->
		<div id="r-missao" class="row">
			<div class="col s12 m12 l12">
				<h5>Missão</h5>

				<p>"Oferecer atendimento veterinário e de estética capacitados e
					também produtos de qualidade, cuidando também com respeito, carinho
					e dedicação de todo e qualquer animal, visando sempre atender
					nossos clientes da melhor forma possível."</p>
			</div>
		</div>

		<!-- Visão -->
		<div id="r-visao" class="row">
			<div class="col s12 m12 l12">
				<h5>Visão</h5>

				<p>"Ser reconhecida como centro veterinário e de estética de
					referência no segmento pet, através da excelência em nossos
					serviços."</p>
			</div>
		</div>

		<!-- Valores -->
		<div id="r-valores" class="row">
			<div class="col s12 m12 l12">
				<h5>Valores</h5>

				<p>
					"<b>Ética, transparência e honestidade</b>; Prestação de serviços
					de qualidade, <b>priorizando</b> o bem estar animal; Atendimento <b>diferenciado</b>
					e de <b>alta qualidade</b>, em favor da satisfação do cliente; <b>Criatividade</b>
					para ousar e inovar a cada dia; <b>Comprometimento</b> em tudo
					aquilo que nos dispusermos a fazer."
				</p>
			</div>
		</div>

		<!-- Contato -->
		<div class="row brown lighten-5">
			<div class="col s12 m12 l12 grey lighten-4">
				<h5 align="center">Contato</h5>
			</div>

			<!-- Contato (Telefone, Email) -->
			<div class="col s4 m4 l4 center grey lighten-4">
				<!-- divider -->
				<div class="divider white"></div>

				<p>
					<b>Telefone </b>
				<p>
					<b>Email </b>
				<p>
					<b>Horário </b>
				</p>
			</div>

			<!-- Dados de Contato (Telefone, Email) -->
			<div class="col s8 m8 l8 center grey lighten-4">
				<!-- divider -->
				<div class="divider white"></div>

				<p>(011) 4201-1807</p>
				<p>bigdogcentroveterinario@gmail.com</p>
				<p>08:00 às 19:00</p>
			</div>
		</div>

		<!-- Desc desenvolvimento -->
		<p align="right" class="red-text text-lighten-3"
			style="font-size: 10px;">
			Powered by <b>SENAI</b>
		</p>

		<!-- Localização -->
		<div class="row">
			<!-- Imagem de contato -->
			<div class="col s12 m12 l12">
				<!-- Descrição de mapa -->
				<h5 align="center">Localização</h5>

				<!-- divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Link e Mapa Google -->
				<p id="link-google-maps" align="right">
					<a
						href="https://www.google.com.br/maps/place/Av.+Z%C3%A9lia,+255+-+Parque+dos+Camargos,+Barueri+-+SP/@-23.5342111,-46.8926943,17z/data=!3m1!4b1!4m5!3m4!1s0x94cf0144524ecdcf:0x72ac06bb135c420d!8m2!3d-23.5342111!4d-46.8905056">Abrir
						no <b>Google Maps</b><i class="material-icons">room</i>
					</a>
				</p>
				<div id="mapa" class="hoverable"></div>
			</div>
		</div>

		<!-- Botão site -->
		<div class="row">
			<div class="col s12 m12 l12 center">
				<a class="waves-effect waves-light btn red" href="home"><i
					class="material-icons left white-text">navigate_before</i>Voltar
					para site</a>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<c:import url="component/footerLoja.jsp"></c:import>

	<!-- Import's JS -->
	<!-- JS dedicado -->
	<script src="resources/loja/js/sobre-nos.js" defer></script>

	<!-- Google maps -->
	<script type="text/javascript">
		// Atributo para map
		var map;
		var myLatLng = {
			lat : -23.5340306,
			lng : -46.8906668
		};

		// Atribuir mapa
		function myMap() {
			map = new google.maps.Map(document.getElementById('mapa'), {
				center : myLatLng,
				zoom : 18
			});

			var marker = new google.maps.Marker({
				position : myLatLng,
				map : map,
				title : 'BIG DOG!'
			});
		}
	</script>

	<!-- Google Maps API -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCat7Wfy1X_7DGrI2QZsC4foGWUP-Y82Xc&callback=myMap"
		async defer></script>
</body>
</html>