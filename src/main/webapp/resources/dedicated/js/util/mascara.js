// Input peso de pet
$('#peso').keypress(function() {
	$('#peso').mask("##0.00", {
		reverse : true
	});
});

// Input Valor de produto
$('#valor').keypress(function() {
	$('#valor').mask("###.##0,00", {
		reverse : true
	});
});