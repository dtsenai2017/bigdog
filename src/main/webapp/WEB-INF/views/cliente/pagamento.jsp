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

<script type="text/javascript"
	src="resources/jquery/jquery-2.2.2.min.js" /></script>
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script type="text/javascript" src="resources/loja/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('select').material_select();

	});
</script>
</head>
<main>
<body>
	<c:import url="component/headerLoja.jsp"></c:import>
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
							<th>Produto</th>
							<th>Quantidade</th>
							<th>Preço</th>
						</tr>
					</thead>
					<c:forEach items="${carrinhos }" var="produto">
						<tbody>
							<tr>
								<td data-title="Foto"><img class="imgdg"
									src="resources/loja/imagens/semFoto.png"></td>
								<td data-title="Produto">${produto.produto.nome }</td>
								<td data-title="Quantidade">${produto.quantidade }
									</div>
								</td>
								<td data-title="Preço">R$ ${produto.produto.valor }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div class="descricaoProd" style="margin-top: -2em;">
				<div class="row">
					<div class="input-field col s6">
						<h3 style="margin-left: auto; margin-top: auto;">Endereço de
							Entrega:</h3>
						<div class="input-field col s12" id="input-f">
							<select id="selectEnderecos">
								<c:forEach items="${clienteLogado.enderecos }" var="endereco">
									<option value="${endereco.idEnderecoCliente }">${endereco.logradouro }</option>
								</c:forEach>
							</select>
						</div>
						<p id="pLogradouro">${clienteLogado.enderecos[0].logradouro }
						</p>
						<p id="pNumero">Número: ${clienteLogado.enderecos[0].numero }
						</p>
						<p id="pBairro">${clienteLogado.enderecos[0].bairro }</p>
						<p id="pCidade">${clienteLogado.enderecos[0].cidade }</p>
						<p>
							<b>Frete Grátis</b>
						</p>

					</div>
				</div>
				<div class="desc">

					<h3>Total: R$ ${totalCarrinho }</h3>

					<div class="row">
						<button class="waves-effect waves-light btn"
							style="width: 12em; margin-left: 20%; margin-top: 1em; background-color: #005900;">
							<a onclick="pagamentoPagSeguro()" style="color: white;"><img
								src="resources/loja/imagens/icones/icon-08.png">
								<p style="margin-top: -0.5em; font-size: 15px;">Pagseguro</p>
						</button>

						<a onclick="pagamentoBoleto()" style="cursor: pointer;">Pagamento
							com boleto</a> </a>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<c:import url="component/footerLoja.jsp"></c:import>
<script type="text/javascript">
	function pagamentoBoleto() {
		console.log("pagamentoBoleto");
		redirecionar("pag/gerarBoleto");

	}

	function pagamentoPagSeguro() {
		console.log("pagamento pagseguro");
		redirecionar("pag/pagseguro");
	}

	function redirecionar(url) {

		url += "/" + document.getElementById('selectEnderecos').value;

		console.log(url);

		window.location.href = url;
	}
</script>
<script>
	$(document).ready(function() {
		$('.menu-anchor').on('click touchstart', function(e) {
			$('html').toggleClass('menu-active');
			e.preventDefault();
		});

		$('select').on("change", function() {
			var valSelect = $("option:selected", this).val();
			console.log(valSelect);

			$.ajax({
				headers : {
					'Content-Type' : 'application/json'
				},
				type : 'GET',
				url : 'rest/dinamic/endereco/' + valSelect,
				dataType : 'json',
				success : function(data) {
					console.log(data);

					$("#pLogradouro").html(data.logradouro);
					$("#pNumero").html('Número: ' + data.numero);
					$("#pBairro").html(data.bairro);
					$("#pCidade").html(data.cidade);
				},
				error : function() {
					console.log('só triteza');
				}
			});
		});
	})
</script>
</body>
</html>
