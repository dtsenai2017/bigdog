<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Logo de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- Título -->
<title>Big Dog - Bem Vindo</title>

<!-- Import CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />

<!-- Import JS -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>

<!-- Script para mask de cpf -->
<script type="text/javascript">
	$(document).ready(function() {
		VMasker(document.querySelector(".cpf")).maskPattern("999.999.999-99");
	});
</script>
</head>
<main>
<body id="body"
	style="background-image: url('resources/loja/imagens/backlogin.png')">

	<!-- Formulário de login -->
	<form id="formm" class="form">
		<div class="cx02">
			<p>Esqueceu sua Senha?</p>
		</div>
		<br> <span id="msg">Informe Seu E-Mail e seu Cpf</span>
		<div class="row roww">
			<div class="input-field col s6">
				<input id="email" onkeypress="apagaSpan()" type="email" name="email">
				<label class="active" for="email" style="color: white;">E-Mail</label>
			</div>
		</div>
		<div class="row roww">
			<div class="input-field col s6">
				<input type="text" id="cpf" class="cpf" name="cpf"> <label
					class="active" style="color: white;" for="cpf">CPF</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="senha" name="senha" required="required" type="password"
					class="" minlength="6"> <label class="active" for="senha">Nova
					Senha</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="Csenha" name="Csenha" required="required" type="password"
					class="" minlength="6" onblur="vSenha(this.value)"> <label
					class="active" for="Csenha">Confirmar a Nova Senha</label><span
					id="spse"></span>
			</div>
		</div>
		<div class="buttons">
			<button type="button" onclick="esqueceuSenha()"
				class="buttonn buttonBlue">
				Verificar
				<div class="ripples buttonRipples">
					<span class="ripplesCircle"></span>
				</div>
			</button>
			<script type="text/javascript" src="resources/loja/js/platform.js"></script>
			<script src="resources/loja/js/google.js"></script>

			<!-- Script -->
			<script type="text/javascript">
				// Esqueceu Senha?
				function esqueceuSenha() {
					// Atributos
					var email = $('#email').val();
					var cpf = $('#cpf').val();
					email = email.replace(/\./g, ' ');
					cpf = cpf.replace(/\./g, ' ');

					// Requisição
					$
							.ajax({
								type : 'GET',
								url : 'rest/esqueceuSenhaCpf/' + email + "&"
										+ cpf,
								dataType : 'json',
								success : function(data) {
									// Toast
									Materialize.toast(
											'Usuário alterado com sucesso!',
											2000);
								},
								error : function(data) {
									// Toast
									Materialize
											.toast(
													"Email e/ou Cpf Inválidos, Tente Novamente!",
													2500);
									$("#email").val('');
									$("#cpf").val('');
									$("#email").focus();

								}
							});
				}

				// Verifica senha
				function vSenha(confirma) {
					// Atributo
					var senha = $("#senha").val();

					// Se
					if (confirma != senha) {
						$("#spse").html("Senhas Diferentes, tente novamente.");
						$("#senha").val("");
						$("#Csenha").val("");
					} else {
						$("#spse").html("");

					}
				}
			</script>
		</div>
	</form>
</main>

<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript">
	function apagaSpan() {
		$("#msgE").text("");
		$("#msgC").text("");
	}
</script>

</body>
</html>