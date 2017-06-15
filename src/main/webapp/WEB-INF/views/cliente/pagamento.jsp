<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- T�tulo -->
<title>Big Dog - Bem Vindo</title>

<!-- �cone de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/table.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import JS -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script type="text/javascript" src="resources/loja/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script de inicializa��o de select -->
<script type="text/javascript">
	$(document).ready(function() {
		$('select').material_select();
	});
</script>
</head>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<div class="demo">
		<div id="demo">
			<div class="dvs">
				<h2 id="pg">Pagamento</h2>
			</div>
			<div class="table-responsive-vertical shadow-z-1">
				<table id="table" class="table table-hover table-mc-light-blue">
					<thead>
						<tr>
							<th>Foto</th>
							<th>Nome do Produto</th>
							<th>Quantidade</th>
							<th>Pre�o (unid.)</th>
						</tr>
					</thead>

					<!-- Lista de itens no carrinho -->
					<c:forEach items="${carrinhos }" var="produto">
						<tbody>
							<tr>
								<td data-title="Foto"><img class="imgdg"
									src="${produto.produto.fotoString }"></td>
								<td data-title="Produto">${produto.produto.nome }</td>
								<td data-title="Quantidade">${produto.quantidade }
									</div>
								</td>
								<td data-title="Pre�o"><f:formatNumber type="currency"
										value="${produto.produto.valor }"></f:formatNumber></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>

			<!-- Descri��o -->
			<div class="descricaoProd" style="margin-top: -2em;">
				<div class="row">
					<div class="input-field col s6">
						<!-- Descri��o de endere�os -->
						<h3 style="margin-left: auto; margin-top: auto;">Endere�o de
							Entrega:</h3>

						<!-- Lista de endere�o -->
						<div class="input-field col s12 m12 l12" id="input-f">
							<select id="selectEnderecos">
								<c:forEach items="${clienteLogado.enderecos }" var="endereco">
									<option value="${endereco.idEnderecoCliente }">${endereco.logradouro }</option>
								</c:forEach>
							</select>
						</div>

						<!-- Endere�o selecionado -->
						<p id="pNumero">
							<b>N�mero</b> : ${clienteLogado.enderecos[0].numero }
						</p>
						<p id="pBairro">
							<b>Bairro : </b>${clienteLogado.enderecos[0].bairro }</p>
						<p id="pCidade">
							<b>Cidade : </b>${clienteLogado.enderecos[0].cidade }</p>
						<p class="green-text text-lighten-2">
							<i>Frete Gr�tis</i>
						</p>

					</div>
				</div>

				<!-- Total da compra e bot�es para forma de pagamento -->
				<div class="desc">
					<h5 align="right">
						Total:
						<f:formatNumber type="currency" value="${totalCarrinho }" />
					</h5>

					<br>

					<div align="center">
						<!-- Verifica se h� endere�o -->
						<c:if test="${!empty clienteLogado.enderecos}">
							<button class="waves-effect waves-light btn"
								style="width: 12em; margin-left: 20%; margin-top: 1em; background-color: #005900;">
								<a onclick="pagamentoPagSeguro()" style="color: white;"><img
									src="resources/loja/imagens/icones/icon-08.png">
									<p style="margin-top: -0.5em; font-size: 15px;">Pagseguro</p>
							</button>

							<a onclick="pagamentoBoleto()" style="cursor: pointer;">
								<button class="waves-effect waves-light btn"
									style="width: 12em; margin-left: 1em; margin-top: 1em; background-color: #005900;">
									<img src="resources/loja/imagens/icones/icon-08.png">
									<p style="margin-top: -0.5em; font-size: 15px;">Boleto</p>
								</button>
							</a>
						</c:if>

						<c:if test="${empty clienteLogado.enderecos }">
							<p class="red-text text-lighten-2" align="center">
								Necess�rio endere�o para finalizar compra! Clique <a
									href="novo-endereco"><b>aqui</b></a> para cadastrar um
								endere�o.
							</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Scripts -->
<script type="text/javascript">
	// PagSeguro
	function pagamentoPagSeguro() {
		console.log("pagamento pagseguro");
		redirecionar("pag/pagseguro");
	}

	// Boleto
	function pagamentoBoleto() {
		console.log("pagamentoBoleto");
		redirecionar("pag/gerarBoleto");
	}

	// Redirecionar
	function redirecionar(url) {
		url += "/" + document.getElementById('selectEnderecos').value;
		console.log(document.getElementById('selectEnderecos').value);
		window.location.href = url;
	}
</script>
<script>
	$(document).ready(function() {
		$('.menu-anchor').on('click touchstart', function(e) {
			$('html').toggleClass('menu-active');
			e.preventDefault();
		});

		// Select change
		$('select').on("change", function() {
			// Atributo selecionado
			var valSelect = $("option:selected", this).val();

			// Busca de endere�o
			$.ajax({
				headers : {
					'Content-Type' : 'application/json'
				},
				type : 'GET',
				url : 'rest/dinamic/endereco/' + valSelect,
				dataType : 'json',
				success : function(data) {
					// Atribuindo valores para descri��o de endere�o
					$("#pNumero").html('<b>N�mero</b> : ' + data.numero);
					$("#pBairro").html('<b>Bairro</b> : ' + data.bairro);
					$("#pCidade").html('<b>Cidade</b> : ' + data.cidade);
				},
				error : function(e) {
					console.log('ERROR : ' + e);
				}
			});
		});
	})
</script>
</body>
</html>
