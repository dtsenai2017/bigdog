<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Logo de aba -->
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<!-- T�tulo -->
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
<script type="text/javascript">
	$(document).ready(function() {
		VMasker(document.querySelector(".cpf")).maskPattern("999.999.999-99");
	});
</script>
</head>
<main>
<body id="body"
	style="background-image: url('resources/loja/imagens/backlogin.png')">

	<!-- Formul�rio de login -->
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
		<span id="msgE"></span> <br>
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
			<script type="text/javascript">
				function esqueceuSenha() {
					var email = $('#email').val();
					var cpf = $('#cpf').val();
					email = email.replace(/\./g, ' ');
					cpf = cpf.replace(/\./g, ' ');
					$
							.ajax({
								type : 'GET',
								url : 'rest/esqueceuSenhaCpf/' + email + "&"
										+ cpf,
								dataType : 'json',
								success : function(data) {
									document.getElementById("email").hidden = !document
											.getElementById("hidden").hidden;
									document.getElementById("cpf").hidden = !document
											.getElementById("cpf").hidden;
								},
								error : function(data) {
									$("#msgE")
											.text(
													"Email e/ou Cpf Inv�lidos, Tente Novamente!");
									$("#email").val('');
									$("#cpf").val('');
									$("#email").focus();

								}
							});
				}
				function vSenha(confirma) {
					var senha = $("#senha").val();
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