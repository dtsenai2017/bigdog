<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="461691358173-2ns4scm8m1k8hc1sm19vbqbeu85s5u2q.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Logo de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/social-buttons.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/loja/js/fb.js"></script>
<script type="text/javascript" src="https://apis.google.com/js/api.js"></script>
<script type="text/javascript">
	$(document).ready(function name() {
		$("#msg").text(localStorage.getItem("sucesso"));
		localStorage.setItem("sucesso", "")
	});
</script>
</head>
<main>
<body id="body"
	style="background-image: url('resources/loja/imagens/backlogin.png')">
	<!-- header -->
	<header>
		<div class="img00">
			<a href="home"><img
				src="resources/loja/imagens/logos/logoOf02.png"></a>
		</div>
	</header>

	<!-- Formulário de login -->
	<form id="formm" class="form" action="javascript:logar();"
		method="post">
		<div class="cx02">
			<p>Acessar minha Conta</p>
		</div>

		<div class="row roww">
			<div class="input-field col s6">
				<input id="email" required="required" type="text" name="email"
					onkeypress="apagaSpan()"> <label class="active"
					for="first_name2" style="color: white;">E-Mail</label>
			</div>
		</div>

		<div class="row roww">
			<div class="input-field col s6">
				<input id="password" required="required" type="password"
					name="senha"> <label class="active" style="color: white;"
					for="first_name2">Senha</label>
			</div>
		</div>

		<span id="msg"></span>
		<div class="esq">
			<a href="javascript:forget()"><p>Esqueci minha senha</p></a>
		</div>
		<br>
		<div class="buttons">
			<button type="submit" class="buttonn buttonBlue">
				Logar
				<div class="ripples buttonRipples">
					<span class="ripplesCircle"></span>
				</div>
			</button>
			<button type="button" onclick="cadastrese()"
				class="buttonn buttonBlue">
				Cadastrar-se
				<div class="ripples buttonRipples">
					<span class="ripplesCircle"></span>
				</div>
			</button>

			<button id="btnFacebook" class="buttonn buttonBlue"
				onclick="checkFacebook();">
				<img id="btnLogoFacebook" src="resources/loja/imagens/logos/fb.png"></img>Entrar
				com Facebook
			</button>

			<button type="button" id="btnGoogle" class="buttonn buttonBlue">
				<img id="btnLogoGoogle" src="resources/loja/imagens/logos/gg.png"></img>
				Entrar com Google
				<div class="ripples buttonRipples">
					<span class="ripplesCircle"></span>
				</div>
			</button>

			<!-- Import's JS -->
			<script type="text/javascript" src="resources/loja/js/platform.js"></script>
			<script src="resources/loja/js/google.js"></script>

			<!-- Logar -->
			<script type="text/javascript">
				function logar() {
					// Atribuindo valores de inputs
					var email = $('#email').val();
					var senha = $('#password').val();

					var dados = {
						email : email,
						senha : senha
					}

					// Requisição para logar
					$
							.ajax({
								type : 'POST',
								url : 'rest/logar',
								data : JSON.stringify(dados),
								dataType : 'json',
								success : function(data) {
									localStorage.setItem("id_cliente",
											data.idCliente)
									var url = "indexCliente?id="
											+ localStorage
													.getItem("id_cliente");
									window.location = url;
								},
								error : function(data) {
									$("#msg")
											.text(
													"Login incorreto, tente novamente!");
									$("#email").val('');
									$("#password").val('');
									$("#email").focus();

								},
								headers : {
									'Content-Type' : 'application/json'
								}
							});
				}

				// Action button
				$(document).ready(function() {
					$(".abcRioButtonBlue").each(function() {
						$(this).css('background-color', 'brown');
					});
				});

				// Abrir popup
				function forget() {
					// Atributos de janela
					var width = 700;
					var height = 400;
					var left = 99;
					var top = 99;

					// Abrir popup
					window.open('esqueciSenha', 'janela', 'width=' + width
							+ ', height=' + height + ', top=' + top + ', left='
							+ left + ', scrollbars=yes, ' + 'status=no, '
							+ 'toolbar=no, ' + 'location=no, '
							+ 'directories=no, ' + 'menubar=no, '
							+ 'resizable=no, ' + 'fullscreen=no');

				}
			</script>
		</div>
	</form>
</main>

<!-- import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Import's JS -->
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>

<!-- Script -->
<script type="text/javascript">
	function cadastrese() {
		localStorage.setItem("id_redes", 0);
		window.location = "faca-parte";
	}
</script>

<script type="text/javascript">
	function apagaSpan() {
		$("#msg").text("");
	}
</script>

</body>
</html>