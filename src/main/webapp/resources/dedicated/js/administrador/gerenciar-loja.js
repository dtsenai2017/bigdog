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

// Escondendo janelas e botões...
$('#btn-esconder-categorias').hide();

// Selecionar janela (Produto ou Fornecedor)
// Mostrar janela de Produto
$("#btn-produto").click(function() {
	// Mostrando janela
	$('#main-produto').fadeIn(1500);
	$('#main-fornecedor').hide();
});

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
		$('#label-categoria').removeClass('active');
		$('#lista-categoria').empty();
		$('#nomeCategoria').val('');
		$('#btn-mostrar-categorias').fadeIn(100);
		$('#btn-esconder-categorias').hide();
	}

	// Subindo para top de modal
	$('#modal-editar-categoria').animate({
		scrollTop : 0
	}, 1000);

	// Carregar categorias
	$.getJSON({
		url : "categoria",
		type : "GET",
		success : function(categorias) {
			// Populando Lista
			$.each(categorias, function(index, categoria) {
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
			Materialize.toast(mensagem, 2800);

			// Refresh modal
			abrirModalCategorias();
		}
	});
});

// Abrir modal para editar a categoria selecionada com dados relacionados
function abrirEditarCategoria(idCategoria) {
	// Cadastrando nova categoria
	$.ajax({
		type : "GET",
		url : "categoria/" + idCategoria,
		contentType : "application/json; charset=utf-8",
		success : function(categoria) {
			// Populando lista de subcategorias

			// Atribuindo id para input de exclusão
			$('#cx-idCategoria').val(categoria.idCategoria);
		},
		error : function(e) {
			// Verifica erro
			mensagem = 'Ops, houve um problema!';
		},
	});
}

// Modal para editar categoria
$('#modal-categoria').modal({
	dismissible : true, // Modal can be dismissed by clicking outside of the
	complete : function() {
		abrirModalCategorias();
	} // Callback for Modal close
});

// Excluir categoria
$("#btn-excluir-categoria").click(function() {
	alert("excluir..." + $('#cx-idCategoria').val());
});

// Main fornecedor
$("#btn-fornecedor").click(function() {
	// Mostrando janela
	$('#main-fornecedor').fadeIn(1500);
	$('#main-produto').hide();
});
