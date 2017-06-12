<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Ícone de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
</head>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp" />

	<!-- Caixa para produtos -->
	<div class="totalP">
		<!-- Descrição de lista categoria -->
		<p class="produtos">Categoria : ${cat.nome }</p>

		<!-- Menu -->
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Categorias
		</div>

		<!-- Lista de categoria -->
		<ul id="ul">
			<h3 style="color: #DC0909; padding: 0.5em;">Selecione uma
				Categoria</h3>

			<!-- divider -->
			<div class="divider"></div>

			<!-- Lista de categorias e subcategorias -->
			<c:forEach items="${listaCategoria }" var="categoria">
				<li class="sb" value="${categoria.idCategoria }"
					onclick="teste(this.value)"><b>${categoria.nome }</b></li>
				<ul id="ull" class="a${categoria.idCategoria }">
				</ul>
			</c:forEach>
		</ul>

		<!-- Lista de produto encontrados -->
		<div class="cx05">
			<c:forEach items="${listaProduto }" var="produto">
				<br>
				<a href="produto?idProduto=${produto.idProduto }">
					<div class="p">
						<img src="${produto.fotoString }">
						<p>${produto.nome }</p>
						<h2>
							<f:formatNumber type="currency" value="${produto.valor }" />
						</h2>
					</div>
				</a>
				<br>
			</c:forEach>
		</div>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript" src="resources/loja/js/categoria.js"></script>

<!-- Script's -->
<!-- Lista de categoria -->
<script>
	$(".menuu").click(function() {

		$("#ul").toggle();
	});
</script>

<!-- Menu lateral -->
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