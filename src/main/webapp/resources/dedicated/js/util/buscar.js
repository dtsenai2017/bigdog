// Buscar resultados de acordo com tipo de input, com HideSeek
function buscar(tipo) {
	$('#' + tipo).hideseek({
		nodata : 'Nenhum resultado encontrado!',
	});
}
