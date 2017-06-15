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

// Escondendo botão de alterar e status de serviço em modal
$('#btn-alterar-servico').hide();
$('#txt-servico-status').hide();

// Recarregar página
function recarregarGerenciarServico() {
	// Fechando modal (importante)
	$('#modal-servico').modal('close');
	
	// Requisição
	var xhr = new XMLHttpRequest();

	// Tipo, url e async
	xhr.open('GET', "adm/gerenciarServico", false);

	// Atribuindo token
	xhr.setRequestHeader("Authorization", localStorage.getItem("tokenBigDog"));

	// Response
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			// Replace html and refresh
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
	$('#status-servico').prop('checked', false);
	$('#nome-servico').val('');
	$('#tipo-servico').val('Veterinario').attr('select', true);
	$('#valor-servico').val('');
	$('#tempo-servico').val('');
	$('#observacao-servico').val('');
	
	// Alterando botões de formulário
	$('#btn-alterar-servico').hide();
	$('#btn-inserir-servico').fadeIn(500);
	
	// Ocultando informação sobre status
	$('#txt-servico-status-value').removeClass('cyan-text');
	$('#txt-servico-status-value').removeClass('red-text');
	$('#txt-servico-status').hide();
}

// Modal serviço
$('#modal-servico').modal({
    complete: function() {
    	// Limpar form quando modal for fechado
    	limparFormServico();
    } // Callback for Modal close
});

// Inserir serviço
$("#form-servico").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();
	
	// Atribui 0 para tempo
	function addZero(i) {
		if (i < 10) {
			i = "0" + i;
		}
		return i;
	}
	
	// Mensagem
	var mensagem;
	
	// Atributos para data e status do serviço
	var valorInputTempo = $('#tempo-servico').val().split(':');
	var tempoEstimado = new Date();
	var tempoString;
	var status; 
	
	// Atribui valor para status
	if ($('#status-servico').is(":checked") == true){
		status = 'Ativo';
	} else if ($('#status-servico').is(":checked") == false) {
		status = 'Desativado';
	}
	
	// Atribuindo valores de para tempo de serviço em um objeto date (Horas,
	// minutos e segundos)
	tempoEstimado.setHours(valorInputTempo[0]); 
	tempoEstimado.setMinutes(valorInputTempo[1]);
	tempoEstimado.setSeconds('00');
	
	// Atribuindo valor para horário em string
	tempoString = addZero(tempoEstimado.getHours()) 
	+ ':' + addZero(tempoEstimado.getMinutes()) 
	+ ':' + addZero(tempoEstimado.getSeconds());
	
	// Verifica tipo de requisição (Inserção ou alteração)
	if ($('#idServico').val() == '') {
		// Atributo que será inserido (sem id)
		var servico = {
			nome : $('#nome-servico').val(),
			tipoServico : $('#tipo-servico').val(),
			valor : parseFloat($('#valor-servico').val()),
			tempoEstimado : tempoString,
			observacao : $('#observacao-servico').val(),
			status : status
		}
		
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
		// Atributo que será alterado (com id)
		var servico = {
			idServico : $('#idServico').val(),
			nome : $('#nome-servico').val(),
			tipoServico : $('#tipo-servico').val(),
			valor : parseFloat($('#valor-servico').val()),
			tempoEstimado : tempoString,
			observacao : $('#observacao-servico').val(),
			status : status
		}
		
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
			
			// Ativando labels e exibindo status em footer de modal
			$('#label-nome-servico').addClass('active');
			$('#label-valor-servico').addClass('active');
			$('#label-tempo-servico').addClass('active');
			$('#label-observacao-servico').addClass('active');
			$('#txt-servico-status').fadeIn(500);
			
			// Atribuindo valores para formulário
			$('#idServico').val(servico.idServico);
			$('#status-servico').prop('checked', servico.status == 'Ativo'? true : false);
			$('#nome-servico').val(servico.nome);
			$('#tipo-servico').val(servico.tipoServico).attr('select', true);
			$('#valor-servico').val(servico.valor);
			$('#tempo-servico').val(tempoEstimadoAtual[0] + ':' + tempoEstimadoAtual[1]);
			$('#observacao-servico').val(servico.observacao);
			$('#txt-servico-status-value').addClass(servico.status == 'Ativo' ? 'cyan-text':'red-text');
			$('#txt-servico-status-value').text(servico.status.toUpperCase());
			
			// Update em select de tempo
			$('select').material_select('update');
			
			// Alterando botões de formulário
			$('#btn-alterar-servico').fadeIn(500);
			$('#btn-inserir-servico').hide();
		},
		error : function(e){
			mensagem = "Ops, houve um problema!";
		}
	});
}