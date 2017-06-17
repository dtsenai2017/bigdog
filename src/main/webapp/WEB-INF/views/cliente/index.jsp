<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- �cone de Aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- T�tulo -->
<title>Big Dog - Bem Vindo</title>

<!-- Import's CSS -->
<!-- Style navbar -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">

<!-- Swiper min.  -->
<link rel="stylesheet" href="resources/loja/css/swiper.min.css">

<!-- Materialize modificado -->
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import's JS -->
<!-- Menu -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>

<!-- Swiper min. -->
<script type="text/javascript" src="resources/loja/js/swiper.min.js"></script>
</head>
<main>
<body style="background-color: white;">
	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Swiper com 2 fotos -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="resources/loja/imagens/img01.jpg">
			</div>
			<div class="swiper-slide">
				<img src="resources/loja/imagens/img02.jpg">
			</div>
		</div>

		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>

		<!-- Paging Pagination -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>

	<!-- T�tulo de servi�os -->
	<p class="produtos">Servi�os</p>

	<!-- Servi�o de Est�tica -->
	<div class="sv" id="textSv">
		<img src="resources/loja/imagens/icones/iconEst.png"> <a
			href="novo-agendamento">
			<h2>Est�tica Animal</h2>
			<p>Entregar seu Pet bonito e cheiroso � a nossa maior
				preocupa��o. Para isso, dispomos de uma �tima estrutura para que
				nossos pets possam ter o melhor conforto poss�vel. Contamos com
				profissionais qualificados que cuidar�o com muito carinho do seu
				bichinho. E agora voc� n�o precisa sair de casa para agendar um
				servi�o. Conhe�a nossa plataforma virtual, basta realizar o cadastro
				e agendar um de nossos servi�os. Ent�o voc� j� sabe, banho & tosa �
				aqui.</p>
		</a>
	</div>

	<!-- Servi�o Veterin�rio -->
	<div class="sv">
		<!-- �cone de servi�o -->
		<img src="resources/loja/imagens/icones/iconVet.png"> <a
			href="novo-agendamento"> <!-- T�tulo e descri��o -->
			<h2>Veterin�rio</h2>
			<p>Todos n�s precisamos estar em dia com a sa�de, inclusive
				nossos Pets. Para isso contamos com um Veterin�rio apto para atender
				seu animal. Agende uma consulta e deixe seu Pet em dia com a sa�de.
				E agora voc� n�o precisa sair de casa para agendar uma consulta.
				Conhe�a nossa plataforma virtual, basta realizar o cadastro e
				agendar uma consulta. Ent�o voc� j� sabe, Veterin�rio � aqui.</p>
		</a>
	</div>

	<!-- Linha hr -->
	<div id="linha"></div>

	<!-- Descri��o de lista de produto -->
	<p class="produtos">Produtos</p>

	<!-- Lista de produtos para home -->
	<c:forEach items="${listaProdutosHome }" var="produto">
		<!-- Link de produto -->
		<a href="produto?idProduto=${produto.idProduto }">
			<div id="pro" class="p">
				<!-- Foto -->
				<img src="${produto.fotoString }">

				<!-- Nome e pre�o -->
				<p>${produto.nome }</p>
				<h2>
					<f:formatNumber type="currency" value="${produto.valor }" />
				</h2>
			</div> <!-- br mobile -->
		</a>
		<br>
	</c:forEach>
</main>

<!-- Footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script type="text/javascript" src="resources/jquery/jquery-3.2.1.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script's -->
<!-- Swipe -->
<script>
	var swiper = new Swiper('.swiper-container', {
		pagination : '.swiper-pagination',
		nextButton : '.swiper-button-next',
		prevButton : '.swiper-button-prev',
		slidesPerView : 1,
		paginationClickable : true,
		spaceBetween : 30,
		loop : true,
		autoplay : 3500,
		autoplayDisableOnInteraction : false
	});
</script>

<!-- Menu -->
<script>
	$(document).ready(function() {
		$('.menu-anchor').on('click touchstart', function(e) {
			$('html').toggleClass('menu-active');
			e.preventDefault();
		});
	})
</script>
</body>
</html>