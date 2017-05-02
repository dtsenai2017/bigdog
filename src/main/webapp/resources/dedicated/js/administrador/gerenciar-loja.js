// Inicializadores Materialize ~
// Input Date materialize
$('.datepicker')
		.pickadate(
				{
					monthsFull : [ 'Janeiro', 'Fevereiro', 'Março', 'Abril',
							'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro',
							'Outubro', 'Novembro', 'Dezembro' ],
					monthsShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
							'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
					weekdaysFull : [ 'Domingo', 'Segunda', 'Terça', 'Quarta',
							'Quinta', 'Sexta', 'Sabádo' ],
					weekdaysShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
							'Sab' ],
					weekdaysLetter : [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S' ],
					today : 'Hoje',
					clear : 'Limpar',
					close : 'Pronto',
					labelMonthNext : 'Próximo mês',
					labelMonthPrev : 'Mês anterior',
					labelMonthSelect : 'Selecione um mês',
					labelYearSelect : 'Selecione um ano',
					selectMonths : true,
					selectYears : 15
				});

// Input Textarea com contador de caracter
$('input#input_text, textarea#textarea1').characterCounter();

// SELECT initialize
$('select').material_select();

// Máscaras
// CNPJ
$("#cnpj").mask("00.000.000/0000-00");

// Celular
$("#celular").unmask();

// Telefone
$('#telefone').mask('(00) 0000-0000');

// Cep
$('#cep').mask('00000-000');

// Escondendo janelas e botões...
$('#btn-esconder-categorias').hide();

// Selecionar janela (Produto ou Fornecedor)
// Mostrar janela de Produto
$("#btn-produto").click(function() {
	// Mostrando janela
	$('#main-produto').fadeIn(1500);
	$('#main-fornecedor').hide();
});

// PRODUTO
// Modal fixo no footer para gerenciar categoria
$('#modal-editar-categoria').modal({
	dismissible : true,
	// modal
	ready : function(modal, trigger) { // Callback for Modal open. Modal and
		// alert("Ready");
	},
	complete : function() {
		// alert('Closed');
	} // Callback for Modal close
});

// Mostrar lista completa de categoria no modal
function mostrarListaCategoria() {
	$('#lista-categoria li').fadeIn(500);
	$('#btn-esconder-categorias').fadeIn(800);
	$('#btn-mostrar-categorias').hide();
}

// Esconder lista completa de categoria no modal
function esconderListaCategoria() {
	$('#btn-mostrar-categorias').fadeIn(500);
	$('#lista-categoria li').fadeOut(300);
	$('#btn-esconder-categorias').hide();
	$('#search-categoria').val('');
}

// Abrir formulário de produto
function abrirFormProduto() {
	// Abrindo janela para cadastro de produto
	$('#janela-novo-produto').fadeIn(1500);

	// Limpando lista de categoria e *subcategoria
	$('#select-categoria').empty().html(' ');
	$('#select-subcategoria').empty().html(' ');

	// Listando categorias para formulário
	$
			.getJSON({
				url : "categoria",
				type : "GET",
				success : function(categorias) {
					// Populando Lista
					$.each(categorias, function(index, categoria) {
						$('#select-categoria').append(
								$('<option></option>').attr('value',
										categoria.idCategoria).text(
										categoria.nome));
					});

					// Inicializar, atualizar e limpar o cursor de SELECT BOX
					$("select").material_select('update');
					$("select").closest('.input-field').children('span.caret')
							.remove();
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
}

// Abrir subcategorias de categoria 'selecionada' no select do formulário
$('#select-categoria').change(
		function() {
			// Atributos
			var idCategoria = $(this).val();

			// Limpando lista de subcategoria
			$('#select-subcategoria').empty().html('');

			// Inserindo opção de valor default para subcategoria
			$('#select-subcategoria').append(
					$('<option></option>').attr('value', '').text(
							'Selecione uma opção'));

			// Listando categorias para formulário
			$.getJSON({
				url : "categoria/" + idCategoria,
				type : "GET",
				success : function(categoria) {
					// Populando Lista
					$.each(categoria.subCategorias, function(index,
							subcategoria) {
						$('#select-subcategoria').append(
								$('<option></option>').attr('value',
										subcategoria.idSubCategoria).text(
										subcategoria.nome));

						// Inicializar,
						// atualizar e limpar o
						// cursor de SELECT
						// BOX
						$("select").material_select('update');
						$("select").closest('.input-field').children(
								'span.caret').remove();
					});
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		});

// Carregar categorias e subcategorias para modal
function abrirModalCategorias() {
	// Limpando dados de modal
	refreshModal();

	// Limpar formulário
	function refreshModal() {
		$('#lista-categoria').empty();
		$('#nomeCategoria').val('');
		$('#btn-mostrar-categorias').fadeIn(100);
		$('#btn-esconder-categorias').hide();
	}

	// Focus no input
	$('#nomeCategoria').focus();

	// Carregar categorias
	$.getJSON({
		url : "categoria",
		type : "GET",
		success : function(categorias) {
			// Populando Lista
			$.each(categorias, function(index, categoria) {
				// Atributos
				var liCategoria = '<li class="collection-item">'
						+ '<div class="truncate">' + categoria.nome
						+ '<a href="#modal-categoria"'
						+ 'onclick="abrirEditarCategoria('
						+ categoria.idCategoria + ')"'
						+ 'class="secondary-content">'
						+ '<i class="material-icons'
						+ ' red-text text-lighten-2">' + 'open_in_new</i>'
						+ '</a></div></li>';

				// Adicionando na lista
				$('#lista-categoria').append(liCategoria);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// 

// Verifica input de busca de categoria para mudança de ícone de listagem
function verificarValor() {
	// Verifica se campo é vazio para alteração de botões de lista
	if ($('#search-categoria').val() == '') {
		$('#btn-mostrar-categorias').fadeIn(600);
		$('#btn-esconder-categorias').hide();
	} else {
		$('#btn-mostrar-categorias').hide();
		$('#btn-esconder-categorias').fadeIn(600);
	}
}

// Cadastrar uma nova categoria
$("#form-categoria").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Atributos
	var mensagem;

	// Objeto categoria
	var categoria = {
		nome : $('#nomeCategoria').val()
	}

	// Cadastrando nova categoria
	$.ajax({
		type : "POST",
		url : "categoria",
		data : JSON.stringify(categoria),
		contentType : "application/json; charset=utf-8",
		success : function(s) {
			// Mensagem para toast
			mensagem = 'Inserida com sucesso!';
		},
		error : function(e) {
			// Verifica erro
			if (e.status == 500) {
				// Mensagem para toast
				mensagem = 'Ops, categoria já existe!';
			} else {
				// Mensagem para toast
				mensagem = 'Ops, houve um problema!';
			}
		},
		complete : function() {
			// Toast
			Materialize.toast(mensagem, 2800);

			// Reload na modal
			abrirModalCategorias();
		}
	});
});

// Modal para editar categoria
$('#modal-editar-categoria').modal({
	dismissible : true, // Modal can be dismissed by clicking outside of the
	complete : function() {
		// Quando modal for fechado, recarrega lista de categorias
		abrirFormProduto();
	} // Callback for Modal close
});

// Abrir modal para editar a categoria selecionada
function abrirEditarCategoria(idCategoria) {
	// Limpar lista de subcategoria
	limparListaSubcategoria();

	// Limpando modal
	function limparListaSubcategoria() {
		$('#lista-subcategoria').empty();
		$('#nomeSubcategoria').val('');
	}

	// Focus no input
	$('#nomeSubcategoria').focus();

	// Buscando categoria selecionada
	$.ajax({
		type : "GET",
		url : "categoria/" + idCategoria,
		contentType : "application/json; charset=utf-8",
		success : function(categoria) {
			// Atribuindo valor de id para input
			$('#idCategoria').val(categoria.idCategoria);

			// Atribuindo nome para titulo de modal
			$('#titulo-modal-categoria').text(categoria.nome);

			// Populando Lista de subcategoria
			$.each(categoria.subCategorias, function(index, subcategoria) {
				// Atributo
				var liSubcategoria = '<li class="collection-item"><div'
						+ 'class="truncate">' + subcategoria.nome
						+ '<a href="#!" onclick="excluirSubcategoria('
						+ subcategoria.idSubCategoria + ')"'
						+ 'class="secondary-content">'
						+ '<i class="material-icons">' + 'delete'
						+ '</i></a></div></li>';

				// Populando lista
				$('#lista-subcategoria').append(liSubcategoria);
			});
		},
		error : function(e) {
			// Verifica erro
			console.log(e);
		},
	});
}

// Cadastrar uma nova subcategoria
$("#form-subcategoria").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Atributos
	var mensagem;

	// Id Categoria que receberá subcategoria
	var idCategoria = $('#idCategoria').val();

	// Objeto categoria
	var subcategoria = {
		nome : $('#nomeSubcategoria').val()
	}

	// Cadastrando nova categoria
	$.ajax({
		type : "POST",
		url : "subcategoria/ " + idCategoria,
		data : JSON.stringify(subcategoria),
		contentType : "application/json; charset=utf-8",
		success : function(s) {
			// Mensagem para toast
			mensagem = 'Inserida com sucesso!';

			// Reload na modal
			abrirEditarCategoria(idCategoria);
		},
		error : function(e) {
			// Mensagem para toast
			mensagem = 'Ops, houve um problema!';
		},
		complete : function() {
			// Toast
			Materialize.toast(mensagem, 2800);
		}
	});
});

// Excluir categoria
$("#btn-excluir-categoria").click(function() {
	// Atributo
	var mensagem;
	var idCategoria = $('#idCategoria').val();

	// Confirmar exclusão
	$.confirm({
		title : 'Exclusão!',
		animation : 'top',
		useBootstrap : false,
		theme : 'material',
		boxWidth : '50%',
		content : 'Deseja excluir categoria?',
		buttons : {
			// CONFIRMAR
			confirm : {
				text : 'Excluir',
				btnClass : 'btn-red',
				action : function() {
					// Excluindo
					$.ajax({
						url : 'categoria/' + idCategoria,
						type : 'DELETE',
						success : function(result) {
							// Atribundo valor para mensagem de toast
							mensagem = "Categoria excluída com sucesso!";

							// Toast
							Materialize.toast(mensagem, 2800);

							// Fechando modal
							$('#modal-categoria').modal('close');

							// Modal categorias
							abrirModalCategorias();
						},
						error : function(e) {
							// Atribundo valor para mensagem de toast
							Materialize.toast("Ops, houve um problema!");
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
});

// Excluir subcategoria por id de subcategoria
function excluirSubcategoria(idSubCategoria) {
	// Atributos
	var mensagem;
	var idCategoria = $('#idCategoria').val();

	// Excluindo
	// Confirmar exclusão
	$.confirm({
		title : 'Exclusão!',
		animation : 'top',
		useBootstrap : false,
		theme : 'material',
		boxWidth : '50%',
		content : 'Deseja excluir subcategoria?',
		buttons : {
			// CONFIRMAR
			confirm : {
				text : 'Excluir',
				btnClass : 'btn-red',
				action : function() {
					// Excluindo
					$.ajax({
						url : 'subcategoria/' + idSubCategoria,
						type : 'DELETE',
						success : function(result) {
							// Atribundo valor para mensagem de toast
							mensagem = "Subcategoria excluída com sucesso!";

							// Reload na modal
							abrirEditarCategoria(idCategoria);
						},
						error : function(e) {
							// Atribundo valor para mensagem de toast
							mensagem = "Ops, houve um problema!";
						},
						complete : function() {
							// Toast
							Materialize.toast(mensagem, 2800);
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

// FORNECEDOR
$("#btn-fornecedor").click(function() {
	// Mostrando janela
	$('#main-fornecedor').fadeIn(1500);
	$('#main-produto').hide();
});

// Abrir modal para adicionar endereço
function abrirModalEnderecoFornecedor() {

}
