<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Big Dog | Área do Administrador</title>
</head>
<body>
	<!--  import navbar -->
	<c:import url="../component/navbar.jsp" />

	<!-- Container principal -->
	<div class="container">
		<!-- Row -->
		<!-- Título e descrição -->
		<div class="row">
			<!-- Section -->
			<div class="section">
				<!-- Título -->
				<h5 class="center-align">Área do Administrador</h5>
				<p class="center-align grey-text text lighten-2">Consulte,
					Gerencie e Agende com facilidade.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Row -->
		<div class="row">
			<!-- Col -->
			<div class="col s12 m12 l12">
				<!-- Tabs -->
				<ul class="tabs">
					<!-- Dashboar -->
					<li class="tab col s4 m4 l4"
						onclick="Materialize.fadeInImage('#swipe-dashboard')"><a
						href="#swipe-dashboard" class="waves-effect"><i
							class="small material-icons center blue-text text-blue">trending_up</i>Dashboard</a></li>

					<!-- Gerenciar -->
					<li class="tab col s4 m4 l4"
						onclick="Materialize.fadeInImage('#swipe-gerenciar')"><a
						href="#swipe-gerenciar" class="waves-effect"><i
							class="small material-icons center grey-text text-grey">build</i>Gerenciar</a></li>

					<!-- Agenda -->
					<li class="tab col s4 m4 l4"
						onclick="Materialize.fadeInImage('#swipe-agenda')"><a
						href="#swipe-agenda" class="waves-effect"><i
							class="small material-icons center green-text text-green">event_note</i>Agenda</a></li>
				</ul>
			</div>
		</div>

		<!-- Row -->
		<div class="row">
			<!-- Col -->
			<!-- Dashboard -->
			<div id="swipe-dashboard" class="col s12 m12 l12 blue">DASHBOARD</div>

			<!-- Gerenciar -->
			<div id="swipe-gerenciar" class="col s12 m12 l12 grey">GERENCIAR</div>

			<!-- Agenda -->
			<div id="swipe-agenda" class="col s12 m12 l12 green">AGENDA</div>
		</div>
	</div>

	<!-- SCRIPT'S -->
	<script>
		// Swipe Tabs
		$('#tabs-swipe-demo').tabs({
			'swipeable' : true
		});
	</script>
</body>
</html>