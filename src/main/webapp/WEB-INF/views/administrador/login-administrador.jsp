<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Ícone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/dedicated/img/administrador/adm-icon.ico">

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- CSS dedicated -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/login-administrador.css">

<!-- Materialize CSS min. -->
<link rel="stylesheet" href="resources/materialize/css/materialize.css">

<!-- Import's JS -->
<!-- JQuery -->
<script src="resources/jquery/jquery-3.2.1.js" defer></script>

<!-- Materialize min. -->
<script type="text/javascript"
	src="resources/materialize/js/materialize.min.js" defer></script>

<!-- Título -->
<title>Login do Administrador</title>

</head>
<body>
	<!-- Container de login -->
	<main>
	<div id="cx-login-adm">
		<div class="container">
			<div class="row">
				<!-- Formulário -->
				<div class="col s12 m12 l12">
					<div class="row">
						<div class="col s12 m4 l4">
							<!-- Card -->
							<div class="card hoverable">
								<!-- Imagem -->
								<div class="card-image">
									<img src="resources/dedicated/img/administrador/logo-login.png"
										class="responsive-img">
									<h5 class="card-title">
										Pet Shop <b>BIGDOG</b>
									</h5>
								</div>

								<!-- Content -->
								<div class="card-content">
									<p>Clínica Veterinária e Pet Shop. Rações em geral,
										farmácia veterinária, vacinas, cirurgias, exames
										laboratoriais, Banho & Tosa e muito mais.</p>
								</div>

								<!-- Link -->
								<div class="card-action">
									<a href="home" class="red-text text-lighten-2"><b>Ir
											para Site</b></a>
								</div>
							</div>
						</div>

						<!-- Formulário de login -->
						<div class="col s12 m8 l8">
							<!-- Ícone de formulário -->
							<div align="center">
								<i class="material-icons red-text text-lighten-2 large">person</i>
							</div>

							<!-- Descrição de formulário -->
							<h5 align="center">Administração</h5>
							<h6 align="center" class="grey-text">Área de Login</h6>

							<!-- br -->
							<br>

							<!-- Formulário -->
							<div class="container">
								<div class="row">
									<form>
										<div class="col s12 m12 l12">
											<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix">account_circle</i> <input
													id="adm-email" type="email" class="validate" required>
												<label for="adm-email" data-error="inválido"
													data-success="ok">Email</label>
											</div>
										</div>

										<div class="col s12 m12 l12">
											<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix">vpn_key</i> <input
													id="adm-senha" type="password" class="validate" required>
												<label for="adm-senha">Senha</label>
											</div>
										</div>

										<!-- Botão -->
										<div id="btn-login-adm" class="col s12 m12 l12 center">
											<button class="btn waves-effect waves-light red lighten-1"
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
	</div>
	</main>

	<!-- import footer -->
	<c:import url="component/footer.jsp" />
</body>
</html>