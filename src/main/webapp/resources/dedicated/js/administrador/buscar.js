// Buscar resultados de acordo com tipo de input, com HideSeek
function buscar(tipo) {
	$('#' + tipo).hideseek({
		hidden_mode : true
	});
}

// Buscar CEP
function buscarCep(e) {
	if ($(e).prop('id') == 'cep-f-selecionado') {
	} else if ($(e).prop('id') == 'cep') {
		// ...
	}
}
