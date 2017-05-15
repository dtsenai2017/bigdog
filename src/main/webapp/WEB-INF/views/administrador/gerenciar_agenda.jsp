<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Administrador | Gerenciar Agenda</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-agenda/gerenciar-agenda.css">
</head>
<body>
	<!-- import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- main - container principal -->
	<main>
	<div class="container">
		<!-- Descrição -->
		<div class="row">
			<div class="col s12 m12 l12">
				<!-- Section -->
				<div class="section">
					<!-- Título -->
					<h5 class="left-align">Gerenciar Agendamentos</h5>

					<!-- Subtítulo -->
					<p class="left-align grey-text text lighten-1">Gerencie
						agendamentos realizados.</p>

					<!-- divider -->
					<div class="divider"></div>
				</div>
			</div>
		</div>
	</div>
	</main>

	<!-- import footer -->
	<c:import url="component/footer.jsp" />
</body>
</html>