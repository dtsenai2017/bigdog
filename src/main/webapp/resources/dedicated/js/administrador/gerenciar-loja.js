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

// Input Text Área com contador de caracter
$('input#input_text, textarea#textarea1').characterCounter();

// Chips
$('.chips').material_chip();
// Inicializadores/

// Escondendo janelas...
$('#janela-novo-produto').hide();
$('#descricao-consulta').hide();
$('#janela-consultar-produtos').hide();

// Selecionar janela pelos btn (Novo produto ou Consultar)
// Novo produto
$("#btn-novo-produto").click(
		function() {
			$('#janela-novo-produto').fadeIn(1500);
			$('#janela-consultar-produtos').hide();
			$('#descricao-consulta').hide();

			// Limpando lista de categoria e *subcategoria
			$('#select-categoria').empty().html(' ');
			$('#select-subcategoria').empty().html(' ');

			// Listando categorias para formulário
			$.getJSON({
				url : "categoria",
				type : "GET",
				success : function(categorias) {
					// Populando Lista
					$.each(categorias, function(index, categoria) {
						$('#select-categoria').append(
								$('<option ></option>').attr('value',
										categoria.idCategoria).text(
										categoria.categoria));
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
		});

// Abrir subcategorias de categoria selecionada no formulário
$('#select-categoria').change(
		function() {
			// Atributos
			var idCategoria = $(this).val();

			// Limpando lista de subcategoria
			$('#select-subcategoria').empty().html(' ');

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
										subcategoria.subCategoria));

						// Inicializar, atualizar e limpar o cursor de SELECT
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
function abrirCategorias() {
	// Limpando dados de modal
	limpar();

	// Limpar formulário
	function limpar() {
		$('#lista-categorias .collection-item').remove();
		$('#categoria').val('');
		$('#subcategorias').empty();
	}

	// Carregar categorias
	$.getJSON({
		url : "categoria",
		type : "GET",
		success : function(categorias) {
			// Populando Lista
			$.each(categorias, function(index, categoria) {
				// Adicionando para collections
				$('#lista-categorias').append(
						'<li class="collection-item">' + '<div>'
								+ categoria.categoria
								+ '<a href="#" onclick="listarSubcategorias('
								+ categoria.idCategoria
								+ ');" class="secondary-content ">'
								+ '<i class="material-icons">mode_edit</i>'
								+ '</a></div></li>');
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Listar categoria para formulário de alteração
function listarSubcategorias(idCategoria) {
	// Limpar subcategorias
	limparSubcategorias();

	// Limpar input de subcategorias
	function limparSubcategorias() {
		$('#lista-subcategorias').empty();
	}

	// Buscando dados
	$.getJSON({
		url : "categoria/" + idCategoria,
		type : "GET",
		success : function(categoria) {
			// Ativando labels de inputs
			$('#label-categoria').addClass("active");

			// Atribuindo valor para input de categoria
			$('#categoria').val(categoria.categoria);

			// Populando chips de subcategoria
			$.each(categoria.subCategorias, function(index, subcategoria) {
				var inputSubCategoria = '<input class="input red-text'
						+ ' text-lighten-2"' + 'value="'
						+ subcategoria.subCategoria + '"></input>';

				$('#lista-subcategorias').append(inputSubCategoria);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Consultar produtos
$("#btn-consultar-produtos").click(function() {
	$('#janela-consultar-produtos').fadeIn(1500);
	$('#descricao-consulta').fadeIn(1500);
	$('#janela-novo-produto').hide();
});
