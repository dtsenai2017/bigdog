<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>Big Dog - Bem Vindo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link rel="stylesheet" href="resources/loja/css/swiper.min.css">
<script type="text/javascript" src="resources/loja/js/swiper.min.js"></script>
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

</head>
<main>
<body>
	<c:import url="component/headerLoja.jsp"></c:import>
	<div class="swiper-container" style="z-index: -1;">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="resources/loja/imagens/img01.jpg">
			</div>
			<div class="swiper-slide">
				<img src="resources/loja/imagens/img02.jpg">
			</div>
			<div class="swiper-slide">
				<img src="resources/loja/imagens/img01.jpg">
			</div>

		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>

	<p class="produtos">Produtos</p>

	<c:forEach items="${listaProdutosHome }" var="produto">
		<a href="produto?idProduto=${produto.idProduto }">
			<div class="p" id="pro">
				<img src="resources/loja/imagens/semFoto.png">
				<p>${produto.nome }
				<h2>
					R$
					<f:formatNumber type="number" maxFractionDigits="3"
						value="${produto.valor }"></f:formatNumber>
				</h2>
			</div>
		</a>
		<br>
	</c:forEach>
	</div>
</main>
<footer class="page-footer">
	<div class="container">
		<div class="footer-copyright">
			<div class="container" style="text-align: center;">
				� 2017 Copyright BIG Dog - SENAI Inform�tica <a
					class="grey-text text-lighten-4 right"
					href="https://www.facebook.com/bigdogPETeVET/"><img
					style="margin-top: -0.5em"
					src="resources/loja/imagens/icones/icon-04.png"></a>
			</div>
		</div>
</footer>

<script type="text/javascript" src="resources/jquery/jquery-3.2.1.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<script>
	var swiper = new Swiper('.swiper-container', {
		pagination : '.swiper-pagination',
		nextButton : '.swiper-button-next',
		prevButton : '.swiper-button-prev',
		slidesPerView : 1,
		paginationClickable : true,
		spaceBetween : 30,
		loop : true,
		autoplay : 2500,
		autoplayDisableOnInteraction : false
	});
</script>
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