<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="125644047445-9j60sbkl1kssriskoolv4o946m18r8in.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/loja/js/fb.js"></script>

<head>
<title>Big Dog - Bem Vindo</title>
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/social-buttons.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />
</head>
<main>
<body id="body">
	<header>
		<div class="img00">
			<a href="home"><img
				src="resources/loja/imagens/logos/logoOf02.png"></a>
		</div>
	</header>


	<form id="formm" class="form" action="javascript:logar();"
		method="post">
		<div class="cx02">
			<p>Acessar minha Conta</p>
		</div>

		<div class="row roww">
			<div class="input-field col s6">
				<input id="email" required="required" type="text" name="email">
				<label class="active" for="first_name2">E-Mail</label>
			</div>
		</div>

		<div class="row roww">
			<div class="input-field col s6">
				<input id="password" required="required" type="password"
					name="senha"> <label class="active" for="first_name2">Senha</label>
			</div>
		</div>

		<div class="esq">
			<a href="#"><p>Esqueci minha senha</p></a>
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
			<script type="text/javascript" src="resources/loja/js/platform.js"></script>
			<script src="resources/loja/js/google.js"></script>
			<script type="text/javascript">
				function logar() {
					var email = $('#email').val();
					var senha = $('#password').val();

					var dados = {
						email : email,
						senha : senha
					}

					$.ajax({
						type : 'POST',
						url : 'rest/logar',
						data : JSON.stringify(dados),
						dataType : 'json',
						success : function(data) {
							localStorage.setItem("id_cliente", data.idCliente)
							var url = "indexCliente?id="
									+ localStorage.getItem("id_cliente");
							console.log(localStorage.getItem("id_cliente"));
							window.location = url;
						},
						headers : {
							'Content-Type' : 'application/json'
						}
					});
				}
				$(document).ready(function() {
					$(".abcRioButtonBlue").each(function() {
						$(this).css('background-color', 'brown');
					});
				});
			</script>
		</div>
	</form>
</main>
<c:import url="component/footerLoja.jsp"></c:import>

<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript">
	function cadastrese() {
		localStorage.setItem("id_redes", 0);
		window.location = "faca-parte";
	}
</script>

</body>
</html>