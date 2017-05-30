// JS dedicado para gerenciamento de serviço
// SELECT initialize
$('select').material_select();

// Time Picker Materialize
$('#tempo-servico').clockpicker({
	default: '00:30:00',
	placement : 'bottom',
	align : 'left',
	vibrate : true,
	autoclose: true,
	twelvehour : false,
	donetext : 'Voltar',
});

// Escondendo botão de alterar
$('#btn-alterar-servico').hide();
$('#btn-excluir-servico').hide();

// Recarregar página
function recarregarGerenciarServico() {
	// Recarregando...
	var xhr = new XMLHttpRequest();
	
	// Tipo, url e async
	xhr.open('GET', "gerenciarServico", false);
	
	// Atribuindo token
	xhr.setRequestHeader("Authorization", localStorage.getItem("tokenBigDog"));
	
	// Response
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			$(document.body).html(xhr.response);
		}
	};
	
	// Request send()
	xhr.send();
}

// Limpar formulário de serviço
function limparFormServico() {
	// Limpando campos
	$('#idServico').val('');
	$('#nome-servico').val('');
	$('#tipo-servico').val('Veterinario').attr('select', true);
	$('#valor-servico').val('');
	$('#tempo-servico').val('');
	$('#observacao-servico').val('');
	
	// Alterando botões de formulário
	$('#btn-alterar-servico').hide();
	$('#btn-inserir-servico').fadeIn(30);
	$('#btn-excluir-servico').hide();
}

// Modal serviço
$('#modal-servico').modal({
    complete: function() {
    	// Limpar form quando modal for fechado
    	limparFormServico();
    } // Callback for Modal close
  }
);

// Inserir serviço
$("#form-servico").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Mensagem
	var mensagem;
	
	// Atributos para data
	var valorInputTempo = $('#tempo-servico').val().split(':');
	var tempoEstimado = new Date();
	
	// Atribuindo valores de para tempo de serviço em um objeto date (Horas,
	// minutos e segundos)
	tempoEstimado.setHours(+valorInputTempo[0]); 
	tempoEstimado.setMinutes(valorInputTempo[1]);
	tempoEstimado.setSeconds('00');
	
	// Atributo que será inserido
	var servico = {
		idServico : $('#idServico').val(),
		nome : $('#nome-servico').val(),
		tipoServico : $('#tipo-servico').val(),
		valor : parseFloat($('#valor-servico').val()),
		tempoEstimado : tempoEstimado,
		observacao : $('#observacao-servico').val()
	}
	
	// Verifica tipo de requisição (Inserção ou alteração)
	if (servico.idServico == '') {
		// Cadastrando novo serviço
		$.ajax({
			url : "adm/servico",
			headers : {
				'Authorization' : localStorage
						.getItem("tokenBigDog")
			},
			type : "POST",
			data : JSON.stringify(servico),
			contentType : "application/json; charset=utf-8",
			success : function(s) {
				// Reload
				recarregarGerenciarServico();
			},
			error : function(e) {
				mensagem = 'Ops, houve um problema!';
			},
			complete : function() {
				// Toast
				Materialize.toast(mensagem, 2000);
			}
		});
	} else {
		// Alterando serviço
		$.ajax({
			url : "adm/servico/" + servico.idServico,
			headers : {
				'Authorization' : localStorage
						.getItem("tokenBigDog")
			},
			type : "PUT",
			data : JSON.stringify(servico),
			contentType : "application/json; charset=utf-8",
			success : function(s) {
				// Reload
				recarregarGerenciarServico();
			},
			error : function(e) {
				mensagem = 'Ops, houve um problema!';
			},
			complete : function() {
				// Toast
				Materialize.toast(mensagem, 2000);
			}
		});
	}
});

// Atribui valores para formulário de alteração de serviço
function modalAlterarServico(idServico) {
	// Limpar formulario
	limparFormServico();
	
	// Mensagem
	var mensagem;
	
	// Atribuindo valores para campos
	$.getJSON({
		url : "adm/servico/" + idServico,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(servico){
			// Atributos para data
			var tempoEstimadoAtual = servico.tempoEstimado.split(':');
			
			// Ativando labels
			$('#label-nome-servico').addClass('active');
			$('#label-valor-servico').addClass('active');
			$('#label-tempo-servico').addClass('active');
			$('#label-observacao-servico').addClass('active');
			
			// Atribuindo valores para formulário
			$('#idServico').val(servico.idServico);
			$('#nome-servico').val(servico.nome);
			$('#tipo-servico').val(servico.tipoServico).attr('select', true);
			$('#valor-servico').val(servico.valor);
			$('#tempo-servico').val(tempoEstimadoAtual[0] + ':' + tempoEstimadoAtual[1]);
			$('#observacao-servico').val(servico.observacao);
			
			$('select').material_select('update');
			
			// Alterando botões de formulário
			$('#btn-alterar-servico').fadeIn(300);
			$('#btn-inserir-servico').hide();
			$('#btn-excluir-servico').fadeIn(300);
		},
		error : function(e){
			mensagem = "Ops, houve um problema!";
		}
	});
}

// Excluir serviço selecionado
$('#btn-excluir-servico').click(function() {
	// Recebendo valor de input id
	var idServico = $('#idServico').val();
	
	// Verifica alteração
	$.confirm({
		title : 'Exclusão de serviço',
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
					// Deletando serviço
					$.ajax({
						url : "adm/servico/" + idServico,
						headers : {
							'Authorization' : localStorage
									.getItem("tokenBigDog")
						},
						type : "DELETE",
						success : function(s) {
							// Reload
							recarregarGerenciarServico();
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
