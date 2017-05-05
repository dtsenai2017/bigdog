// Inicializadores Materialize
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
					selectYears : 15,
					format : 'yyyy-mm-dd'
				});

// Input Textarea com contador de caracter
$('input#input_text, textarea#textarea1').characterCounter();

// SELECT initialize
$('select').material_select();

// Escondendo link para lista de categorias
$('#btn-esconder-categorias').hide();

// Selecionar janela (Produto ou Fornecedor)
// Mostrar Produto
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
		abrirFormProduto();
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

// Abrir tab principal de produtos
function abrirPrincipalProduto() {
	// Populando lista de produtos
	// Listando produtos
	$.getJSON({
		url : "adm/produto",
		type : "GET",
		success : function(produtos) {
			// Populando Lista
			$.each(produtos, function(index, produto) {
				console.log(atob(produto.foto));

				// Linha de lista
				var liProduto = '<li class="collection-item avatar">'
						+ '<img src="' + atob(produto.foto)
						+ '" class="circle">' + '<span class="title">'
						+ produto.nome + '</span>' + '<p>' + produto.marca
						+ '<br>' + produto.valor + '</p>'
						+ '<a href="#" class="secondary-content">'
						+ '<i class="material-icons">' + 'mode_edit'
						+ '</i></a></li>';

				// Populando lista
				$('#lista-produtos').append(liProduto);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Abrir formulário de produto
function abrirFormProduto() {
	// Abrindo janela para cadastro de produto
	$('#janela-novo-produto').fadeIn(1500);

	// console.log($('#select-fornecedor option').length);

	// Limpando lista de categoria e *subcategoria
	$('#select-categoria').empty().html(' ');
	$('#select-fornecedor').empty().html(' ');
	$('#select-subcategoria').empty().html(' ');

	// Listando categorias para formulário
	$
			.getJSON({
				url : "adm/categoria",
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

	// Listando fornecedores para formulário
	$
			.getJSON({
				url : "adm/fornecedor",
				type : "GET",
				success : function(fornecedores) {
					// Populando Lista
					$.each(fornecedores, function(index, fornecedor) {
						$('#select-fornecedor').append(
								$('<option></option>').attr('value',
										fornecedor.idFornecedor).text(
										fornecedor.nomeFantasia));
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

// Inserir produto
$("#form-produto").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	event.preventDefault();

	// Atributo que será inserido
	var produto = {
		nome : $('#nome').val(),
		descricao : $('#descricao').val(),
		qtdEstoque : $('#qtdEstoque').val(),
		valor : $('#valor').val(),
		marca : $('#marca').val(),
		tamanho : $('#tamanho').val(),
		cor : $('#cor').val(),
		quantidade : $('#quantidade').val(),
		dataVigencia : $('#dataVigencia').val(),
		foto : imgData,
		categoria : {
			idCategoria : $('#select-categoria').val()
		},
		subCategoria : {
			idSubCategoria : $('#select-subcategoria').val()
		},
		fornecedor : {
			idFornecedor : $('#select-fornecedor').val()
		}
	}

	// Cadastrando produto
	$.ajax({
		type : "POST",
		url : "adm/produto",
		data : JSON.stringify(produto),
		contentType : "application/json; charset=utf-8",
		success : function(s) {
			// Mensagem para toast
			mensagem = 'Produto inserido com sucesso!';
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

	// Console test
	console.log(produto);
});

// Escolhendo foto do produto
function escolherFoto(evt) {
	// Atributos
	var file = evt.files[0];
	var foto = lerFoto(file);

	// Função para leitura de foto em bin
	function lerFoto(file) {
		// Atributo
		var reader = new FileReader();
		var resultArray = new Uint8Array(1024 * 1024 * 50);

		// Valor de callback
		reader.onload = function(e) {
			resultArray = e.target.result;

			// Atribuindo imagem selecionada para tag de visualização
			$('#imagem-produto').attr("src", e.target.result);
			$('#imagem-produto').fadeIn(2400);
		}
		// Ler file
		reader.readAsDataURL(file);

		return resultArray;
	}
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
				url : "adm/categoria/" + idCategoria,
				type : "GET",
				success : function(categoria) {
					// Populando Lista
					$.each(categoria.subCategorias, function(index,
							subcategoria) {
						$('#select-subcategoria').append(
								$('<option></option>').attr('value',
										subcategoria.idSubCategoria).text(
										subcategoria.nome));
					});

					// Inicializar, atualizar e limpar o cursor de SELECT BOX
					$("#select-subcategoria").material_select('update');
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
		url : "adm/categoria",
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
		url : "adm/categoria",
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
		url : "adm/categoria/" + idCategoria,
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
		url : "adm/subcategoria/ " + idCategoria,
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
						url : 'adm/categoria/' + idCategoria,
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
						url : 'adm/subcategoria/' + idSubCategoria,
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

// Inserir novo fornecedor
// Cadastrar uma nova subcategoria
$("#form-fornecedor")
		.submit(
				function(e) {
					// Cancela qualquer ação padrão do elemento
					e.preventDefault();

					// Atributos
					var mensagem;

					// Atributo que será inserido (Fornecedor, Contato e UM
					// endereço)
					var fornecedor = {
						nomeFantasia : $('#form-fornecedor').find(
								'input[name="nomeFantasia"]').val(),
						razaoSocial : $('#form-fornecedor').find(
								'input[name="razaoSocial"]').val(),
						cnpj : $('#form-fornecedor').find('input[name="cnpj"]')
								.val(),
						contato : {
							email : $('#form-fornecedor').find(
									'input[name="email"]').val(),
							telefone : $('#form-fornecedor').find(
									'input[name="telefone"]').val(),
							celular : $('#form-fornecedor').find(
									'input[name="celular"]').val()
						},
						enderecos : [ {
							cep : $('#form-fornecedor').find(
									'input[name="cep"]').val(),
							logradouro : $('#form-fornecedor').find(
									'input[name="logradouro"]').val(),
							numero : $('#form-fornecedor').find(
									'input[name="numero"]').val(),
							complemento : $('#form-fornecedor').find(
									'input[name="complemento"]').val(),
							bairro : $('#form-fornecedor').find(
									'input[name="bairro"]').val(),
							cidade : $('#form-fornecedor').find(
									'input[name="cidade"]').val(),
							uf : $('#form-fornecedor')
									.find('select[name="uf"]').val()
						} ]
					}

					console.log(fornecedor);

					// alert($("#form-fornecedor :input[name='cidade']").val());

					// alert($('#form-fornecedor').find(
					// 'input[name="nomeFantasia"]').val());

					// Cadastrando novo fornecedor
					$.ajax({
						type : "POST",
						url : "adm/fornecedor",
						data : JSON.stringify(fornecedor),
						contentType : "application/json; charset=utf-8",
						success : function(s) {
							// Mensagem para toast
							mensagem = 'Fornecedor cadastrado com sucesso!';

							// Limpar Formulario
							limparFormFornecedor();
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

// Limpar campos de formulário
function limparFormFornecedor() {
	// Limpando campos
	$('#nomeFantasia').val('');
	$('#razaoSocial').val('');
	$('#cnpj').val('');
	$('#email').val('');
	$('#telefone').val('');
	$('#celular').val('');
	$('#cep').val('');
	$('#logradouro').val('');
	$('#numero').val('');
	$('#complemento').val('');
	$('#bairro').val('');
	$('#cidade').val('');
	$('#uf').val('AC').attr('select', true);
}
