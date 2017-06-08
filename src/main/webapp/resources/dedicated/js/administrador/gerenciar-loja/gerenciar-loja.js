// SELECT initialize
$('select').material_select();

// Verificar data vigência
function verificarData(input) {
	if ($(input).val() == '') {
		$(input).addClass('invalid')
		return false;
	} else {
		$(input).removeClass('invalid')
		return true;
	}
}

// Data Vigência change
$('#dataVigencia').change(function() {
	verificarData($('#dataVigencia'));
});

$('#dataVigencia-p-selecionado').change(function() {
	verificarData($('#dataVigencia-p-selecionado'));
});
