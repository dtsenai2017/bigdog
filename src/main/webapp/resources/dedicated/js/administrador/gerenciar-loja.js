// Escondendo janelas...
$('#janela-novo-produto').hide();
$('#descricao-consulta').hide();
$('#janela-consultar-produtos').hide();

// Selecionar janela pelos btn (Novo produto ou Consultar)
// Novo produto
$("#btn-novo-produto").click(function() {
	$('#janela-novo-produto').fadeIn(1500);
	$('#janela-consultar-produtos').hide();
	$('#descricao-consulta').hide();

	// Limpando lista de categoria
	$('#select-categoria').empty();

	// Listando categorias para formulário
	$.getJSON({
		url : "categoria",
		type : "GET",
		success : function(categorias) {
			// Select categoria
			var selectCategoria = document.getElementById('#select-categoria');

			// Populando Lista
			$.each(categorias, function(index, categoria) {
				selectCategoria.value = categoria.idCategoria;
				selectCategoria.text = categoria.categoria;
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
});

// Consultar produtos
$("#btn-consultar-produtos").click(function() {
	$('#janela-consultar-produtos').fadeIn(1500);
	$('#descricao-consulta').fadeIn(1500);
	$('#janela-novo-produto').hide();
});

// Inicializadores Materialize ~
// Input Select Team
$('select').material_select();

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