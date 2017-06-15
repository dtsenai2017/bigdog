<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Ícone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value="/resources/dedicated/img/administrador/adm-icon.ico"/>">

<!-- Título -->
<title>Administrador | Login</title>

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- CSS dedicated -->
<link rel="stylesheet"
	href="<c:url value="/resources/dedicated/css/administrador/login-administrador.css"/>">

<!-- Materialize CSS min. -->
<link rel="stylesheet"
	href="<c:url value="/resources/materialize/css/materialize.css"/>">

<!-- Import's JS -->
<!-- JQuery -->
<script src="<c:url value="/resources/jquery/jquery-3.2.1.js"/>" defer></script>

<!-- Materialize min. -->
<script type="text/javascript"
	src="<c:url value="/resources/materialize/js/materialize.min.js"/>"
	defer></script>
</head>
<body>
	<!-- Container de login -->
	<main>
	<div id="cx-login-adm" class="container">
		<div class="row">
			<!-- Formulário -->
			<div class="col s12 m12 l12">
				<div class="row">
					<!-- Ícone de formulário -->
					<div align="center">
						<i class="material-icons red-text text-lighten-1 large">supervisor_account</i>
					</div>

					<!-- Descrição de formulário -->
					<h5 id="title-form-login" align="center">BIGDOG</h5>
					<h6 align="center" class="grey-text text-lighten-1">Área
						Administrativa</h6>

					<!-- br -->
					<br>

					<!-- br -->
					<br>

					<!-- Formulário -->
					<div class="col s12 m6 l6 offset-m3">
						<div class="container">
							<div class="row">
								<form id="form-login-adm">
									<div class="input-field col s12 m12 l12">
										<i class="material-icons prefix red-text text-lighten-2">email</i>
										<input id="adm-email" type="email" class="validate"
											value="admin_bigdog@gmail.com" required> <label
											for="adm-email" data-error="inválido" data-success="ok">Email</label>
									</div>

									<div class="input-field col s12 m12 l12">
										<i class="material-icons prefix red-text text-lighten-2">lock</i>
										<input id="adm-senha" type="password" value="bigdog54321"
											required> <label for="adm-senha">Senha</label>
									</div>

									<!-- Botão voltar e submit -->
									<div id="btn-login-adm" class="col s12 m12 l12">
										<a href="home"
											class="col s12 m4 l4 btn waves-effect waves-light brown lighten-1 left">Site</a>

										<!-- Espaçador para mobile -->
										<div class="col s12 m12 l12 hide-on-med-and-up">
											<br>
										</div>

										<button
											class="col s12 m4 l4 btn waves-effect waves-light red lighten-1 right"
											type="submit" name="action">Logar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>

	<!-- JS dedicado para login -->
	<script type="text/javascript"
		src="<c:url
		value="/resources/dedicated/js/administrador/login-administrador.js" />"
		charset="utf-8" defer></script>
</body>
</html>