<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Big Dog | Index</title>
</head>
<body>
	<!-- import navbar -->
	<c:import url="administrador/component/navbar.jsp" />

	<!-- Main content -->
	<main> <!-- Container -->
	<div class="container">
		<div class="row">
			<form id="form-login" action="login" method="post">
				<input name="email" type="email" required> <input
					name="senha" type="password" required>

				<button type="submit">Logar</button>
			</form>
		</div>
	</div>
	</main>
</body>
</html>