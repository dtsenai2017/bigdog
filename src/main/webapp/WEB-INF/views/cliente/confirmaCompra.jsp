<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Ícone de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- CSS imports -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/table.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- JS imports -->
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script type="text/javascript" src="resources/loja/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>

<!-- Máscara de cep -->
<script type="text/javascript">
	window.onload = function mask() {
		VMasker(document.querySelector(".cep")).maskPattern("99999-999");
	}
</script>

<!-- Alterar quantidade de produto no carrinho -->
<script type="text/javascript">
	$(document).ready(function() {
		// Inicializador do select materialize
		$('select').material_select();

		// Select on change
		$('select').on("change", function() {
			var valSelect = $("option:selected", this).val();
			var valCliente = $('#idCliente').val();
			valSelect = valSelect.split(",");

			var data = {
				idProdutoCarrinho : valSelect[1],
				quantidade : valSelect[0]
			}

			$.ajax({
				headers : {
					'Content-Type' : 'application/json'
				},
				type : 'POST',
				url : 'rest/dinamic/alterarQtd/' + valCliente,
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(data) {
					$("#totalCarrinho").html("Total : R$ " + data.toFixed(2));
				},
				error : function(e) {
					console.log('ERROR : ' + e);
				}
			});
		});
	});
</script>

<!-- Excluir produto -->
<script type="text/javascript">
	function excluirProduto(data) {
		$('#' + data).remove();
		var valCliente = $('#idCliente').val();

		// Excluindo...
		$.ajax({
			headers : {
				'Content-Type' : 'application/json'
			},
			type : 'DELETE',
			url : 'rest/dinamic/excluirItem/' + data + '/' + valCliente,
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(data) {
				$("#totalCarrinho").html("Total: R$ " + data.toFixed(2));
			}
		});
	}
</script>
</head>
<main>
<body>
	<!-- Import Header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Locale para fmt money -->
	<f:setLocale value="pt-BR" />

	<div class="demo">
		<div id="demo">
			<div class="dvs">
				<h2 id="pg">Carrinho</h2>
			</div>
			<!-- Tabela de produtos no carrinho -->
			<div class="table-responsive-vertical shadow-z-1">
				<table id="table" class="table table-hover table-mc-light-blue">
					<!-- Head -->
					<thead>
						<tr>
							<th>Foto</th>
							<th>Produto</th>
							<th>Quantidade</th>
							<th>Preço (unid.)</th>
							<th>Remover</th>
						</tr>
					</thead>

					<!-- Lista de itens no carrinho -->
					<c:forEach items="${carrinhos }" var="carrinho">
						<tbody>
							<tr id="${carrinho.idProdutoCarrinho}">
								<!-- Foto do produto -->
								<td data-title="Foto"><img class="imgdg"
									src="${carrinho.produto.fotoString }"></td>

								<!-- Nome do produto -->
								<td data-title="Produto">${carrinho.produto.nome }</td>

								<!-- Quantidade do produto para compra -->
								<td data-title="Quantidade">
									<div class="input-field col s12"
										style="max-width: 8em; margin-top: -1em; margin-right: -5em;">
										<select id="selectQtdPCarrinho" class="selectQtd">
											<option
												value="${carrinho.quantidade },${carrinho.idProdutoCarrinho },${carrinho.produto.qtdEstoque }"><i>${carrinho.quantidade == 1 ? 1 :
												carrinho.quantidade }</i></option>
											<option
												value="1,${carrinho.idProdutoCarrinho },${carrinho.produto.qtdEstoque }">1</option>
											<option
												value="2,${carrinho.idProdutoCarrinho },${carrinho.produto.qtdEstoque }">2</option>
											<option
												value="3,${carrinho.idProdutoCarrinho },${carrinho.produto.qtdEstoque }">3</option>
											<option
												value="4,${carrinho.idProdutoCarrinho },${carrinho.produto.qtdEstoque }">4</option>
											<option
												value="5,${carrinho.idProdutoCarrinho },${carrinho.produto.qtdEstoque }">5</option>
										</select>
									</div>
								</td>

								<!-- Preço -->
								<td data-title="Preço"><f:formatNumber type="currency"
										value="${carrinho.produto.valor }"></f:formatNumber></td>
								<td>
									<!-- Botão para excluir produto --> <a
									onclick="excluirProduto('${carrinho.idProdutoCarrinho}')"><i
										class="fa fa-times" aria-hidden="true" title="Remover Produto"
										style="margin-left: 2em;"></i></a>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>

			<!-- Descrição de produto -->
			<div class="descricaoProd" style="margin-top: -2em;">
				<!-- Valor total de carrinho -->
				<div class="desc">
					<input type="hidden" id="idCliente"
						value="${clienteLogado.idCliente }">
					<h3 id="totalCarrinho">
						Total :
						<f:formatNumber type="currency" value="${totalCarrinho }" />
					</h3>
				</div>

				<!-- Botão para comprar (pagamento) -->
				<button class="waves-effect waves-light btn"
					style="margin-left: 40%; margin-top: 1em; background-color: #005900;">
					<a href="pagamento" style="color: white;"><img
						src="resources/loja/imagens/icones/icon-08.png">
						<p style="margin-top: -0.5em; font-size: 15px;">Pagamento</p> </a>
				</button>
			</div>
		</div>
	</div>
</main>

<!-- Footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Script para menu lateral -->
<script>
	$(document).ready(function() {
		$('.menu-anchor').on('click touchstart', function(e) {
			$('html').toggleClass('menu-active');
			e.preventDefault();
		});
	})
</script>

<!-- Script para verificar se quantidade é valida -->
<script type="text/javascript">
	// Verifica quantidade pelo select...
	$("#selectQtdPCarrinho").change(
			function() {
				// Atributos
				var valSelect = $("#selectQtdPCarrinho").val().split(',');
				var qtdSelecionada = valSelect[0];
				var qtdDisponivel = valSelect[2];

				// Verifica possibilidade de selecionar determinada quantidade
				if (qtdSelecionada > 0 && qtdSelecionada <= qtdDisponivel) {
					// ...
					// "Quantidade aceita"
				} else if (qtdSelecionada > qtdDisponivel) {
					// "Quantidade não aceita. Maior..."
					// Seleciona valor 1 em quantidade de itens no carrinho
					$('#selectQtdPCarrinho').val('1').attr('select', true);

					// Atualizando select
					$("select").material_select('update');

					// Toast
					Materialize.toast(
							"Não foi possível selecionar esta quantidade!",
							3000);
					setTimeout(function() {
						Materialize.toast("Há apenas " + qtdDisponivel
								+ " produto(s) disponível(is).", 3000);
					}, 3100);
				}
			});
</script>
</body>
</html>
