// Input peso de pet
$('#peso').keypress(function() {
	$('#peso').mask("##0.00", {
		reverse : true
	});
});
