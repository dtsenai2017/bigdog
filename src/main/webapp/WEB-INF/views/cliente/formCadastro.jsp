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
<script src="resources/jquery/jquery-3.2.1.js"></script>
<script src="resources/loja/js/vanilla-masker.min.js"></script>
</head>
<main>
<body id="body">
	<header>
		<div class="img00">
			<a href="home"><img
				src="resources/loja/imagens/logos/logoOf02.png"></a>
		</div>
	</header>


	<form id="formm" method="post" class="form">
		<div class="cx02">
			<p>Dados Pessoais</p>
		</div>
		<div class="row roww">
			<div class="input-field col s6">
				<input type="hidden" id="id"> <input name="id_redes"
					type="hidden" id="id_redes"><input value="..." id="nome"
					type="text" class="" required="required" name="nome"
					readonly="readonly"> <label class="active" for="nome">Nome
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
			<p>Endereço</p>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="cep" name="cliente.enderecos[0].cep" required="required"
					type="text" class="cep"> <label class="active" for="cep">CEP</label>
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
					type="text" class=""> <label class="active" for="bairro">Bairro</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="cidade" name="enderecos.cidade" required="required"
					type="text" class=""> <label class="active" for="cidade">Cidade</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="uf" name="enderecos.uf" required="required" type="text"
					class=""> <label class="active" for="uf">UF</label>
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


		<div class="cx02">
			<p>Dados do Login</p>
		</div>
		<div class="row">
			<div class="input-field col s6">
				<input id="email" required="required" name="contato.email"
					type="email" class="" onblur="vEmail(this.value)"
					readonly="readonly" value="..."> <label class="active"
					for="email">Email</label><span id="spem"></span>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="senha" name="senha" required="required" type="password"
					class=""> <label class="active" for="senha">Senha</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s6">
				<input id="Csenha" name="Csenha" required="required" type="password"
					class=""> <label class="active" for="Csenha">Confirmar
					a Senha</label><span id="spse"></span>
			</div>
		</div>


		<button type="submit" class="buttonn buttonBlue" onclick="alterar()">
			Cadastrar
			<div class="ripples buttonRipples">
				<span class="ripplesCircle"></span>
			</div>
		</button>
		</a>
	</form>
</main>
<c:import url="component/footerLoja.jsp"></c:import>
<script type="text/javascript">
	$.getScript("resources/loja/js/cadastro.js", function() {
	});
</script>
<script type="text/javascript"
	src="resources/loja/js/materialize.min.js"></script>
<script type="text/javascript">
	function vEmail(email) {
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if (re.test(email) == true) {
			$("#spem").html('E-Mail é Válido!');
		} else {
			$("#spem").html('E-Mail é Inválido!');
			$("#email").val("");
		}
	}

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
</script>
<script type="text/javascript">
	function verificaCpf() {
		var cpf = $("#cpf").val();
		if ($("#cpf").val() == "") {
			$("#spcf").html("Cpf Inválido");
		} else {
			cpf = cpf.replace(/\./g, " ");
			$.ajax({
				type : "GET",
				url : "rest/verificaCpf/" + cpf,
			}).then(function(data) {
				if (data.cpf != null) {
					$("#spcf").html("Cpf já Cadastrado no sistema")
					$("#cpf").val("");
				} else {
					cpf = cpf.replace(/\ /g, "")
					cpf = cpf.replace("-", "")
					if (!validaCpf(cpf)) {
						$("#spcf").html("Cpf Inválido");
					} else {
						$("#spcf").html("")
					}
				}
			});
		}
	}

	function validaCpf(cpf) {
		if (cpf.length < 11)
			return false
		var nonNumbers = /\D/
		if (nonNumbers.test(cpf))
			return false
		if (cpf == "000000000-00" || cpf == "111111111-11"
				|| cpf == "222222222-22" || cpf == "333333333-33"
				|| cpf == "444444444-44" || cpf == "555555555-55"
				|| cpf == "666666666-66" || cpf == "777777777-77"
				|| cpf == "888888888-88" || cpf == "999999999-99")
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
	$(document).ready(
			function() {

				function limpa_formulário_cep() {
					// Limpa valores do formulário de cep.
					$("#logradouro").val("");
					$("#bairro").val("");
					$("#cidade").val("");
					$("#uf").val("");
				}

				// Quando o campo cep perde o foco.
				$("#cep").blur(
						function() {

							// Nova variável "cep" somente com dígitos.
							var cep = $(this).val().replace(/\D/g, '');

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
									$.getJSON("//viacep.com.br/ws/" + cep
											+ "/json/?callback=?", function(
											dados) {

										if (!("erro" in dados)) {
											// Atualiza os campos com os valores da
											// consulta.
											$("#logradouro").val(
													dados.logradouro);
											$("#bairro").val(dados.bairro);
											$("#cidade").val(dados.localidade);
											$("#uf").val(dados.uf);
										} // end if.
										else {
											// CEP pesquisado não foi encontrado.
											limpa_formulário_cep();
											alert("CEP não encontrado.");
										}
									});
								} // end if.
								else {
									// cep é inválido.
									limpa_formulário_cep();
									alert("Formato de CEP inválido.");
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