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

<!-- Ícone de Aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import's CSS -->
<!-- Style navbar -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">

<!-- Swiper min.  -->
<link rel="stylesheet" href="resources/loja/css/swiper.min.css">

<!-- Swiper min. -->
<script type="text/javascript" src="resources/loja/js/swiper.min.js"></script>

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
<body>
	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<main> <!-- Swiper com 2 fotos -->
	<div class="swiper-container" style="z-index: -1;">
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

	<!-- Descrição de lista de produto -->
	<p class="produtos">Produtos</p>

	<!-- Lista de produtos para home --> <c:forEach
		items="${listaProdutosHome }" var="produto">
		<!-- Link de produto -->
		<a href="produto?idProduto=${produto.idProduto }">
			<div class="p" id="pro">
				<!-- Foto -->
				<img src="${produto.fotoString }">

				<!-- Nome e preço -->
				<p>${produto.nome }</p>
				<h2>
					<f:formatNumber type="currency" value="${produto.valor }" />
				</h2>
			</div>
		</a>
		<br>
	</c:forEach> </main>

	<!-- Footer -->
	<footer class="page-footer">
	<div class="container">
		<div class="footer-copyright">
			<div class="container" style="text-align: center;">
				© 2017 Copyright BIG Dog - SENAI Informática <a
					class="grey-text text-lighten-4 right"
					href="https://www.facebook.com/bigdogPETeVET/"><img
					style="margin-top: -0.5em"
					src="resources/loja/imagens/icones/icon-04.png"></a>
			</div>
		</div>
	</footer>

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