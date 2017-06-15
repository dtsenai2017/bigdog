// JS dedicado para compras realizadas
$("#btn-compras").click(function() {
	// Mostrando janela
	$('#main-compras').fadeIn(1500);
	$('#main-produto').hide();
	$('#main-fornecedor').hide();
});

// Input search compra (Captura a tecla enter)
$('#search-compra').keypress(function(e) {
	// Verifica se ENTER foi pressionado
	if (e.which == 13) {
		// Cancela qualquer ação padrão do elemento
		e.preventDefault();

		Materialize.toast("Apenas digite sua busca!", 2500);
	}
});

// Carregar lista de compras
function abrirCompras() {
	// Populando lista de fornecedores
	$.getJSON({
		url : "adm/compraOrdenada",
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(compras) {
			$.each(compras, function(index, compra) {
				// Data da compra
				var dataCompra = new Date(compra.dataCompra);

				// Objeto em lista
				var liCompra = '<li class="collection-item">'
						+ '<h5><a href="#modal-info-compra"'
						+ ' onclick="abrirCompra(' + compra.idCompra
						+ ');" class="secondary-content">'
						+ '<i class="material-icons right red-text">'
						+ 'zoom_in</i></a>' + '<b>Data</b> : '
						+ $.datepicker.formatDate('dd/mm/yy', dataCompra)
						+ '</h5>' + '<span><b>Nome do Cliente</b> : '
						+ compra.cliente.nome + '</span><br>'
						+ '<span><b>Valor Total</b> : R$ '
						+ compra.valor.toFixed(2) + '</span><br>'
						+ '<span><b>STATUS : </b>' + compra.status
						+ '</span></li>';

				// Adicionando na lista
				$('#lista-compra').append(liCompra);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Popular dados de compra selecionada para modal
function abrirCompra(idCompra) {
	// Limpar campos e tabela de itens
	limparCamposModalCompra();

	// Limpando campos e tabela de itens
	function limparCamposModalCompra() {
		$('#idCompra-selecionada').val('');
		$('#dataCompra-selecionada').text('');
		$('#horarioCompra-selecionada').text('');
		$('#input-status-selecionada').text('');
		$('#frete-selecionada').text('');
		$('#cliente-compra-selecionada').text('');
		$('#clienteCpf-compra-selecionada').text('');
		$('#clienteEmail-compra-selecionada').text('');
		$('#clienteCelular-compra-selecionada').text('');
		$('#cep-compra-selecionada').text('');
		$('#logradouro-compra-selecionada').text('');
		$('#complemento-compra-selecionado').text('');
		$('#bairro-compra-selecionada').text('');
		$('#cidade-compra-selecionada').text('');
		$('#uf-compra-selecionada').text('');
		$('#tabela-itens-compra tbody').html('');
		$('#qtdItens-selecionada').text('');
		$('#valor-selecionada').text('');
	}

	// Populando lista de fornecedores
	$.getJSON({
		url : "adm/compra/" + idCompra,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(compra) {
			// Atribui 0 para minutos
			function addZero(i) {
				if (i < 10) {
					i = "0" + i;
				}
				return i;
			}
			
			// Data da compra
			var dataCompra = new Date(compra.dataCompra);
			var horas = addZero(dataCompra.getHours());
			var minutos = addZero(dataCompra.getMinutes());
			
			// Atributo para caso nulo
			var complemento = compra.endereco.complemento;
			
			// Atribui valor para caso nulo
			if(complemento == ''){
				complemento = '-';
			}

			// Ativando input
			$('#label-status-selecionada').addClass('active');

			// Atribuindo id de compra
			$('#idCompra-selecionada').val(compra.idCompra);
			
			// Atribuindo valores para visualização
			$('#dataCompra-selecionada').text(
					$.datepicker.formatDate('dd/mm/yy', dataCompra));
			$('#horarioCompra-selecionada').text(horas + ':' + minutos);
			$('#input-status-selecionada').val(compra.status);
			$('#frete-selecionada').text('R$' + compra.frete.toFixed(2));
			$('#cliente-compra-selecionada').text(compra.cliente.nome);
			$('#clienteCpf-compra-selecionada').text(compra.cliente.cpf);
			$('#clienteEmail-compra-selecionada').text(
					compra.cliente.contato.email);
			$('#clienteCelular-compra-selecionada').text(
					compra.cliente.contato.celular);
			$('#cep-compra-selecionada').text(compra.endereco.cep);
			$('#logradouro-compra-selecionada').text(compra.endereco.logradouro);
			$('#complemento-compra-selecionada').text(complemento);
			$('#bairro-compra-selecionada').text(compra.endereco.bairro);
			$('#cidade-compra-selecionada').text(compra.endereco.cidade);
			$('#uf-compra-selecionada').text(compra.endereco.uf);
			$('#qtdItens-selecionada').text(compra.itensCompra.length);
			$('#valor-selecionada').text('R$' + compra.valor.toFixed(2));

			// Atribuindo valores para tabela de ITENS
			$.each(compra.itensCompra, function(index, item) {
				// Atributos
				var total = (Number) (item.valor * item.quantidade);
				var tdNome = '<td>' + item.nome + '</td>';
				var tdQtd = '<td>' + item.quantidade + '</td>';
				var tdValorUn = '<td>R$' + item.valor.toFixed(2) + '</td>';
				var tdValorTotal = '<td>R$' + total.toFixed(2)  + '</td>';
				
				// Atribuindo valor
				$('#tabela-itens-compra tbody').append('<tr>' + tdNome 
						+ tdQtd + tdValorUn 
						+ tdValorTotal + '</tr>');
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Alterar status de compra
$('#input-status-selecionada').keypress(function(e) {
    // Get ENTER
	if(e.which == 13) {
		// Cancela qualquer ação padrão do elemento
		e.preventDefault();
		
		// Atributos
		var idCompra = $('#idCompra-selecionada').val();
		var compra = {
			status : $(this).val()
		}
		
		// Confirmar exclusão
		$.confirm({
			title : 'Alteração!',
			animation : 'top',
			useBootstrap : false,
			theme : 'material',
			boxWidth : '50%',
			content : 'Deseja alterar status?',
			buttons : {
				// CONFIRMAR
				confirm : {
					text : 'Alterar',
					btnClass : 'btn-green',
					action : function() {
				        // Alterando status
						$.ajax({
							url : 'adm/alterarStatus/' + idCompra,
							data : JSON.stringify(compra),
							contentType : "application/json; charset=utf-8",
							headers : {
								'Authorization' : localStorage
								.getItem("tokenBigDog")
							},
							type : 'PUT',
							success : function(s){
								Materialize.toast('Status alterado com sucesso!', 2400);
							},
							error : function(e) {
								console.log("ERROR: ", e);
								Materialize.toast('Ops, houve um problema!', 2400);
							}
				 		});
					}
				},
				cancel : {
					// CANCELAR
					text : 'Cancelar',
					action : function() {
					}
				}
			}
		});
	}
});