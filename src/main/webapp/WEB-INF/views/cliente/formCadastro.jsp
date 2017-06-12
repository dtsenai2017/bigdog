<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/loja/imagens/logos/favicon.png">

<head>
<title>Big Dog - Bem Vindo</title>
<link rel="stylesheet" type="text/css"
	href="resources/loja/css/login.css">
<link type="text/css" rel="stylesheet"
	href="resources/loja/css/materializeModificado.min.css"
	media="screen,projection" />
<script src="resources/loja/js/jquery-3.2.1.min.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		VMasker(document.querySelector(".cep")).maskPattern("99999-999");
	});
</script>
</head>
<main>
<body id="body"
	style="background-image: url('resources/loja/imagens/backlogin.png')">
	<header>
		<div class="img00">
			<a href="home"><img
				src="resources/loja/imagens/logos/logoOf02.png"></a>
		</div>
	</header>


	<form id="formm" action="javascript:cadastrar();" method="post"
		class="form">
		<div class="cx02">
			<p>Dados Pessoais</p>
		</div>
		<div class="row roww">
			<div class="input-field col s6">
				<input type="hidden" id="id"> <input name="id_redes"
					type="hidden" id="id_redes"><input value="..." id="nome"
					type="text" class="" required="required" name="nome"
					disabled="disabled"> <label class="active" for="nome">Nome
					Completo</label>
			</div>
		</div>


		<div class="row" id="roow" style="">
			<label class="gen">Sexo</label>
			<p>
				<input name="genero" type="radio" id="test1" value="Masculino"
					checked="checked" onclick="gender()" /> <label for="test1">Masculino</label>
			</p>
			<p>
				<input name="genero" type="radio" id="test2" value="Feminino"
					onclick="gender()" /> <label for="test2">Feminino</label>
			</p>
			<p>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="dataN" type="text" class="dataN" name="data"
					required="required" minlength="10" onblur="validaData()"
					value="11112001"><input type="hidden" id="dataF"
					name="dataNascimento"><label class="active" for="dataN">Data
					de Nascimento</label><span id="spdt"></span>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="cpf" name="cpf" type="text" class="cpf"
					required="required" onblur="verificaCpf()"> <label
					class="active" for="cpf">CPF</label> <span id="spcf"></span>
			</div>
		</div>


		<div class="row">
			<div class="input-field col s6">
				<input id="telefone" name="contato.telefone" type="text"
					required="required" class="telefone"> <label class="active"
					for="telefone">Telefone</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="celular" type="text" name="contato.celular"
					class="celular" required="required"> <label class="active"
					for="celular">Celular</label>
			</div>
		</div>

		<div class="cx02">
			<p>Dados do Login</p>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="email" required="required" name="contato.email"
					type="email" class="" onblur="vEmail(this.value)" disabled
					value="..."> <label class="active" for="email">Email</label><span
					id="spem"></span>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="senha" name="senha" required="required" type="password"
					class="" minlength="6"> <label class="active" for="senha">Senha</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="Csenha" name="Csenha" required="required" type="password"
					class="" minlength="6" onblur="vSenha(this.value)"> <label
					class="active" for="Csenha">Confirmar a Senha</label><span
					id="spse"></span>
			</div>
		</div>
		<div class="cx02">
			<p>Endereço</p>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="cep" name="cliente.enderecos[0].cep" required="required"
					type="text" class="cep"> <label class="active" for="cep">CEP</label>
				<span id="spcep"></span>

			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="logradouro" name="cliente.enderecos[0].logradouro"
					required="required" type="text" class=""
					onformchange="inputActive()"> <label class="active"
					for="logradouro">Logradouro</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="bairro" name="enderecos.bairro" required="required"
					type="text" value=' ' class=""> <label class="active"
					for="bairro">Bairro</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="cidade" name="enderecos.cidade" required="required"
					type="text" value=' ' class=""> <label class="active"
					for="cidade">Cidade</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="uf" name="enderecos.uf" required="required" type="text"
					class="" value=' ' maxlength="2"> <label class="active"
					for="uf">UF</label>
			</div>
		</div>


		<div class="row">
			<div class="input-field col s6">
				<input id="complemento" name="enderecos.complemento" type="text"
					class=""> <label class="active" for="complemento">Complemento</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="numero" name="enderecos.numero" required="required"
					type="text" class="" maxlength="7"> <label class="active"
					for="numero">Numero</label>
			</div>
		</div>


		<button type="submit" class="buttonn buttonBlue">
			Cadastrar
			<div class="ripples buttonRipples">
				<span class="ripplesCircle"></span>
			</div>
		</button>
		</a>
	</form>
</main>
<c:import url="component/footerLoja.jsp"></c:import>
<script type="text/javascript" src="resources/loja/js/cadastro.js"></script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript">
	// Atributos
	var host = window.location.host;

	// Verificar email
	function vEmail(email) {
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if (re.test(email) == true) {
			$("#spem").html('');
			getEmail(email);
		} else {
			$("#spem").html('E-Mail é Inválido!');
			$("#email").val("");
		}
	}

	// Get email
	function getEmail(email) {
		email = email.replace(/\./g, ' ');
		$.ajax({
			type : "GET",
			url : "http://" + host + "/BigDog/rest/verificaEmail/" + email,
			success : function(data) {
				if (data.email != null) {
					$("#spem").html('E-Mail já Cadastrado');
					$("#email").val('');
				} else {
					$("#spem").html('');
				}
			},
			error : function(e) {
				alert("Erro: " + e);
			}

		});
	}

	// Verificar senha
	function vSenha(confirma) {
		var senha = $("#senha").val();
		if (confirma != senha) {
			$("#spse").html("Senhas Diferentes, tente novamente.");
			$("#senha").val("");
			$("#Csenha").val("");
		} else {
			$("#spse").html("");

		}
	}

	// Verificar data
	function verificaData(year) {
		data = new Date();
		var dataDigitada = $("#dataN").val()
		var ano = data.getFullYear();
		if (year < ano) {
			if (ano - year < 16) {
				$("#spdt").html('Cadastro Apenas para Maiores de 16')
				$("#dataN").val("")
			} else {
				$("#spdt").html('')
			}
		} else {
			$("#spdt").html('Data Inválida')
			$("#dataN").val("")
		}
	}

	// Verificar CPF
	function verificaCpf() {
		var cpf = $("#cpf").val();
		if (validaCpf(cpf) == false) {
			$("#spcf").html("CPF Inválido");
			$("#cpf").val("");
		} else {
			cpf = cpf.replace(/\./g, " ");
			$("#spcf").html("");
			$.ajax({
				type : "GET",
				url : "http://" + host + "/BigDog/rest/verificaCpf/" + cpf,
			}).then(function(data) {
				if (data.cpf != null) {
					$("#spcf").html("CPF já Cadastrado no sistema")
					$("#cpf").val("");
				} else {
					cpf = cpf.replace(/\ /g, "")
					cpf = cpf.replace("-", "")
					if (!validaCpf(cpf)) {
						$("#spcf").html("CPF Inválido");
					} else {
						$("#spcf").html("")
					}
				}
			});
		}
	}

	// Validar CPF
	function validaCpf(cpf) {
		cpf = cpf.replace(/\./g, "")
		cpf = cpf.replace("-", "")
		if (cpf.length < 11)
			return false
		var nonNumbers = /\D/
		if (nonNumbers.test(cpf))
			return false
		if (cpf == "00000000000" || cpf == "11111111111"
				|| cpf == "22222222222" || cpf == "33333333333"
				|| cpf == "44444444444" || cpf == "55555555555"
				|| cpf == "66666666666" || cpf == "77777777777"
				|| cpf == "88888888888" || cpf == "99999999999")
			return false

		var a = []
		var b = new Number
		var c = 11
		for (i = 0; i < 11; i++) {
			a[i] = cpf.charAt(i)
			if (i < 9)
				b += (a[i] * --c)
		}
		if ((x = b % 11) < 2) {
			a[9] = 0
		} else {
			a[9] = 11 - x
		}
		b = 0
		c = 11
		for (y = 0; y < 10; y++)
			b += (a[y] * c--)
		if ((x = b % 11) < 2) {
			a[10] = 0
		} else {
			a[10] = 11 - x
		}
		if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10]))
			return false
		return true
	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// Function limpar formulário
						function limpa_formulário_cep() {
							// Limpa valores do formulário de cep.
							$("#logradouro").val("");
							$("#bairro").val("");
							$("#cidade").val("");
							$("#uf").val("");
						}

						// Quando o campo cep perde o foco.
						$("#cep")
								.blur(
										function() {
											// Nova variável "cep" somente com dígitos.
											var cep = $(this).val().replace(
													/\D/g, '');

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
													$("#uf").val("...");

													// Consulta o webservice viacep.com.br/
													$
															.getJSON(
																	"//viacep.com.br/ws/"
																			+ cep
																			+ "/json/?callback=?",
																	function(
																			dados) {

																		if (!("erro" in dados)) {
																			// Atualiza os campos com os valores da
																			// consulta.
																			$(
																					"#logradouro")
																					.val(
																							dados.logradouro);
																			$(
																					"#bairro")
																					.val(
																							dados.bairro);
																			$(
																					"#cidade")
																					.val(
																							dados.localidade);
																			$(
																					"#uf")
																					.val(
																							dados.uf);
																			$(
																					"#spcep")
																					.text(
																							"");
																			$(
																					"#complemento")
																					.focus();
																			$(
																					'#logradouro')
																					.attr(
																							"disabled",
																							true);
																			$(
																					'#bairro')
																					.attr(
																							"disabled",
																							true);
																			$(
																					'#cidade')
																					.attr(
																							'disabled',
																							true);
																			$(
																					'#uf')
																					.attr(
																							'disabled',
																							true);

																		} // end if.
																		else {
																			// CEP pesquisado não foi encontrado.
																			limpa_formulário_cep();
																			$(
																					"#spcep")
																					.text(
																							"CEP Não Encontrado");

																		}
																	});
												} // end if.
												else {
													// cep é inválido.
													limpa_formulário_cep();
													$("#spcep")
															.text(
																	"Formato de CEP inválido.");
												}
											} // end if.
											else {
												// cep sem valor, limpa formulário.
												limpa_formulário_cep();
											}
										});
					});
</script>
</body>
</html>