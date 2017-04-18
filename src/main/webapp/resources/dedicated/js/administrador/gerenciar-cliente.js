// Requisições Ajax
// Endereço
function buscarCliente(idCliente) {
	$.ajax({
		url : "cliente/",
		type : "GET",
		contentType : "application/json;charset=utf-8",
		data : {
			id : idCliente
		},
		dataType : "json",
		success : function(data) {
			console.log("SUCCESS: ", data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

	// Pets
	// Compras
	// Agendamentos
}
