// Limpar formulário
function limpa_formulário_cep(tipo) {
	// Verifica tipo de formulário
	if (tipo == 'form-inserir') {
		// Desativa labels
		$("#label-logradouro-fornecedor").removeClass('active');
		$("#label-bairro-fornecedor").removeClass('active');
		$("#label-cidade-fornecedor").removeClass('active');

		// Limpa valores do formulário de cep.
		$("#logradouro").val("");
		$("#bairro").val("");
		$("#cidade").val("");
		$('#select-uf').val('AC').attr('select', true);

		// Update em select
		$("select").material_select('update');
	} else if (tipo == 'form-alterar') {
		// Desativa labels
		$("#label-logradouro-f-selecionado").removeClass('active');
		$("#label-bairro-f-selecionado").removeClass('active');
		$("#label-cidade-f-selecionado").removeClass('active');

		// Limpa valores do formulário de cep.
		$("#logradouro-f-selecionado").val("");
		$("#bairro-f-selecionado").val("");
		$("#cidade-f-selecionado").val("");
		$('#uf-f-selecionado').val('AC').attr('select', true);

		// Update em select
		$("select").material_select('update');
	}
}

// Buscar cep
function buscarCep() {
	// Tipo de input
	var input = $(event.target).attr('id');

	// Verifica tipo de input
	// FORM DE INSERÇÃO DE FORNECEDOR
	if (input == 'cep') {
		// Nova variável "cep" somente com dígitos.
		var cep = $(event.target).val().replace(/\D/g, '');

		// Verifica se campo cep possui valor informado.
		if (cep != "") {
			// Expressão regular para validar o CEP.
			var validacep = /^[0-9]{8}$/;

			// Valida o formato do CEP.
			if (validacep.test(cep)) {
				// Preenche os campos com "..." enquanto
				// consulta webservice.
				$("#logradouro").val("...");
				$("#bairro").val("...");
				$("#cidade").val("...");

				// Consulta o webservice viacep.com.br/
				$.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?",
						function(dados) {
							// Se não ocorrer erro
							if (!("erro" in dados)) {
								// Ativa labels de input
								$('#label-logradouro-fornecedor').addClass(
										'active');
								$('#label-bairro-fornecedor')
										.addClass('active');
								$('#label-cidade-fornecedor')
										.addClass('active');

								// Atualiza os campos com os valores da
								// consulta.
								$("#logradouro").val(dados.logradouro);
								$("#bairro").val(dados.bairro);
								$("#cidade").val(dados.localidade);
								$("#select-uf").val(dados.uf).attr("select",
										true);

								// Update em select
								$("select").material_select('update');

								// Focus em número do logradouro
								$('#numero').focus();
							} // end if.
							else {
								// CEP pesquisado não foi encontrado.
								limpa_formulário_cep('form-inserir');
								Materialize.toast("CEP não encontrado.", 2000);
							}
						});
			} // end if.
			else {
				// cep é inválido.
				limpa_formulário_cep('form-inserir');
				Materialize.toast("Formato de CEP inválido.", 2000);
			}
		} // end if.
		else {
			// cep sem valor, limpa formulário.
			limpa_formulário_cep('form-inserir');
		}

		// FORM DE ALTERAÇÃO DE FORNECEDOR
	} else if (input == 'cep-f-selecionado') {
		// Nova variável "cep" somente com dígitos.
		var cep = $(event.target).val().replace(/\D/g, '');

		// Verifica se campo cep possui valor informado.
		if (cep != "") {
			// Expressão regular para validar o CEP.
			var validacep = /^[0-9]{8}$/;

			// Valida o formato do CEP.
			if (validacep.test(cep)) {
				// Preenche os campos com "..." enquanto
				// consulta webservice.
				$("#logradouro-f-selecionado").val("...");
				$("#bairro-f-selecionado").val("...");
				$("#cidade-f-selecionado").val("...");

				// Consulta o webservice viacep.com.br/
				$.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?",
						function(dados) {
							// Se não ocorrer erro
							if (!("erro" in dados)) {
								// Ativa labels de input
								$('#label-logradouro-f-selecionado').addClass(
										'active');
								$('#label-bairro-f-selecionado').addClass(
										'active');
								$('#label-cidade-f-selecionado').addClass(
										'active');

								// Atualiza os campos com os valores da
								// consulta.
								$("#logradouro-f-selecionado").val(
										dados.logradouro);
								$("#bairro-f-selecionado").val(dados.bairro);
								$("#cidade-f-selecionado")
										.val(dados.localidade);
								$("#uf-f-selecionado").val(dados.uf).attr(
										"select", true);

								// Update em select
								$("select").material_select('update');

								// Focus em número do logradouro
								$('#numero-f-selecionado').focus();
							} // end if.
							else {
								// CEP pesquisado não foi encontrado.
								limpa_formulário_cep('form-alterar');
								Materialize.toast("CEP não encontrado.", 2000);
							}
						});
			} // end if.
			else {
				// cep é inválido.
				limpa_formulário_cep('form-alterar');
				Materialize.toast("Formato de CEP inválido.", 2000);
			}
		} // end if.
		else {
			// cep sem valor, limpa formulário.
			limpa_formulário_cep('form-alterar');
		}
	}
}
