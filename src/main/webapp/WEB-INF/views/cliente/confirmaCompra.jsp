<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/table.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script type="text/javascript" src="resources/loja/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>
<script type="text/javascript">
	window.onload = function mask() {
		VMasker(document.querySelector(".cep")).maskPattern("99999-999");
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('select').material_select();

		var valueTotalCarrinho = $
		{
			totalCarrinho
		}
		$('select').on("change", function() {
			var valSelect = $("option:selected", this).val();
			valSelect = valSelect.split(",");
			console.log(valSelect[0]);
			console.log(valSelect[1]);

			var data = {
				idProdutoCarrinho : valSelect[1],
				quantidade : valSelect[0]
			}

			$.ajax({
				headers : {
					'Content-Type' : 'application/json'
				},
				type : 'POST',
				url : 'rest/dinamic/alterarQtd',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(data) {
					console.log(data);

					$("#totalCarrinho").html("Total: R$ " + data);
				},
				error : function() {
					console.log('só triteza');
				}
			});

		});
	});
</script>


</head>
<main>
<body>
	<c:import url="component/headerLoja.jsp"></c:import>
	<div class="demo">
		<div id="demo">
			<div class="table-responsive-vertical shadow-z-1">
				<table id="table" class="table table-hover table-mc-light-blue">
					<thead>
						<tr>
							<th>Foto</th>
							<th>Produto</th>
							<th>Quantidade</th>
							<th>Preço</th>
						</tr>
					</thead>
					<c:forEach items="${carrinhos }" var="carrinho">
						<tbody>
							<tr>
								<td data-title="Foto"><img class="imgdg"
									src="resources/loja/imagens/semFoto.png"></td>
								<td data-title="Produto">${carrinho.produto.nome }</td>
								<td data-title="Quantidade">
									<div class="input-field col s12"
										style="max-width: 8em; margin-top: -1em; margin-right: -5em;">
										<select class="selectQtd">
											<option value="${carrinho.quantidade }">${carrinho.quantidade }
											</option>
											<option value="1,${carrinho.idProdutoCarrinho }">1</option>
											<option value="2,${carrinho.idProdutoCarrinho }">2</option>
											<option value="3,${carrinho.idProdutoCarrinho }">3</option>
											<option value="4,${carrinho.idProdutoCarrinho }">4</option>
											<option value="5,${carrinho.idProdutoCarrinho }">5</option>
										</select>
									</div>
								</td>
								<td data-title="Preço">R$ ${carrinho.produto.valor }</td>
								<td><a href="#"><i class="fa fa-times"
										aria-hidden="true" title="Remover Produto"
										style="margin-left: 2em;"></i></a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div class="descricaoProd" style="margin-top: -2em;">

				<div class="row">
					<div class="input-field col s6">
						<input id="first_name2" type="text" class="cep"
							style="width: 30%;"> <label class="active"
							for="first_name2">Calcular o Frete </label>
						<button class="waves-effect waves-light btn"
							style="background-color: black; width: 2.3em; margin-top: 0.5em; height: auto; padding: 0; font-size: 1em">
							OK</a>
					</div>
				</div>
				<div class="desc">

					<h3 id="totalCarrinho">Total: R$ ${totalCarrinho }</h3>
				</div>
				<button class="waves-effect waves-light btn"
					style="margin-left: 40%; margin-top: 1em; background-color: #005900;">
					<a href="pagamento" style="color: white;"><img
						src="resources/loja/imagens/icones/icon-08.png">
						<p style="margin-top: -0.5em; font-size: 15px;">Comprar</p>
				</button>
				</a>
			</div>
		</div>
	</div>
	</div>
</main>
<c:import url="component/footerLoja.jsp"></c:import>

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
