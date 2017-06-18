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
		<!-- Ícone -->
		<img
			src="resources/loja/imagens/icones/${clienteLogado.genero == 'Masculino' ? 'man-icon':'female-icon' }.png"
			class="avatar" title="${clienteLogado.nome }">

		<!-- Nome do cliente -->
		<div class="cx08">
			<h2>${clienteLogado.nome }</h2>
		</div>

		<!-- Menu -->
		<div class="menuu">
			<i class="fa fa-bars" aria-hidden></i> Menu
		</div>

		<!-- Link de menu -->
		<div class="cx05">
			<ul id="ul">
				<li id="pf" class="id"><a href="home-user"><i
						class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
				<li id="pf"><a href="lista-dados"><i class="fa fa-user"
						aria-hidden="true"></i> Perfil</a></li>
				<li><a href="lista-pet"><img
						src="resources/loja/imagens/icones/icon-09.png"> Meus Pets</a></li>
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
					<input type="hidden" name="idEnderecoCliente"
						value="${alterarEndereco.idEnderecoCliente }"><input
						id="cep" name="cep" type="text" value="${alterarEndereco.cep }"
						class="cep" maxlength="9" required> <label class="active"
						for="cep">* CEP</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="logradouro" value="${alterarEndereco.logradouro }"
						name="logradouro" type="text" maxlength="255" required> <label
						id="lbl-logradouro" class="active" for="logradouro">*
						Logradouro</label>
				</div>
			</div>

			<div class="row rwo">
				<div class="input-field col s6">
					<input id="bairro" value="${alterarEndereco.bairro }" type="text"
						name="bairro" maxlength="100" required> <label
						id="lbl-bairro" class="active" for="bairro">* Bairro</label>
				</div>
			</div>

			<div class="row rwoo">
				<div class="input-field col s6">
					<input id="cidade" type="text" value="${alterarEndereco.cidade }"
						name="cidade" maxlength="100" required> <label
						id="lbl-cidade" class="active" for="cidade">* Cidade</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="uf" type="text" maxlength="2" name="uf"
						value="${alterarEndereco.uf }" required> <label
						id="lbl-uf" class="active" for="uf">* UF</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="complemento" type="text"
						value="${alterarEndereco.complemento }" name="complemento"
						maxlength="50"> <label id="lbl-complemento" class="active"
						for="complemento">Complemento</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<input id="numero" type="text" value="${alterarEndereco.numero }"
						name="numero" maxlength="10" required> <label
						id="lbl-numero" class="active" for="numero">* Numero</label>
				</div>
			</div>

			<button type="submit" class="buttonn buttonBlue">
				${alterarEndereco != null ? 'Alterar':'Cadastrar' }
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
						// Limpar formulário
						function limpa_formulário_cep() {
							// Limpa formulário
							$("#logradouro").val("");
							$("#bairro").val("");
							$("#cidade").val("");
							$("#uf").val("");

							// Ativa labels
							$("#lbl-logradouro").removeClass('active');
							$("#lbl-bairro").removeClass('active');
							$("#lbl-cidade").removeClass('active');
							$("#lbl-uf").removeClass('active');
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

												// Validar o CEP.
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

													// Consulta viacep.com.br/
													$
															.getJSON(
																	"//viacep.com.br/ws/"
																			+ cep
																			+ "/json/?callback=?",
																	function(
																			dados) {

																		if (!("erro" in dados)) {
																			// Atualiza campos de endereço
																			// Ativa labels
																			$(
																					'#lbl-logradouro')
																					.addClass(
																							'active');
																			$(
																					'#lbl-bairro')
																					.addClass(
																							'active');
																			$(
																					'#lbl-cidade')
																					.addClass(
																							'active');
																			$(
																					'#lbl-uf')
																					.addClass(
																							'active');

																			// Atribui valores para campos
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

																			// Focus em complemento
																			$(
																					"#complemento")
																					.focus();
																		} // end if.
																		else {
																			// CEP pesquisado não foi encontrado.
																			limpa_formulário_cep();

																			// Toast
																			Materialize
																					.toast(
																							'CEP não encontrado.',
																							2000);
																		}
																	});
												} // end if.
												else {
													// cep é inválido.
													limpa_formulário_cep();

													// Toast
													Materialize
															.toast(
																	'Formato de CEP inválido.',
																	2000);
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
