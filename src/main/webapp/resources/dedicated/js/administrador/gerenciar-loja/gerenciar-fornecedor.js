// JS dedicado para gerenciamento de fornecedor
// Botão de opção de gerenciamento para fornecedor (Abre janela principal)
$("#btn-fornecedor").click(function() {
	// Mostrando janela
	$('#main-fornecedor').fadeIn(1500);
	$('#main-produto').hide();
	$('#main-compras').hide();
});

// Input search fornecedor (Enter press)
$('#search-fornecedor').keypress(function(e) {
	// Verifica se ENTER foi pressionado
	if (e.which == 13) {
		// Cancela qualquer ação padrão do elemento
		e.preventDefault();

		Materialize.toast("Apenas digite sua busca!", 2500);
	}
});

// Abrir tab principal de fornecedores
function abrirPrincipalFornecedor() {
	// Limpando lista de fornecedores
	$('#lista-fornecedor').empty();

	// Populando lista de fornecedores
	$.getJSON({
		url : "adm/fornecedor",
		type : "GET",
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		success : function(fornecedores) {
			// Populando Lista
			$.each(fornecedores, function(index, fornecedor) {
				// Atributos valores para campos null
				var telefone = fornecedor.contato.telefone;
				var email = fornecedor.contato.email;

				// Atribui valores para campo null
				if (telefone == '') {
					telefone = '-';
				}

				if (email == '') {
					email = '-';
				}

				// Linha de lista
				var liFornecedor = '<li class="collection-item">'
						+ '<h5><a href="#modal-fornecedor"'
						+ 'onclick="abrirModalFornecedor('
						+ fornecedor.idFornecedor + ');"'
						+ 'class="secondary-content">'
						+ '<i class="material-icons right cyan-text">'
						+ 'zoom_in</i></a><b>' + fornecedor.nomeFantasia
						+ '</b>' + '</h5><br><span><b>Email : </b>' + email
						+ '</span>' + '<br><span><b>CNPJ : </b>'
						+ fornecedor.cnpj + '</span><br>'
						+ '<span><b>Telefone : </b>' + telefone + '</span><br>'
						+ '<span><b>Celular : </b>'
						+ fornecedor.contato.celular + '</span></li>';

				// Populando lista
				$('#lista-fornecedor').append(liFornecedor);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Carregar dados de fornecedor selecionado para modal
function abrirModalFornecedor(idFornecedor) {
	// Limpando lista de endereços de fornecedor
	$('#lista-endereco-fornecedor').empty();

	// Populando lista de fornecedores
	$.getJSON({
		url : "adm/fornecedor/" + idFornecedor,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(fornecedor) {
			// Atributos para exibição no front, caso
			// seja null
			var telefone = fornecedor.contato.telefone;
			var email = fornecedor.contato.email;

			// Atribui valores para campo null
			if (telefone == '') {
				telefone = '-';
			}

			if (email == '') {
				email = '-';
			}

			// Atribuindo informação de fornecedor
			$('#idFornecedor-selecionado').val(fornecedor.idFornecedor);
			$('#titulo-modal-fornecedor').text(fornecedor.nomeFantasia);
			$('#razaoSocialFornecedor').text(fornecedor.razaoSocial);
			$('#cnpjFornecedor').text(fornecedor.cnpj);

			// Atribuindo contato de fornecedor
			$('#emailContatoFornecedor').text(email);
			$('#telefoneContatoFornecedor').text(telefone);
			$('#celularContatoFornecedor').text(fornecedor.contato.celular);

			// Populando Lista de endereços de fornecedor
			$.each(fornecedor.enderecos, function(index, endereco) {
				// Atribui valores para campo null
				var complemento = endereco.complemento;

				// Atribui valor
				if (complemento == null) {
					complemento = '-';
				}

				// Linha de endereco
				var liEnderecoFornecedor = '<li><div '
						+ 'class="collapsible-header">'
						+ endereco.logradouro
						+ '</div>'
						+ '<div class="collapsible-body'
						+ ' cyan white-text">'
						+ '<span><b>CEP: </b>'
						+ endereco.cep
						+ '<br></span>'
						+ '<span><b>Nº: </b>'
						+ endereco.numero
						+ '<br></span>'
						+ '<span><b>Complemento: </b>'
						+ complemento
						+ '<br></span>'
						+ '<span><b>Bairro: </b>'
						+ endereco.bairro
						+ '<br></span>'
						+ '<span><b>Cidade: </b>'
						+ endereco.cidade
						+ '<br></span>'
						+ '<span><b>UF: </b>'
						+ endereco.uf
						+ '<br></span>'
						+ '<div class="divider"></div><br>'
						+ '<div align="right"><a '
						+ 'onclick="abrirAlterarEndereco('
						+ endereco.idEnderecoFornecedor
						+ ')" '
						+ 'href="#modal-endereco-fornecedor">'
						+ '<i class="material-icons'
						+ ' red-text text-lighten-2">'
						+ 'mode_edit</i></a></div>' + '</div></li>';

				// Populando lista
				$('#lista-endereco-fornecedor').append(liEnderecoFornecedor);
			});
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Finalizar ação de endereço do fornecedor
function refreshModalFornecedor(idFornecedor) {
	// Refresh em lista de fornecedores na tab principal
	abrirPrincipalFornecedor(idFornecedor);

	// Refresh em modal de fornecedor
	abrirModalFornecedor(idFornecedor);

	// Limpando formulário de endereço
	limparFormEndereco();
}

// Inserir novo fornecedor
$("#form-fornecedor").submit(function(e) {
	// Atributos
	var mensagem;

	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Limpar campos de formulário
	function limparFormFornecedor() {
		// Limpando campos
		$('#form-fornecedor').find('input').val('');
		$('#select-uf').val('AC').attr('select', true);

		// Atualizando select
		$("select").material_select('update');
	}

	// Atributo que será inserido (Fornecedor, Contato e UM
	// endereço)
	var fornecedor = {
		nomeFantasia : $('#nomeFantasia').val(),
		razaoSocial : $('#razaoSocial').val(),
		cnpj : $('#cnpj').val(),
		contato : {
			email : $('#email').val(),
			telefone : $('#telefone').val(),
			celular : $('#celular').val()
		},
		enderecos : [ {
			cep : $('#cep').val(),
			logradouro : $('#logradouro').val(),
			numero : $('#numero').val(),
			complemento : $('#complemento').val(),
			bairro : $('#bairro').val(),
			cidade : $('#cidade').val(),
			uf : $('#select-uf').val()
		} ]
	}

	// Cadastrando novo fornecedor, com UM endereço.
	$.ajax({
		url : "adm/fornecedor",
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "POST",
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

// Abrir modal para inserção de endereço
$("#btn-novo-endereco-fornecedor").click(function() {
	// Escondendo botão de alteração de novo endereço
	$('#btn-alterar-endereco').hide();
	$('#btn-inserir-endereco').fadeIn(200);

	// Limpando formulário de endereço
	limparFormEndereco();
});

// Puxando dados para formulário em modal de alteração de fornecedor */
$("#btn-alterar-fornecedor").click(function() {
	// Atributos
	var idFornecedor = $('#idFornecedor-selecionado').val();

	// Atribuindo valor para inputs
	// Populando lista de fornecedores
	$.getJSON({
		url : "adm/fornecedor/" + idFornecedor,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(fornecedor) {
			// Ativando label
			$('#label-nomeFantasia-f-selecionado').addClass('active');
			$('#label-razaoSocial-f-selecionado').addClass('active');
			$('#label-cnpj-f-selecionado').addClass('active');
			$('#label-email-f-selecionado').addClass('active');
			$('#label-celular-f-selecionado').addClass('active');
			$('#label-telefone-f-selecionado').addClass('active');

			// Atribuindo valores para inputs
			$('#nomeFantasia-f-selecionado').val(fornecedor.nomeFantasia);
			$('#razaoSocial-f-selecionado').val(fornecedor.razaoSocial);
			$('#cnpj-f-selecionado').val(fornecedor.cnpj);
			$('#email-f-selecionado').val(fornecedor.contato.email);
			$('#celular-f-selecionado').val(fornecedor.contato.celular);
			$('#telefone-f-selecionado').val(fornecedor.contato.telefone);

		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
});

// Alterar fornecedor selecionado
$("#form-alterar-fornecedor").submit(function(e) {
	// Cancela qualquer ação padrão do elemento
	e.preventDefault();

	// Atributos
	var fornecedor = {
		idFornecedor : $('#idFornecedor-selecionado').val(),
		nomeFantasia : $('#nomeFantasia-f-selecionado').val(),
		razaoSocial : $('#razaoSocial-f-selecionado').val(),
		cnpj : $('#cnpj-f-selecionado').val(),
		contato : {
			email : $('#email-f-selecionado').val(),
			celular : $('#celular-f-selecionado').val(),
			telefone : $('#telefone-f-selecionado').val()
		}
	}

	// Alterando
	$.ajax({
		url : "adm/fornecedor/" + fornecedor.idFornecedor,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "PUT",
		data : JSON.stringify(fornecedor),
		contentType : "application/json; charset=utf-8",
		success : function(s) {
			// Mensagem para toast
			mensagem = 'Fornecedor alterado!';

			// Fechando modal de alteração
			$('#modal-alterar-fornecedor').modal('close');

			// Refresh em modal de fornecedor
			refreshModalFornecedor(fornecedor.idFornecedor);
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

// Excluir endereço de fornecedor selecionado
$("#btn-excluir-fornecedor").click(
		function() {
			// Atributo
			var idFornecedor = $('#idFornecedor-selecionado').val();

			// Confirmar exclusão
			$.confirm({
				title : 'Exclusão!',
				animation : 'top',
				useBootstrap : false,
				theme : 'material',
				boxWidth : '50%',
				content : 'Deseja excluir fornecedor?',
				buttons : {
					// CONFIRMAR
					confirm : {
						text : 'Excluir',
						btnClass : 'btn-red',
						action : function() {
							// Excluindo endereço
							$.ajax({
								url : "adm/fornecedor/" + idFornecedor,
								headers : {
									'Authorization' : localStorage
											.getItem("tokenBigDog")
								},
								type : "DELETE",
								contentType : "application/json;"
										+ " charset=utf-8",
								success : function(s) {
									// Mensagem para
									// toast
									mensagem = 'Fornecedor excluído!';

									// Fechando Modal
									$('#modal-fornecedor').modal('close');

									// Refresh em modal
									// de fornecedor
									refreshModalFornecedor(idFornecedor);
								},
								error : function(e) {
									// Verifica erro
									if (e.status == 403) {
										mensagem = "Não é possível excluir"
												+ " fornecedor pois há "
												+ "produto(s) vinculado(s) !";
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
		});

// Inserir ou alterar endereço de fornecedor selecionado
$("#form-endereco-fornecedor").submit(
		function(e) {
			// Cancela qualquer ação padrão do elemento
			e.preventDefault();

			// Atributos
			var idFornecedor = $('#idFornecedor-selecionado').val();
			var enderecoFornecedor = {
				idEnderecoFornecedor : $('#idEnderecoFornecedor-selecionado')
						.val(),
				cep : $('#cep-f-selecionado').val(),
				logradouro : $('#logradouro-f-selecionado').val(),
				numero : $('#numero-f-selecionado').val(),
				complemento : $('#complemento-f-selecionado').val(),
				bairro : $('#bairro-f-selecionado').val(),
				cidade : $('#cidade-f-selecionado').val(),
				uf : $('#uf-f-selecionado').val()
			}

			// Verifica se é alteração ou inserção
			if (enderecoFornecedor.idEnderecoFornecedor == '') {
				// INSERÇÂO
				$.ajax({
					url : "adm/enderecoFornecedor/" + idFornecedor,
					headers : {
						'Authorization' : localStorage.getItem("tokenBigDog")
					},
					type : "POST",
					data : JSON.stringify(enderecoFornecedor),
					contentType : "application/json; charset=utf-8",
					success : function(s) {
						// Mensagem para toast
						mensagem = 'Endereço adicionado!';

						// Fechando modal de endereco
						$('#modal-endereco-fornecedor').modal('close');

						// Refresh em modal de fornecedor
						refreshModalFornecedor(idFornecedor);
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
			} else {
				// ALTERAÇÂO
				// Inserindo endereço em fornecedor
				$.ajax({
					url : "adm/enderecoFornecedor/"
							+ enderecoFornecedor.idEnderecoFornecedor,
					headers : {
						'Authorization' : localStorage.getItem("tokenBigDog")
					},
					type : "PUT",
					data : JSON.stringify(enderecoFornecedor),
					contentType : "application/json; charset=utf-8",
					success : function(s) {
						// Mensagem para toast
						mensagem = 'Endereço alterado!';

						// Fechando modal de endereco
						$('#modal-endereco-fornecedor').modal('close');

						// Refresh em modal de fornecedor
						refreshModalFornecedor(idFornecedor);
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
			}
		});

// Puxar dados de endereço para formulário de alteração
function abrirAlterarEndereco(idEnderecoFornecedor) {
	// Populando formulário
	// Populando lista de fornecedores
	$.getJSON({
		url : "adm/enderecoFornecedor/" + idEnderecoFornecedor,
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		type : "GET",
		success : function(endereco) {
			// Escondendo botão de inserção de novo endereço
			$('#btn-inserir-endereco').hide();
			$('#btn-alterar-endereco').fadeIn(200);

			// Ativando labels
			$('#label-cep-f-selecionado').addClass('active');
			$('#label-logradouro-f-selecionado').addClass('active');
			$('#label-numero-f-selecionado').addClass('active');
			$('#label-complemento-f-selecionado').addClass('active');
			$('#label-bairro-f-selecionado').addClass('active');
			$('#label-cidade-f-selecionado').addClass('active');

			// Atribuindo valores para formulário
			$('#idEnderecoFornecedor-selecionado').val(
					endereco.idEnderecoFornecedor);
			$('#cep-f-selecionado').val(endereco.cep);
			$('#logradouro-f-selecionado').val(endereco.logradouro);
			$('#numero-f-selecionado').val(endereco.numero);
			$('#complemento-f-selecionado').val(endereco.complemento);
			$('#bairro-f-selecionado').val(endereco.bairro);
			$('#cidade-f-selecionado').val(endereco.cidade);
			$('#uf-f-selecionado').val(endereco.uf).attr('select', true);

			// Update em select
			$("select").material_select('update');
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

// Limpar formulário de endereço do fornecedor
function limparFormEndereco() {
	// Desativando labels de campos
	$('#label-cep-f-selecionado').removeClass('active');
	$('#label-logradouro-f-selecionado').removeClass('active');
	$('#label-numero-f-selecionado').removeClass('active');
	$('#label-complemento-f-selecionado').removeClass('active');
	$('#label-bairro-f-selecionado').removeClass('active');
	$('#label-cidade-f-selecionado').removeClass('active');

	// Limpando campos de formulário
	$('#form-endereco-fornecedor').find('input').val('');

	// Valor default de select
	$('#uf-f-selecionado').val('AC').attr('select', true);

	$("select").material_select('update');
}

// Excluir endereço de fornecedor selecionado
$("#btn-excluir-endereco").click(
		function() {
			// Atributo
			var idEnderecoFornecedor = $('#idEnderecoFornecedor-selecionado')
					.val();
			var idFornecedor = $('#idFornecedor-selecionado').val();

			// Confirmar exclusão
			$.confirm({
				title : 'Exclusão!',
				animation : 'top',
				useBootstrap : false,
				theme : 'material',
				boxWidth : '50%',
				content : 'Deseja excluir endereço?',
				buttons : {
					// CONFIRMAR
					confirm : {
						text : 'Excluir',
						btnClass : 'btn-red',
						action : function() {
							// Excluindo endereço
							$.ajax({
								url : "adm/enderecoFornecedor/"
										+ idEnderecoFornecedor,
								headers : {
									'Authorization' : localStorage
											.getItem("tokenBigDog")
								},
								type : "DELETE",
								contentType : "application/"
										+ "json; charset=utf-8",
								success : function(s) {
									// Mensagem para
									// toast
									mensagem = 'Endereço excluído!';

									// Fechando Modal
									$('#modal-endereco-fornecedor').modal(
											'close');

									// Refresh em modal
									// de fornecedor
									refreshModalFornecedor(idFornecedor);
								},
								error : function(e) {
									// Mensagem para
									// toast
									mensagem = 'Ops, houve um problema!';
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
		});