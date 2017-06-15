// JS dedicado para gerenciamento de produto
// Botão de opção de gerenciamento para produto (Abre janela principal)
$("#btn-produto").click(function() {
	// Mostrando janela
	$('#main-produto').fadeIn(1500);
	$('#main-fornecedor').hide();
	$('#main-compras').hide();
});

// Inicializador para datepicker
$('.datepicker').pickadate(	{
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
	format : 'dd/mm/yyyy'
});

// Input Textarea com contador de caracter (Descrição de produto)
$('input#input_text, textarea#textarea1').characterCounter();

// Input search produto (Captura a tecla enter)
$('#search-produto').keypress(function(e) {
	// Verifica se ENTER foi pressionado
	if (e.which == 13) {
		// Cancela qualquer ação padrão do elemento
		e.preventDefault();

		// Toast
		Materialize.toast("Apenas digite sua busca!", 2500);
	}
});

// Input search categoria (Captura a tecla enter)
$('#search-categoria').keypress(function(e) {
	// Verifica se ENTER foi pressionado
	if (e.which == 13) {
		// Cancela qualquer ação padrão do elemento
		e.preventDefault();

		// Toast
		Materialize.toast("Apenas digite sua busca!", 2500);
	}
});

// Escondendo link para lista de categorias
$('#btn-esconder-categorias').hide();

// Mostrar lista completa de categoria
function mostrarListaCategoria() {
	$('#lista-categoria li').fadeIn(500);
	$('#btn-esconder-categorias').fadeIn(800);
	$('#btn-mostrar-categorias').hide();
}

// Esconder lista completa de categoria
function esconderListaCategoria() {
	$('#btn-mostrar-categorias').fadeIn(500);
	$('#lista-categoria li').fadeOut(300);
	$('#btn-esconder-categorias').hide();
	$('#search-categoria').val('');
}

// Carregar categorias e subcategorias para modal de categoria
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
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
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
		url : "adm/categoria",
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "POST",		
		data : JSON.stringify(categoria),
		contentType : "application/json; charset=utf-8",
		success : function(s) {
			// Mensagem para toast
			mensagem = 'Inserida com sucesso!';
			
			// Refresh em lista de categoria no formulário de cadastro
			refreshFormListaCategoria();
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

// Refresh na lista de categoria do formulário de cadastro de produto
function refreshFormListaCategoria() {
	// Limpando select de formulário
	$('#select-categoria').empty().html(' ');
	
	// Listando categorias para formulário de alteração
	$.getJSON({
		url : "adm/categoria",
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(categorias) {
			// Populando Lista
			$.each(categorias, function(index, categoria) {
				$('#select-categoria').append(
						$('<option></option>').attr('value', categoria.idCategoria).text(
								categoria.nome));
			});
				
			// Inicializar, atualizar e limpar o cursor de SELECT BOX
			$("select").material_select('update');
			$("select").closest('.input-field').children('span.caret').remove();
		},
	 	error : function(e) {
	 		console.log("ERROR: ", e);
	 	}
	 });
}

// Refresh na lista de subcategoria do formulário de cadastro de produto
function refreshFormListaSubcategoria(idCategoria) {
	// Limpando lista de subcategoria
	$('#select-subcategoria').empty().html('');

	// Inserindo opção de valor default para subcategoria
	$('#select-subcategoria').append(
			$('<option></option>').attr('value', '').text(
					'Selecione uma opção'));

	// Listando categorias para formulário
	$.getJSON({
		url : "adm/categoria/" + idCategoria,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
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
}

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
		url : "adm/categoria/" + idCategoria,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
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
		url : "adm/subcategoria/ " + idCategoria,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "POST",
		data : JSON.stringify(subcategoria),
		contentType : "application/json; charset=utf-8",
		success : function(s) {
			// Mensagem para toast
			mensagem = 'Inserida com sucesso!';
			
			// Limpa select de subcategoria em formulário
			$('#select-subcategoria').empty().html(' ');

			// Reload na modal de edição de subcategoria
			abrirEditarCategoria(idCategoria);
			
			// Refresh em select de subcategoria em formulário de produto
			refreshFormListaSubcategoria(idCategoria);
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
						headers : {
							'Authorization' : localStorage
									.getItem("tokenBigDog")
						},
						type : 'DELETE',
						success : function(result) {
							// Atribundo valor para mensagem de toast
							mensagem = "Categoria excluída com sucesso!";

							// Fechando modal
							$('#modal-categoria').modal('close');

							// Modal categorias
							abrirModalCategorias();
							
							// Alterando lista de formulário
							refreshFormListaCategoria();
						},
						error : function(e) {
							// Verifica erro
							if(e.status == 403){
								mensagem = "Não é possível excluir categoria pois há produto(s) vinculado(s) !";
							} else {
								mensagem = "Ops, houve um problema!";
							}
						}, 
						complete : function(c) {
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
						headers : {
							'Authorization' : localStorage
									.getItem("tokenBigDog")
						},
						type : 'DELETE',
						success : function(result) {
							// Atribundo valor para mensagem de toast
							mensagem = "Subcategoria excluída com sucesso!";

							// Reload na modal
							abrirEditarCategoria(idCategoria);
							
							// Limpando select de formulário
							$('#select-subcategoria').empty().html(' ');
							
							// Refresh em select de subcategoria em formulário
							// de produto
							refreshFormListaSubcategoria(idCategoria);
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

// Abrir tab principal de produtos e listando TODOS produtos
function abrirPrincipalProduto() {
	// Limpando lista de produtoss
	$('#lista-produto').empty();

	// Populando lista de produtos
	$.getJSON({
		url : "adm/produtoOrdenadoNome",
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(produtos) {
			// Populando Lista
			$.each(produtos, function(index, produto) {
				// Linha de lista
				var liProduto = '<li class="collection-item avatar">'
						+ '<img src="'
						+ atob(produto.foto)
						+ '" class="circle">'
						+ '<span class="title"><b>'
						+ produto.nome
						+ '</b>'
						+ '</span>'
						+ '<p>'
						+ produto.categoria.nome
						+ '<br>'
						+ produto.marca
						+ '<br>'
						+ 'R$ '
						+ produto.valor.toFixed(2)
						+ ' </p>'
						+ '<a href="#modal-produto"'
						+ 'onclick="abrirModalProduto('
						+ produto.idProduto
						+ ');"'
						+ 'class="secondary-content">'
						+ '<i class="material-icons cyan-text">'
						+ 'zoom_in'
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

// Abrir modal para produto selecionado
function abrirModalProduto(idProduto) {
	// Fechando card reveal, caso esteje aberto...
	$('#titulo-card-reveal').click();
	
	// Limpando campos de modal
	$('#imagem-produto-selecionado').attr('src', '');
	$('#idProduto-selecionado').val('');
	$('#nomeProduto').text('');
	$('#descricaoProduto').text('');
	$('#marcaProduto').text('');
	$('#categoriaProduto').text('');
	$('#subcategoriaProduto').text('');
	$('#corProduto').text('');
	$('#tamanhoProduto').text('');
	$('#quantidadeProduto').text('');
	$('#qtdEstoqueProduto').text('');
	$('#valorProduto').text('');
	$('#fornecedorProduto').text('');
	$('#dataVigenciaProduto').text('');
	
	// Populando dados de modal com produto selecionado
	$.getJSON({
		url : "adm/produto/" + idProduto,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(produto) {
			// Atributo para data
			var dataVigencia = new Date(produto.dataVigencia);
			dataVigencia.setDate(dataVigencia.getDate() + 1);
			
			// Atributos que podem ser null
			var subCategoria;
			var descricao = produto.descricao;
			var tamanho = produto.tamanho;
			var cor = produto.cor;
			
			// Atribuindo valores
			if(produto.subCategoria == null){
				subCategoria = '-';
			} else {
				subCategoria = produto.subCategoria.nome;
			}
			
			if ( descricao == '' ){
				descricao = '-';
			}
			
			if ( tamanho == '' ){
				tamanho = '-';
			}
			
			if ( cor == '' ){
				cor = '-';
			}

			// Atribuindo valores...
			$('#imagem-produto-selecionado').attr('src', atob(produto.foto));
			$('#idProduto-selecionado').val(produto.idProduto);
			$('#nomeProduto').text(produto.nome);
			$('#descricaoProduto').text(descricao);
			$('#marcaProduto').text(produto.marca);
			$('#categoriaProduto').text(produto.categoria.nome);
			$('#corProduto').text(cor);
			$('#subcategoriaProduto').text(subCategoria);
			$('#tamanhoProduto').text(tamanho);
			$('#quantidadeProduto').text(produto.quantidade);
			$('#qtdEstoqueProduto').text(produto.qtdEstoque);
			$('#valorProduto').text('R$ ' + produto.valor.toFixed(2));
			$('#fornecedorProduto').text(produto.fornecedor.nomeFantasia);
			$('#dataVigenciaProduto').text(
					$.datepicker.formatDate('dd/mm/yy', dataVigencia));
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Refresh em Card Reveal
function limparCardReveal() {
	// Atribuindo valor de imagem
	$('#imagem-produtoSelecionado').attr('src', '');
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

// Visualizar foto de ALTERAÇÂO
// Verifica se imagem foi selecionada
$("#fotoProduto").bind(
		"change",
		function() {
			// Atributos
			var selectFile = $(this).val();

			// Verifica imagem selecionada
			if (selectFile.length > 0) {
				// Atributos
				var maxSizeFile = 5242880;
				var sizeFileMB = parseInt(Math.floor(Math
						.log($(this)[0].files[0].size)
						/ Math.log(1024)));

				// Verifica tamanho da foto
				if ($(this)[0].files[0].size < maxSizeFile) {
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
								$('#imagem-produtoSelecionado').attr("src",
										e.target.result);
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

// Alterando foto de produto selecionado
$("#btn-alterar-foto").click(function() {
	// Atributos para leitura de file
	var file = $('#fotoProduto')[0].files[0];
	var reader = new FileReader();
	var mensagem;
	
	// Id e objeto que será alterado
	var idProduto = $('#idProduto-selecionado').val();
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
			url : "adm/produtoImagem/"+ idProduto,
			headers : {
				'Authorization' : localStorage
						.getItem("tokenBigDog")
			},
			type : "PUT",			
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

// Atribuindo valores de produto para formulário de alteração
$("#btn-alterar-produto").click(function(){
    // Atributo
	var idProduto = $('#idProduto-selecionado').val();
	
	// Atribuindo valor de select de edição
	if($('#checkbox-alterar-produto').prop('checked')){
		// Desabilita checkbox, clicando novamente
		$('#checkbox-alterar-produto').trigger('click');
	}
	
    // Requisição para atribuição de valores do produto no formulário
    $.getJSON({
		url : "adm/produto/" + idProduto,
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(produto) {
			// Atributos
			var dataVigencia = new Date(produto.dataVigencia);
			dataVigencia.setDate(dataVigencia.getDate() + 1);
			
			// Ativando labels
			$('#label-nome-p-selecionado').addClass('active');
			$('#label-marca-p-selecionado').addClass('active');
			$('#label-cor-p-selecionado').addClass('active');
			$('#label-disabled-categoria').addClass('active');
			$('#label-disabled-fornecedor').addClass('active');
			$('#label-disabled-subcategoria').addClass('active');
			$('#label-tamanho-p-selecionado').addClass('active');
			$('#label-qtd-p-selecionado').addClass('active');
			$('#label-valor-p-selecionado').addClass('active');
			$('#label-qtdEstoque-p-selecionado').addClass('active');
			$('#label-dataVigencia-p-selecionado').addClass('active');
			$('#label-descricao-p-selecionado').addClass('active');
			
			// Atribui dados para formulário de alteração
			$('#nome-p-selecionado').val(produto.nome);
			$('#marca-p-selecionado').val(produto.marca);
			$('#cor-p-selecionado').val(produto.cor);
			$('#idCategoria-p-selecionado').val(produto.categoria.idCategoria);
			$('#disabled-categoria').val(produto.categoria.nome);
			$('#idSubcategoria-p-selecionado').val(produto.subCategoria == null ? null : produto.subCategoria.idSubCategoria);
			$('#disabled-fornecedor').val(produto.fornecedor.nomeFantasia);
			$('#idFornecedor-p-selecionado').val(produto.fornecedor.idFornecedor);
			$('#disabled-subcategoria').val(produto.subCategoria == null ? null : produto.subCategoria.nome);
			$('#tamanho-p-selecionado').val(produto.tamanho);
			$('#quantidade-p-selecionado').val(produto.quantidade);
			$('#valor-p-selecionado').val(produto.valor.toFixed(2));
			$('#qtdEstoque-p-selecionado').val(produto.qtdEstoque);
			$('#dataVigencia-p-selecionado').val($.datepicker.formatDate('dd/mm/yy', dataVigencia));
			$('#descricao-p-selecionado').val(produto.descricao);
			
			// re-initialize material-select
			$('#select-categoria-p-selecionado').material_select();
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
});

// Habilitar ou desabilitar formulário de alteração de produto
$("#checkbox-alterar-produto").change(function() {
	// Verifica checkbox, para habilitar ou desabilitar formulário
	if(this.checked) {
		// Habilitando inputs para edição
		$('#nome-p-selecionado').prop('disabled', false);
		$('#marca-p-selecionado').prop('disabled', false);
		$('#cor-p-selecionado').prop('disabled', false);
		$('#tamanho-p-selecionado').prop('disabled', false);
		$('#quantidade-p-selecionado').prop('disabled', false);
		$('#valor-p-selecionado').prop('disabled', false);
		$('#qtdEstoque-p-selecionado').prop('disabled', false);
		$('#dataVigencia-p-selecionado').prop('disabled', false);
		$('#descricao-p-selecionado').prop('disabled', false);
	} else {
		// Desabilitando inputs
		$('#nome-p-selecionado').prop('disabled', true);
		$('#marca-p-selecionado').prop('disabled', true);
		$('#cor-p-selecionado').prop('disabled', true);
		$('#tamanho-p-selecionado').prop('disabled', true);
		$('#quantidade-p-selecionado').prop('disabled', true);
		$('#valor-p-selecionado').prop('disabled', true);
		$('#qtdEstoque-p-selecionado').prop('disabled', true);
		$('#dataVigencia-p-selecionado').prop('disabled', true);
		$('#descricao-p-selecionado').prop('disabled', true);
	}
});

// Abrir modal para edição de categoria de produto cadastrado.
function abrirModalAlterarCategoria(){
	// Limpando listas
	$('#select-categoria-p-selecionado').empty().html(' ');
	$('#select-subcategoria-p-selecionado').empty().html(' ');
	
    // Listando categorias para formulário de alteração
	$.getJSON({
		url : "adm/categoria",
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(categorias) {
			// Populando Lista
			$.each(categorias, function(index, categoria) {
				$('#select-categoria-p-selecionado').append(
						$('<option></option>').attr('value', categoria.idCategoria).text(
								categoria.nome));
			});
				
			// Inicializar, atualizar e limpar o cursor de SELECT BOX
			$("select").material_select('update');
			$("select").closest('.input-field').children('span.caret').remove();
		},
	 	error : function(e) {
	 		console.log("ERROR: ", e);
	 	}
	 });
}

// Abrir subcategorias de CATEGORIA SELECIONADA no select do formulário de
// alteração do produto
$('#select-categoria-p-selecionado').change(
		function() {
			// Atributos
			var idCategoria = $(this).val();

			// Limpando lista de subcategoria
			$('#select-subcategoria-p-selecionado').empty().html('');

			// Inserindo opção de valor default para subcategoria
			$('#select-subcategoria-p-selecionado').append(
					$('<option></option>').attr('value', '').text(
							'Selecione uma opção'));

			// Listando categorias para formulário
			$.getJSON({
				url : "adm/categoria/" + idCategoria,
				headers : {
					'Authorization' : localStorage
							.getItem("tokenBigDog")
				},
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
					$("#select-subcategoria-p-selecionado").material_select(
							'update');
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		});

// Alterar valores de categoria e subcategoria de produto selecionado
$("#form-categoria-p-selecionado")
		.submit(
				function(event) {
					// Cancela qualquer ação padrão do elemento
					event.preventDefault();

					// Atributos
					var mensagem;
					var categoria = {
						idCategoria : $(
								'#select-categoria-p-selecionado option:selected')
								.val(),
						nome : $(
								'#select-categoria-p-selecionado option:selected')
								.text()
					}

					var subCategoria = {
						idSubCategoria : $(
								'#select-subcategoria-p-selecionado option:selected')
								.val(),
						nome : $(
								'#select-subcategoria-p-selecionado option:selected')
								.text()
					}

					// Verifica se subcategoria foi selecionada
					if (subCategoria.idSubCategoria == ''
							|| $('#select-subcategoria-p-selecionado').has(
									'option').length == 0) {
						// Atribui valores de alteração para formulário de
						// produto selecionado
						$('#idCategoria-p-selecionado').val(
								categoria.idCategoria);
						$('#disabled-categoria').val(categoria.nome);
						$('#idSubcategoria-p-selecionado').val(null);
						$('#disabled-subcategoria').val('Nenhuma selecionada.');

						// Atribuindo valor para mensagem
						mensagem = 'Categoria selecionada!'
					} else {
						// Atribui valores de alteração para formulário de
						// produto selecionado
						$('#idCategoria-p-selecionado').val(
								categoria.idCategoria);
						$('#disabled-categoria').val(categoria.nome);
						$('#idSubcategoria-p-selecionado').val(
								subCategoria.idSubCategoria);
						$('#disabled-subcategoria').val(subCategoria.nome);

						// Atribuindo valor para mensagem
						mensagem = 'Categoria e Subcategoria selecionadas!'
					}

					// Exibindo mensagem
					Materialize.toast(mensagem, 2000);

					// Fechando modal
					$('#modal-editar-categoria-p-selecionado').modal('close');
				});

// Abrir modal para edição de fornecedor de produto cadastrado.
// Carrega lista de fornecedores para modal
function abrirModalAlterarFornecedor(){
	// Limpando listas
	$('#select-fornecedor-p-selecionado').empty().html(' ');
	
	// Listando fornecedores para formulário de alteração
	$.getJSON({
		url : "adm/fornecedor",
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
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
}

// Alterar valores de fornecedor de produto selecionado
$( "#form-fornecedor-p-selecionado" ).submit(function( event ) {
	// Cancela qualquer ação padrão do elemento
	event.preventDefault();
	
	// Atributos
	var fornecedor = {
		idFornecedor : $('#select-fornecedor-p-selecionado option:selected').val(),
		nomeFantasia : $('#select-fornecedor-p-selecionado option:selected').text()
	}

	// Atribuindo valores para formulário de produto selecionado
	$('#idFornecedor-p-selecionado').val(fornecedor.idFornecedor);
	$('#disabled-fornecedor').val(fornecedor.nomeFantasia);
	
	// Exibindo mensagem
	Materialize.toast("Fornecedor selecionado!", 2000);
	
	// Fechando modal
	$('#modal-editar-fornecedor-p-selecionado').modal('close');
});

// Formulário de ALTERAÇÃO de produto
$( "#form-alterar-produto" ).submit(function( event ) {
	// Cancela qualquer ação padrão do elemento
	event.preventDefault();
	
	// Verifica data
	if(verificarData($('#dataVigencia-p-selecionado'))){
		// Atributos
		var dataInput = $('#dataVigencia-p-selecionado').val();
		var dataVigencia = dataInput.split("/").reverse().join("-");
		var subCategoria = {
				idSubCategoria : $('#idSubcategoria-p-selecionado').val()
		}
		
		// Verifica edição está habilitada
		if(!$('#checkbox-alterar-produto').prop('checked')){
			// Mensagem toast
			Materialize.toast('Habilite alteração!', 2000);
			return;
		}
		
		// Objeto que receberá dados de alteração
		var produto = {
			 idProduto : $('#idProduto-selecionado').val(),
			 nome : $('#nome-p-selecionado').val(),
			 descricao : $('#descricao-p-selecionado').val(),
			 qtdEstoque : $('#qtdEstoque-p-selecionado').val(),
			 valor : $('#valor-p-selecionado').val(),
			 marca : $('#marca-p-selecionado').val(),
			 cor : $('#cor-p-selecionado').val(),
			 tamanho : $('#tamanho-p-selecionado').val(),
			 quantidade : $('#quantidade-p-selecionado').val(),
			 dataVigencia : dataVigencia,
			 foto : null,
			 categoria : {
				 idCategoria : $('#idCategoria-p-selecionado').val()
			 },
			 subCategoria : 
					subCategoria.idSubCategoria == '' ?
							null :
								subCategoria,
			 fornecedor : {
				 idFornecedor : $('#idFornecedor-p-selecionado').val()
			 }
		 }
		 
		// Cadastrando produto
		$.ajax({
			url : "adm/produto/"+ produto.idProduto,
			headers : {
				'Authorization' : localStorage
						.getItem("tokenBigDog")
			},
			type : "PUT",
			data : JSON.stringify(produto),
			contentType : "application/json; charset=utf-8",
			success : function(s) {
				// Mensagem para toast
				mensagem = 'Produto alterado com sucesso!';
				
				// Fechando modal
				$('#modal-editar-produto').modal('close');
				
				// Abrir modal de produto (Refresh)
				abrirModalProduto(produto.idProduto);
				
				// Recarregando lista de produtos na aba 'principal'
				abrirPrincipalProduto();
			},
			error : function(e) {
				// Mensagem para toast
				mensagem = 'Ops, houve um problema!';
				console.log('ERROR : ' + e);
			},
			complete : function() {
				// Toast
				Materialize.toast(mensagem, 2800);
			}
		});
	} else {
		// Toast
		Materialize.toast('Informe a data de vigência!', 2400);
	}
});

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
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
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
		headers : {
			'Authorization' : localStorage
					.getItem("tokenBigDog")
		},
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
	e.preventDefault();
	
	// Verifica data
	if(verificarData($('#dataVigencia'))){
		// Atributos para leitura de file
		var file = $('#foto')[0].files[0];
		var reader = new FileReader();
		var dataInput = $('#dataVigencia').val();
		var dataVigencia = dataInput.split("/").reverse().join("-");
		var subCategoria = {
			idSubCategoria : $('#select-subcategoria').val()
		}
		
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
			dataVigencia : dataVigencia,
			categoria : {
				idCategoria : $('#select-categoria').val()
			},
			subCategoria : 
				subCategoria.idSubCategoria == '' ?
						null :
							subCategoria,
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
				url : "adm/produto",
				headers : {
					'Authorization' : localStorage
							.getItem("tokenBigDog")
				},
				type : "POST",
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
			 		console.log("ERROR : " + e);
			 	},
			 	complete : function() {
			 		// Toast
			 		Materialize.toast(mensagem, 2800);
			 	}
			});
		}
		// Conversão de file para blob
		reader.readAsDataURL(file);
	} else {
		// Toast
		Materialize.toast('Informe a data de vigência!', 2400);
	}
});

// Excluir Produto
$("#btn-excluir-produto").click(function() {
	// Atributo
	var mensagem;
	var idProduto = $('#idProduto-selecionado').val();

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
						headers : {
							'Authorization' : localStorage
									.getItem("tokenBigDog")
						},
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
				headers : {
					'Authorization' : localStorage
							.getItem("tokenBigDog")
				},
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
