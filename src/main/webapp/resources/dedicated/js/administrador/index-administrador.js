// JS dedicado para página de index do administrador
// Requisições
// Agenda de Hoje
$("#btn-agenda-hoje").click(
		function() {
			$.getJSON({
				url : "adm/agendamentoHoje",
				type : "GET",
				success : function(agendamentos) {
					$.each(agendamentos, function(index, agendamento) {
						$('#lista-agendamento-hoje').append(agendamento);
					});
				},
				error : function(e) {
					console.log("ERROR : " + e);
				}
			});
		});
