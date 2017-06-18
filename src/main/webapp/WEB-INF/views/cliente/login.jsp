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

<!-- T�tulo -->
<title>Big Dog - Bem Vindo</title>

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/social-buttons.css">
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link rel="stylesheet" href="resources/materialize/css/materialize.css">
<link rel="stylesheet" href="resources/jquery/css/jquery-confirm.css">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Import's JS -->
<script src="resources/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="resources/loja/js/fb.js"></script>
<script type="text/javascript" src="resources/loja/js/platform.js"></script>
<script type="text/javascript" src="https://apis.google.com/js/api.js"></script>
<script src="resources/loja/js/google.js"></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript" src="resources/jquery/jquery.mask.js"></script>

</head>
<main>
<body id="body"
	style="background-image: url('resources/loja/imagens/backlogin.png')">
	<!-- header -->
	<header>
		<div class="img00">
			<a href="home"><img title="Ir para site"
				src="resources/loja/imagens/logos/logoOf02.png"></a>
		</div>
	</header>

	<!-- Formul�rio de login -->
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

		<!-- Mensagem de status -->
		<span id="msg"></span>

		<!-- Link esqueci a senha -->
		<div class="esq">
			<p>
				<a href="#modal-esqueci-senha" class="white-text">Esqueci minha
					senha</a>
			</p>
		</div>

		<!-- br -->
		<br>

		<!-- Bot�es -->
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
		</div>

		<div class="row">
			<div class="col s6">
				<div class="divider"></div>
			</div>
		</div>

		<!-- Link para sobre n�s -->
		<div>
			<p class="center" style="font-size: 14px;">
				<a href="sobreNos" class="red-text text-darken-1">Sobre N�s</a>
			</p>
		</div>
	</form>
</main>

<!-- import footer -->
<c:import url="component/footerLoja.jsp"></c:import>

<!-- Modal Esqueci a senha -->
<div id="modal-esqueci-senha" class="modal brown white-text">
	<div class="modal-content">
		<!-- Bot�o fechar -->
		<div class="row">
			<div class="col s12 m12 l12">
				<a class="modal-action modal-close right"><i
					class="material-icons grey-text">close</i></a>
			</div>
		</div>

		<!-- Descri��o de modal -->
		<div class="container">
			<div class="row">
				<div class="col s12 m12 l12">
					<!-- T�tulo -->
					<h4 align="center">Esqueceu a senha?</h4>

					<!-- Subt�tulo -->
					<p align="center" style="font-size: 12px;">
						Sem problemas, � <b style="font-size: 14px;">f�cil</b>
						recuper�-la. Apenas informe abaixo os campos necess�rios, confirme
						a altera��o e pronto!
					</p>

					<!-- divider -->
					<div class="divider"></div>

					<!-- br -->
					<br>
				</div>
			</div>

			<!-- Formul�rio de altera��o (Email, CPF e nova senha) -->
			<div class="row">
				<form id="form-esqueci-senha">
					<div class="input-field col s12 m12 l12">
						<input id="email-es" type="email" required> <label
							for="email-es">Email cadastrado</label>
					</div>

					<div class="input-field col s12 m12 l12">
						<input id="cpf-es" type="text" maxlength="20" required> <label
							for="cpf-es">CPF</label>
					</div>

					<div class="input-field col s12 m12 l12">
						<input id="nova-senha-es" type="password"
							placeholder="M�x. 6 d�gitos" minlength="6" maxlength="6" required>
						<label for="nova-senha-es">Nova senha</label>
					</div>

					<!-- Bot�o submit -->
					<div class="col s12 m12 l12">
						<button
							class="col s12 m4 l4 btn waves-effect waves-light red lighten-1 right"
							type="submit" name="action">Recuperar</button>
					</div>
				</form>
			</div>

			<!-- divider -->
			<div class="divider grey-text text darken-2"></div>

			<!-- Contato -->
			<div class="row center-align">
				<div class="col s12 m12 l12">
					<!-- Descri��o de contato -->
					<p style="font-size: 10px;" class="grey-text text darken-2">
						Caso estiver tendo problemas de acesso, contate-nos clicando <b><a
							href="sobreNos">aqui.</a></b>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Logar -->
<script type="text/javascript">
	// Logar
	function logar() {
		// Atribuindo valores de inputs
		var email = $('#email').val();
		var senha = $('#password').val();

		var dados = {
			email : email,
			senha : senha
		}

		// Requisi��o para logar
		$.ajax({
			type : 'POST',
			url : 'rest/logar',
			data : JSON.stringify(dados),
			dataType : 'json',
			success : function(data) {
				localStorage.setItem("id_cliente", data.idCliente)
				var url = "indexCliente?id="
						+ localStorage.getItem("id_cliente");
				window.location = url;
			},
			error : function(data) {
				$("#msg").text("Login incorreto, tente novamente!");
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
</script>

<!-- Script -->
<script type="text/javascript">
	function cadastrese() {
		localStorage.setItem("id_redes", 0);
		window.location = "faca-parte";
	}
</script>

<!-- Apaga span -->
<script type="text/javascript">
	function apagaSpan() {
		$("#msg").text("");
	}
</script>

<!-- Esqueceu a senha? -->
<script type="text/javascript">
	// Inicializador modal Esqueci a Senha
	$('.modal').modal();

	// Modal de Recuperar Senha
	$('#modal-esqueci-senha').modal({
		complete : function() {
			limparModalRecuperarSenha();
		} // Callback for Modal close
	});

	// Limpar inputs de modal
	function limparModalRecuperarSenha() {
		// Removendo valores
		$('#email-es').val("");
		$('#cpf-es').val("");
		$('#nova-senha-es').val("");
	}

	// M�scara
	$("#cpf-es").mask("000.000.000-00");

	// Formul�rio submit
	$("#form-esqueci-senha").submit(
			function(e) {
				// Cancela qualquer a��o padr�o do elemento
				e.preventDefault();

				// Usu�rio
				var usuarioRS = {
					cpf : $('#cpf-es').val(),
					email : $('#email-es').val(),
					senhaNova : $("#nova-senha-es").val()
				}

				// Recuperar senha
				$.ajax({
					url : "rest/recuperarSenha",
					type : "PUT",
					data : JSON.stringify(usuarioRS),
					contentType : "application/json; charset=utf-8",
					success : function(response) {
						// Fechando modal de recupera��o
						$('#modal-esqueci-senha').modal('close');

						// Toast para usu�rio v�lido
						Materialize.toast(
								'Usu�rio alterado ' + 'com sucesso !', 3000,
								'brown');
					},
					error : function(e) {
						// Toast para usu�rio n�o encontrado ou problema ocorrido
						if (e.status == 403) {
							Materialize.toast('Usu�rio n�o encontrado. '
									+ 'Tente novamente !', 2500, 'red');
						} else if (e.status == 500) {
							Materialize.toast('Ops, houve um problema. '
									+ 'Tente novamente !', 2500, 'red');
						}
					},
				});
			});
</script>
</body>
</html>