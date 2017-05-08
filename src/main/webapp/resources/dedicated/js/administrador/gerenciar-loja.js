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
	// Refresh na lista
	refreshListaProduto();
	
	// Função para refresh de lista
	function refreshListaProduto(){
		$('#lista-produto').empty();
	}
	
	// Populando lista de produtos
	// Listando produtos
	$.getJSON({
		url : "adm/produto",
		type : "GET",
		success : function(produtos) {
			// Populando Lista
			$.each(produtos, function(index, produto) {
				// console.log(atob(produto.foto));

				// Linha de lista
				var liProduto = '<li class="collection-item avatar">'
						+ '<img src="' + atob(produto.foto)
						+ '" class="circle">' + '<span class="title"><b>'
						+ produto.nome + '</b>' 
						+ '</span>' + '<p>'+ produto.categoria.nome
						+ '<br>'+ produto.marca
						+ '<br>'+'R$ '+ produto.valor + ' </p>'
						+ '<a href="#modal-produto" onclick="abrirModalProduto('
						+ produto.idProduto + ');" class="secondary-content">'
						+ '<i class="material-icons cyan-text">' + 'zoom_in'
						+ '</i></a></li>';

				// Populando lista
				$('#lista-produto').append(liProduto);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Modal para visualizar dados do produto
$('#modal-produto').modal({
	dismissible : true, // Modal can be dismissed by clicking outside of the
	complete : function() {
		// Quando modal for fechado, recarrega lista de categorias
// abrirPrincipalProduto();
	} // Callback for Modal close
});

// Abrir modal para produto
function abrirModalProduto(idProduto){
	// Fechando card reveal
	$('#titulo-card-reveal').click();
	
	// Obtendo informações do produto
	// Listando produto (id)
	$.getJSON({
		url : "adm/produto/"+ idProduto,
		type : "GET",
		success : function(produto) {
			// Atribuindo valores...
			// Imagem, id de produto, nome do produto e descrição do
			// produto
			$('#imagem-produto-selecionado').attr('src', atob(produto.foto));
			$('#idProduto').val(produto.idProduto);
			$('#nomeProduto').text(produto.nome);
			$('#descricaoProduto').text(produto.descricao);
			
			// Atribuindo marca, categoria e subcategoria
			$('#marcaProduto').text(produto.marca);
			$('#categoriaProduto').text(produto.categoria.nome);
			$('#subcategoriaProduto').text(produto.subCategoria.nome);
			
			// Cor e tamanho
			$('#corProduto').text(produto.cor);
			$('#tamanhoProduto').text(produto.tamanho);
			
			// Quantidade de produto, de estoque e o valor do produto
			$('#quantidadeProduto').text(produto.quantidade);
			$('#qtdEstoqueProduto').text(produto.qtdEstoque);
			$('#valorProduto').text('R$ '+ produto.valor);
			
			// Fornecedor
			$('#fornecedorProduto').text(produto.fornecedor.nomeFantasia);
			$('#dataVigenciaProduto').text($.datepicker.formatDate('dd/mm/yy', new Date(produto.dataVigencia)));
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Refresh em Card Reveal
function limparCardReveal(){
	// Atribuindo valor de imagem
	$('#imagem-produtoSelecionado').attr('src','');
	$('#pacote-fotoProduto').val('');
	$('#pacote-fotoProduto').removeClass('validate');
	$('#pacote-fotoProduto').addClass('validate');
	
	// Alterando cor de botão
	$('#btn-fotoProduto').removeClass('green');
	$('#btn-fotoProduto').removeClass('red');
	$('#btn-fotoProduto').addClass('cyan');
	
	// Retirando valor de tamanho da foto
	$('#tamanho-fotoProduto').text('');
	
	// Escondendo botão de alteração
	$('#btn-alterar-foto').hide();
}

// Visualizar foto de alteração
// Verifica se imagem foi selecionada
$("#fotoProduto").bind("change", function() {
	// Atributos
	var selectFile = $(this).val();
	
	// Verifica imagem selecionada
	if (selectFile.length > 0) {
		// Atributos
		var maxSizeFile = 5242880;
		var sizeFileMB = parseInt(Math.floor(Math.log($(this)[0].files[0].size) / Math.log(1024)));
		
		// Verifica tamanho da foto (max:5mb-5242880ytes)
		if($(this)[0].files[0].size < maxSizeFile ){
			// Alterando cor de botão
			$('#btn-fotoProduto').addClass('green');
			
			// Atribuindo valor para exibição de tamanho
			$('#tamanho-fotoProduto').text(sizeFileMB + ' MB.');

			// Método para alterar foto
			escolherFoto();
			
			// Escolhendo foto do produto, caso seja selecionada
			function escolherFoto() {
				// Atributos
				var file = $('#fotoProduto')[0].files[0];
				var foto = lerFoto(file);

				// Função para leitura de foto em bin
				function lerFoto(file) {
					// Atributo
					var reader = new FileReader();

					// Valor de callback
					reader.onload = function(e) {
						// Atribuindo imagem selecionada para tag de
						// visualização
						$('#imagem-produtoSelecionado').attr("src", e.target.result);
						$('#imagem-produtoSelecionado').fadeIn(2400);
					}
					// Ler file
					reader.readAsDataURL(file);
				}
			}
			
			// Mostrando botão de alteração
			$('#btn-alterar-foto').fadeIn(600);
		} else {
			// Toast
			Materialize.toast("Foto muito grande!", 2500);
		}
	} else {
		// Retirando vizualização
		$('#imagem-produtoSelecionado').attr("src", '');

		// Toast
		Materialize.toast("Imagem não selecionada", 2500);

		// Alterando cor de botão
		$('#btn-fotoProduto').removeClass('green');
		$('#btn-fotoProduto').removeClass('cyan');
		$('#btn-fotoProduto').addClass('red');
		
		// Retirando valor de tamanho da foto
		$('#tamanho-fotoProduto').text('');
		
		// Escondendo botão de alteração
		$('#btn-alterar-foto').hide();
	}
});

// Alterando foto
$("#btn-alterar-foto").click(function() {
	// Atributos para leitura de file
	var file = $('#fotoProduto')[0].files[0];
	var reader = new FileReader();
	var mensagem;
	
	// Id e objeto que será alterado
	var idProduto = $('#idProduto').val();
	var produto = {
			foto
	}
	
	// Retornando valor de conversão e fazendo requisição
	reader.onload = function(e) {
		// Atributo para foto em BLOB (byteArray[])
		var fotoByte = btoa(e.target.result);

		// Atribuindo valor de foto para produto
		produto.foto = fotoByte; 
		
		// Cadastrando produto
		$.ajax({
			type : "PUT",
			url : "adm/produtoImagem/"+ idProduto,
			data : JSON.stringify(produto),
			contentType : "application/json; charset=utf-8",
			success : function(s) {
				// Mensagem para toast
				mensagem ="Foto alterada!";
				
				// Fechando card reveal
				$('#titulo-card-reveal').click();
				
				// Abrir modal de produto
				abrirModalProduto(idProduto);
			},
			error : function(e) {
				// Mensagem para toast
				mensagem = 'Ops, houve um problema!';
				console.log(e);
			},
			complete : function() {
				// Toast
				Materialize.toast(mensagem, 2800);
			}
		});
	}

	// Conversão de file para blob
	reader.readAsDataURL(file);
});

/* Atribuindo valores de produto para formulário de alteração */
$("#btn-alterar-produto").click(function(){
    var idProduto = $('#idProduto').val();
    
    // Requisição para atribuição de valores do produto no formulário
    $.getJSON({
		url : "adm/produto/" + idProduto,
		type : "GET",
		success : function(produto) {
			// Atribui dados para formulário de alteração
			$('#label-nome-p-selecionado').addClass('active');
			$('#nome-p-selecionado').val(produto.nome);
			$('#label-marca-p-selecionado').addClass('active');
			$('#marca-p-selecionado').val(produto.marca);
			$('#label-cor-p-selecionado').addClass('active');
			$('#select-categoria-p-selecionado').val('4').change();
			
			$('#cor-p-selecionado').val(produto.cor);
			$('#label-tamanho-p-selecionado').addClass('active');
			$('#tamanho-p-selecionado').val(produto.tamanho);
			$('#label-qtd-p-selecionado').addClass('active');
			$('#quantidade-p-selecionado').val(produto.quantidade);
			$('#label-valor-p-selecionado').addClass('active');
			$('#valor-p-selecionado').val(produto.valor);
			$('#label-qtdEstoque-p-selecionado').addClass('active');
			$('#qtdEstoque-p-selecionado').val(produto.qtdEstoque);
			$('#label-dataVigencia-p-selecionado').addClass('active');
			$('#dataVigencia-p-selecionado').val(produto.dataVigencia);
			$('#label-descricao-p-selecionado').addClass('active');
			$('#descricao-p-selecionado').val(produto.descricao);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
    
    // Requisições para categoria, subcategoria e fornecedor
    // Listando categorias para formulário
	$.getJSON({
		url : "adm/categoria",
		type : "GET",
		success : function(categorias) {
			// Populando Lista
			$.each(categorias, function(index, categoria) {
				$('#select-categoria-p-selecionado').append(
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
	$.getJSON({
		url : "adm/fornecedor",
		type : "GET",
		success : function(fornecedores) {
			// Populando Lista
			$.each(fornecedores, function(index, fornecedor) {
				$('#select-fornecedor-p-selecionado').append(
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
});

// Abrir subcategorias de categoria 'selecionada' no select do formulário de
// alteração do produto
$('#select-categoria-p-selecionado').change(
	function() {
		// Atributos
		var idCategoria = $(this).val();
		
		// Limpando campos de formulário
		$('#form-alterar-produto').find('input, textarea').val("");

		// Limpando lista de subcategoria
		$('#select-subcategoria-p-selecionado').empty().html('');

		// Inserindo opção de valor default para subcategoria
		$('#select-subcategoria-p-selecionado').append(
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
					$('#select-subcategoria-p-selecionado').append(
							$('<option></option>').attr('value',
									subcategoria.idSubCategoria).text(
									subcategoria.nome));
				});
	
				// Inicializar, atualizar e limpar o cursor de SELECT BOX
				$("#select-subcategoria-p-selecionado").material_select('update');
			},
			error : function(e) {
				console.log("ERROR: ", e);
			}
		});
});

// Abrir formulário de produto
function abrirFormProduto() {
	// Abrindo janela para cadastro de produto
	$('#novo-produto').fadeIn(1500);

	// Limpando lista de categoria e *subcategoria, fornecedor e componentes
	// relacionados à 'foto'
	$('#select-categoria').empty().html(' ');
	$('#select-fornecedor').empty().html(' ');
	$('#select-subcategoria').empty().html(' ');
	$('#imagem-produto').attr('src','');
	$('#foto').val('');
	$('#pacote-foto').val('');
	$('#pacote-foto').removeClass('validate');
	$('#pacote-foto').addClass('validate');
	$('#btn-foto').removeClass('green');
	$('#btn-foto').removeClass('red');
	$('#btn-foto').removeClass('cyan');
	$('#btn-foto').addClass('cyan');
	$('#tamanho-foto').text('');
	
	// Limpando campos de formulário
	$('#form-produto').find('input, textarea').val("");
	
	// Listando categorias para formulário
	$.getJSON({
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
	$.getJSON({
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

// Verifica se imagem foi selecionada
$("#foto").bind("change", function() {
	// Atributos
	var selectFile = $(this).val();
	
	// Verifica imagem selecionada
	if (selectFile.length > 0) {
		// Atributos
		var maxSizeFile = 5242880;
		var sizeFileMB = parseInt(Math.floor(Math.log($(this)[0].files[0].size) / Math.log(1024)));
		
		// Verifica tamanho da foto (max:5mb-5242880ytes)
		if($(this)[0].files[0].size < maxSizeFile ){
			// Alterando cor de botão
			$('#btn-foto').addClass('green');
			
			// Atribuindo valor para exibição de tamanho
			$('#tamanho-foto').text(sizeFileMB + ' MB.');

			// Método para alterar foto
			escolherFoto();
			
			// Escolhendo foto do produto, caso seja selecionada
			function escolherFoto() {
				// Atributos
				var file = $('#foto')[0].files[0];
				var foto = lerFoto(file);

				// Função para leitura de foto em bin
				function lerFoto(file) {
					// Atributo
					var reader = new FileReader();

					// Valor de callback
					reader.onload = function(e) {
						// Atribuindo imagem selecionada para tag de
						// visualização
						$('#imagem-produto').attr("src", e.target.result);
						$('#imagem-produto').fadeIn(2400);
					}
					// Ler file
					reader.readAsDataURL(file);
				}
			}
		} else {
			// Toast
			Materialize.toast("Foto muito grande!", 2500);
			
			// Refresh em modal
			abrirFormProduto();
		}
	} else {
		// Retirando vizualização
		$('#imagem-produto').attr("src", '');

		// Toast
		Materialize.toast("Imagem não selecionada", 2500);

		// Alterando cor de botão
		$('#btn-foto').removeClass('green');
		$('#btn-foto').removeClass('cyan');
		$('#btn-foto').addClass('red');
		
		// Retirando valor de tamanho da foto
		$('#tamanho-foto').text('');
	}
});

// Inserir produto
$("#form-produto").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Atributos para leitura de file
	var file = $('#foto')[0].files[0];
	var reader = new FileReader();

	// Atributo que será inserido
	var produto = {
		nome : $('#nome').val(),
		descricao : $('#descricao').val(),
		qtdEstoque : $('#qtdEstoque').val(),
		valor : $('#valor').val(),
		marca : $('#marca').val(),
		tamanho : $('#tamanho').val(),
		cor : $('#cor').val(),
		foto,
		quantidade : $('#quantidade').val(),
		dataVigencia : $('#dataVigencia').val(),
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

	// Retornando valor de conversão e fazendo requisição
	reader.onload = function(e) {
		// Atributo para foto em BLOB (byteArray[])
		var fotoByte = btoa(e.target.result);

		// Atribuindo valor de foto para produto
		produto.foto = fotoByte; 
		
		// Cadastrando produto
		$.ajax({
			type : "POST",
			url : "adm/produto",
			data : JSON.stringify(produto),
			contentType : "application/json; charset=utf-8",
			success : function(s) {
				// Mensagem para toast
				mensagem = 'Produto inserido com sucesso!';
				
				// Refresh no formulário
				abrirFormProduto();
			},
			error : function(e) {
				// Mensagem para toast
				mensagem = 'Ops, houve um problema!';
				console.log(e);
			},
			complete : function() {
				// Toast
				Materialize.toast(mensagem, 2800);
			}
		});
	}

	// Conversão de file para blob
	reader.readAsDataURL(file);
});

// Excluir Produto
$("#btn-excluir-produto").click(function() {
	// Atributo
	var mensagem;
	var idProduto = $('#idProduto').val();

	// Confirmar exclusão
	$.confirm({
		title : 'Exclusão!',
		animation : 'top',
		useBootstrap : false,
		theme : 'material',
		boxWidth : '50%',
		content : 'Deseja excluir produto?',
		buttons : {
			// CONFIRMAR
			confirm : {
				text : 'Excluir',
				btnClass : 'btn-red',
				action : function() {
					// Excluindo
					$.ajax({
						url : 'adm/produto/' + idProduto,
						type : 'DELETE',
						success : function(result) {
							// Atribundo valor para mensagem de toast
							mensagem = "Produto excluído com sucesso!";

							// Toast
							Materialize.toast(mensagem, 2800);

							// Fechando modal
							$('#modal-produto').modal('close');

							// Ir para principal produto
							abrirPrincipalProduto();
						},
						error : function(e) {
							// Verifica erro
							mensagem = "Ops, houve um problema!";

							// Atribundo valor para mensagem de toast
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
});

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
						+ '<i class="material-icons '
						+ 'red-text text-lighten-2">' + 'delete'
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
							// Verifica erro
							if(e.status == 403){
								mensagem = "Não é possível excluir categoria pois há produto(s) vinculado(s) !";
							} else {
								mensagem = "Ops, houve um problema!";
							}

							// Atribundo valor para mensagem de toast
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
							// Verifica erro
							if(e.status == 403){
								mensagem = "Não é possível excluir sub-categoria pois há produto(s) vinculado(s) !";
							} else {
								mensagem = "Ops, houve um problema!";
							}
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
