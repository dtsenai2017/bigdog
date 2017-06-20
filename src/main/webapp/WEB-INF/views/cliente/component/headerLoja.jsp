<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<menu>
	<div class="menu">
		<h3>Menu</h3>
		<span class="menu-anchor mendois"></span>

	</div>
	<ul>
		<li><a href="home">Home</a></li>
		<li><a href="categoria">Produtos</a></li>
		<li><a href="sobreNos">Sobre Nós</a></li>
	</ul>
</menu>

<!-- Navbar -->
<div class="total">
	<!-- Header -->
	<header>
		<!-- Logo -->
		<span class="menu-anchor menum"></span> <a href="home"><img
			class="img" src="resources/loja/imagens/logos/logo02.png"
			style="display: block;"></a>

		<!-- Links de cliente -->
		<div class="dc">
			<!-- Entrar ou Home -->
			<a href="${clienteLogado != null ? 'home-user':'entrar' }"> <img
				class="icon01" src="resources/loja/imagens/icones/icon-01.png">
			</a>

			<!-- Carrinho de compra -->
			<c:if test="${clienteLogado != null }">
				<a href="confirmarCompra"><img class="icon03"
					src="resources/loja/imagens/icones/icon-03.png"></a>
			</c:if>
		</div>

		<!-- Barra de pesquisa -->
		<form action="search" method="post">
			<input type="search" name="busca" class="search"
				placeholder="Busque um produto"> <a><button
					class="button" type="submit">
					<img src="resources/loja/imagens/icones/icon-02.png">
				</button></a>
		</form>

		<!-- Nome do cliente -->
		<h3 id="nomeClienteHeader"></h3>
	</header>

	<!-- Script -->
	<script type="text/javascript">
		window.onload = function headerNome() {
			var nomeCompleto = "${clienteLogado.nome }";
			var primeiro = nomeCompleto.split(" ")[0];

			var vector = [ nomeCompleto.split(" ") ];
			var ultimo = vector[0][vector[0].length - 1];

			var completo = primeiro + " " + ultimo;

			document.getElementById("nomeClienteHeader").innerHTML = completo;
		}
	</script>