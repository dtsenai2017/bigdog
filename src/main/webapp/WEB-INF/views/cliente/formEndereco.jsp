<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="resources/loja/css/login.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/stylep.css">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/materializeModificado.min.css">

<!-- Import JS -->
<script type="text/javascript" src="resources/loja/js/menu.js"></script>
<script src="resources/loja/js/jquery-3.2.1.min.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		VMasker(document.querySelector(".cep")).maskPattern("99999-999");
	});
</script>
</head>
<main>
<body>
	<!-- Import header -->
	<c:import url="component/headerLoja.jsp"></c:import>

	<!-- Dados do cliente -->
	<div class="cxAvatar">
		<!-- Imagem do avatar -->
		<img src="resources/loja/imagens/icones/avatarMasc.png" class="avatar">

		<!-- Nome do cliente -->
		<div class="cx08">
			<h2>${clienteLogado.nome }</h2>
		</div>

		<!-- Menu lateral -->
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>

		<!-- Opções do menu -->
		<div class="cx05">
			<ul id="ul">
				<li id="pf" class="id"><a href="home-user"><i
						class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png">
					<p id="lip">Meus Pets</p></a></li>
				<li><a href="listPedidos"><i class="fa fa-shopping-cart"
						aria-hidden="true"></i> Pedidos</a></li>
				<li><a href="listAgendamentos"><i class="fa fa-calendar"
						aria-hidden="true"></i> Agendamentos</a></li>
				<li><a href="logout"><i class="fa fa-sign-in"
						aria-hidden="true"></i> Logout</a></li>
			</ul>
		</div>

		<!-- Botão para cadastrar novo endereço -->
		<div class="cx03">
			<i class="fa fa-address-book" aria-hidden="true"></i> Cadastrar
			Endereço
		</div>

		<!-- Formulário de endereço -->
		<form id="form" action="cadastra-endereco" class="form" method="post">
			<div class="row roww">
				<div class="input-field col s6">
					<input type="hidden" name="id" value="${clienteLogado.idCliente }"><input
						type="hidden" name="idEnderecoCliente"
						value="${alterarEndereco.idEnderecoCliente }"><input
						id="cep" name="cep" type="text" onkeypress="habilitaC()"
						value="${alterarEndereco.cep }" required="required" class="cep">
					<label class="active" for="p07">CEP</label> <span id="spcep"></span>

				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="logradouro" value="${alterarEndereco.logradouro }"
						name="logradouro" required="required" type="text" class="">
					<label class="active" for="p08">Logradouro</label>
				</div>
			</div>

			<div class="row rwo">
				<div class="input-field col s6">
					<input id="bairro" value="${alterarEndereco.bairro }" type="text"
						required="required" name="bairro" class=""> <label
						class="active" for="p09">Bairro</label>
				</div>
			</div>

			<div class="row rwoo">
				<div class="input-field col s6">
					<input id="cidade" type="text" value="${alterarEndereco.cidade }"
						required="required" name="cidade" class=""> <label
						class="active" for="p10">Cidade</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="uf" type="text" maxlength="2" required="required"
						name="uf" value="${alterarEndereco.uf }" class=""> <label
						class="active" for="p11">UF</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="complemento" type="text"
						value="${alterarEndereco.complemento }" name="complemento"
						class=""> <label class="active" for="p12">Complemento</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="numero" type="text" value="${alterarEndereco.numero }"
						required="required" name="numero" class=""> <label
						class="active" for="p13">Numero</label>
				</div>
			</div>

			<button type="submit" class="buttonn buttonBlue">
				Cadastrar
				<div class="ripples buttonRipples">
					<span class="ripplesCircle"></span>
				</div>
			</button>
		</form>
	</div>
</main>

<!-- Import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import JS -->
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script's -->
<script type="text/javascript">
	function habilitaC() {
		$('#logradouro').attr("disabled", false);
		$('#bairro').attr("disabled", false);
		$('#cidade').attr('disabled', false);
		$('#uf').attr('disabled', false);

	}
</script>

<script type="text/javascript">
	$(".button-collapse").sideNav();
	$(document).ready(function() {
		Materialize.updateTextFields();
	});

	$(document).ready(function() {
		$('select').material_select();
	});
</script>

<script>
	$(".menuu").click(function() {

		$("#ul").toggle();
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

<!-- Busca cep -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						function limpa_formulário_cep() {
							// Limpa valores do formulário de cep.
							$("#logradouro").val("");
							$("#bairro").val("");
							$("#cidade").val("");
							$("#uf").val("");
						}

						// Quando o campo cep perde o foco.
						$("#cep")
								.blur(
										function() {

											// Nova variável "cep" 
											// somente com dígitos.
											var cep = $(this).val().replace(
													/\D/g, '');

											// Verifica se campo 
											// cep possui valor informado.
											if (cep != "") {

												// Expressão regular para validar o CEP.
												var validacep = /^[0-9]{8}$/;

												// Valida o formato do CEP.
												if (validacep.test(cep)) {

													// Preenche os 
													// campos com "..." enquanto
													// consulta webservice.
													$("#logradouro").val("...");
													$("#bairro").val("...");
													$("#cidade").val("...");
													$("#uf").val("...");

													// Consulta o webservice viacep.com.br/
													$
															.getJSON(
																	"//viacep.com.br/ws/"
																			+ cep
																			+ "/json/?callback=?",
																	function(
																			dados) {

																		if (!("erro" in dados)) {
																			// Atualiza os 
																			// campos com os valores da
																			// consulta.
																			$(
																					"#logradouro")
																					.val(
																							dados.logradouro);
																			$(
																					"#bairro")
																					.val(
																							dados.bairro);
																			$(
																					"#cidade")
																					.val(
																							dados.localidade);
																			$(
																					"#uf")
																					.val(
																							dados.uf);
																			$(
																					"#spcep")
																					.text(
																							"");
																			$(
																					"#complemento")
																					.focus();
																			$(
																					'#logradouro')
																					.attr(
																							"disabled",
																							true);
																			$(
																					'#bairro')
																					.attr(
																							"disabled",
																							true);
																			$(
																					'#cidade')
																					.attr(
																							'disabled',
																							true);
																			$(
																					'#uf')
																					.attr(
																							'disabled',
																							true);

																		} // end if.
																		else {
																			// CEP pesquisado não foi encontrado.
																			limpa_formulário_cep();
																			$(
																					"#spcep")
																					.text(
																							"CEP Não Encontrado");
																		}
																	});
												} // end if.
												else {
													// cep é inválido.
													limpa_formulário_cep();
													alert("Formato de CEP inválido.");
												}
											} // end if.
											else {
												// cep sem valor, limpa formulário.
												limpa_formulário_cep();
											}
										});
					});
</script>
</body>
</html>
