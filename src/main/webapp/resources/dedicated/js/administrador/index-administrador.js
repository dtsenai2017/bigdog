// Gerenciamento
$("#swipe-gerenciar a").click(
		function() {
			// Atributo
			var tipo = $(this).attr('id').split('-');

			// Verifica tipo de gerenciamento
			if (tipo[2] == 'cliente') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarCliente", false);

				// Atribuindo toke
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'loja') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarLoja", false);

				// Atribuindo toke
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'agenda') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarAgenda", false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'servico') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', "gerenciarServico", false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			}
		});

// JS dedicado para página de index do administrador
// Requisições
// Agenda de Hoje
$("#btn-agenda-hoje").click(function() {
	$.getJSON({
		url : "adm/agendamentoHoje",
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(agendamentos) {
			$.each(agendamentos, function(index, agendamento) {
				console.log(agendamento);
				// $('#lista-agendamento-hoje').append(agendamento);
			});
		},
		error : function(e) {
			console.log("ERROR : " + e);
		}
	});
});
