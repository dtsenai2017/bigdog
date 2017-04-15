// Listar clientes para gerenciamento
function listarClientes() {
	// Var's para table
	var tHead = "<thead>" + "<tr>" + "<th>" + "ID" + "</th>" + "<th>" + "Nome"
			+ "</th>" + "<th>" + "CPF" + "</th>" + "<th>" + "Email" + "</th>"
			+ "<th>" + "Visualizar" + "</th>" + "</tr>" + "</thead>";
	var tBody = "<tbody>" + "</tbody>";

	// Limpando tabela
	$('#tbl-clientes').empty();

	// Adicionando thead e tbody
	$('#tbl-clientes').append(tHead);
	$('#tbl-clientes').append(tBody);

	// Atribuindo valores para tabela
	$.getJSON("/BigDog/listarClientes", function(clientes) {
		$.each(clientes, function(i, cliente) {
			// Var para cliente
			var trCliente = "<tr>" + "<td>" + cliente.idCliente + "</td>"
					+ "<td>" + cliente.nome + "</td>" + "<td>" + cliente.cpf
					+ "</td>" + "<td>" + cliente.email + "</td>" + "<td>"
					+ "<i class='material-icons center-align'>" + "visibility"
					+ "</i>" + "</tr>";

			// Adicionando objeto para tabela
			$('#tbl-clientes tbody').append(trCliente);
		});
	});
}