// JS dedicado para gerenciamento de agenda
// Botão de opção de gerenciamento para agenda (Abre janela principal)
$("#btn-agenda").click(function() {
	// Mostrando janela
	$('#main-agendamento').fadeIn(1500);
	$('#main-servico').hide();
});

// Abrir modal com dados de agendamento
function abrirModalAgendamento(idAgendamento) {
	// Listando agendamento selecionado
	$.getJSON({
		url : "adm/agendamento/" + idAgendamento,
		type : "GET",
		success : function(agendamento) {
			// Atribui 0 para minutos
			function addZero(i) {
				if (i < 10) {
					i = "0" + i;
				}
				return i;
			}

			// Atributos
			var dataAgendada = new Date(agendamento.dataAgendada);
			var tempoEstimado = agendamento.servico.tempoEstimado.split(':');
			var minutos = addZero(dataAgendada.getMinutes());

			// Atribuindo valores para campos
			$('#idAgendamento-selecionado').val(agendamento.idAgendamento);
			$('#agendamento-cliente-nome').text(agendamento.cliente.nome);
			$('#agendamento-cliente-cpf').text(agendamento.cliente.cpf);
			$('#agendamento-cliente-telefone').text(
					agendamento.cliente.contato.telefone);
			$('#agendamento-cliente-celular').text(
					agendamento.cliente.contato.celular);
			$('#agendamento-cliente-email').text(
					agendamento.cliente.contato.email);
			$('#agendamento-pet-nome').text(agendamento.pet.nome);
			$('#agendamento-pet-sexo').text(agendamento.pet.sexo);
			$('#agendamento-dataAgendada').text(
					$.datepicker.formatDate('dd/mm/yy', dataAgendada));
			$('#agendamento-horarioAgendado').text(
					dataAgendada.getHours() + ":" + minutos + "hrs.");
			$('#agendamento-servico-nome').text(agendamento.servico.nome);
			$('#agendamento-servico-tipoServico').text(
					agendamento.servico.tipoServico);
			$('#agendamento-servico-tempoEstimado').text(
					tempoEstimado[0] + ":" + tempoEstimado[1] + "hrs.");
			$('#agendamento-servico-valor').text(
					'R$ ' + agendamento.servico.valor.toFixed(2));
			$('#agendamento-servico-observacoes').text(
					agendamento.servico.observacao);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Excluir agendamento
$('#btn-excluir-agendamento').click(function() {
	// Recebendo valor de input id
	var idAgendamento = $('#idAgendamento-selecionado').val();

	// Verifica alteração
	$.confirm({
		title : 'Exclusão de agendamento',
		animation : 'top',
		useBootstrap : false,
		theme : 'material',
		boxWidth : '50%',
		content : 'Deseja realmente excluir ?',
		buttons : {
			// CONFIRMAR
			confirm : {
				text : 'Confirmar',
				btnClass : 'btn-green',
				action : function() {
					// Deletando agendamento
					$.ajax({
						type : "DELETE",
						url : "adm/agendamento/" + idAgendamento,
						success : function(s) {
							// Reload
							location.reload()
						},
						error : function(e) {
							// Toast
							Materialize.toast('Ops, houve um problema!', 2000);
						}
					});
				}
			// Opção Confirmar
			},
			cancel : {
				// CANCELAR
				text : 'Cancelar',
				action : function() {
					// ...
				}
			}
		// Opção Cancelar
		}
	// Botões (Confirmar e Cancelar)
	});
});
