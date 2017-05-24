//função pra ler querystring
var variavel;
var genero = 'Masculino';
$(function() {
	VMasker(document.querySelector("#dataN")).maskPattern("99/99/9999");
	VMasker(document.querySelector("#cpf")).maskPattern("999.999.999-99");
	VMasker(document.querySelector("#celular")).maskPattern("(99) 9 9999-9999");
	VMasker(document.querySelector("#telefone")).maskPattern("(99) 9999-9999");
	VMasker(document.querySelector("#cep")).maskPattern("99999-999");
	variavel = localStorage.getItem("id_redes");
	document.getElementById("id_redes").value = variavel;
	v = document.getElementById("id_redes").value;
	if (v == 0) {
		ativaCampo();
	} else {
		getUser(v);
	}
});

function getUser(variavel) {
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/BigDog/rest/loginRedes/" + variavel,
		success : function(data) {
			var date = data.dataNascimento;
			if (data.dataNascimento == null) {
				localStorage.setItem("id_cliente", data.idCliente);
				$('#nome').val(data.nome), $('#email').val(data.email),
						$('#id').val(data.idCliente), $('#dataN').val(''), $(
								'#dataN').focus()
			} else {
				localStorage.setItem("id_cliente", data.idCliente);
				$('#nome').val(data.nome), $('#email').val(data.email),
						$('#id').val(data.idCliente)
				if (data.genero == 'Masculino') {
					$('#test1').prop('checked', true)
				} else {
					$('#test2').prop('checked', true)
				}
				converteData(date);
			}

		},
		error : function(e) {
			alert("Erro: " + e);
		}

	});
}

function ativaCampo() {
	document.getElementById("nome").readOnly = !document.getElementById("nome").readOnly;
	document.getElementById("email").readOnly = !document
			.getElementById("email").readOnly;
	$('#nome').val('');
	$('#email').val('');
	$('#dataN').val('');
}

function alterar() {
	function confirmaSenha() {
		if ($("#senha").val() == $("#Csenha").val()) {
			$("#spse").html('')
		} else {
			$("#spse").html('Senhas Incopatíveis')
			$("#senha").val("")
			$("#Csenha").val("")
		}
	}
	var campos = [ nome = $("#nome").val(), dataN = $("#dataN").val(),
			cpf = $("#cpf").val(), telefone = $("#telefone").val(),
			celular = $("#celular").val(), cep = $("#cep").val(),
			logradouro = $("#logradouro").val(), bairro = $("#bairro").val(),
			cidade = $("#cidade").val(), uf = $("#uf").val(),
			complemento = $("#complemento").val(), numero = $("#numero").val(),
			email = $("#email").val(), senha = $("#senha").val(),
			Csenha = $("#Csenha").val() ];

	if (campos.indexOf("") != -1) {
		for (var int = 0; int < campos.length; int++) {
			if (campos[int] == "") {
				console.log(campos[int])
				$("#nome").focus();
				break;
			}
		}
	} else {
		if (variavel == 0) {
			var dados = {
				nome : $("#nome").val(),
				email : $("#email").val(),
				dataNascimento : $("#dataF").val(),
				genero : genero,
				cpf : $("#cpf").val(),
				senha : $("#Csenha").val(),
				contato : {
					telefone : $("#telefone").val(),
					celular : $("#celular").val(),
				},
				enderecos : [ {
					cep : $("#cep").val(),
					logradouro : $("#logradouro").val(),
					bairro : $("#bairro").val(),
					cidade : $("#cidade").val(),
					uf : $("#uf").val(),
					complemento : $("#complemento").val(),
					numero : $("#numero").val()
				} ]
			}

			$.ajax({
				type : 'POST',
				url : 'http://localhost:8080/BigDog/rest/login',
				data : JSON.stringify(dados),
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				sucsess : function(data) {
					localStorage.setItem("id_cliente", data.idCliente);
					var link = "indexCliente?id=" + localStorage.getItem("id_cliente");
					window.location = link;
				}
			});
		} else {
			var dados = {
				nome : $("#nome").val(),
				email : $("#email").val(),
				dataNascimento : $("#dataF").val(),
				genero : genero,
				id_redes : $("#id_redes").val(),
				cpf : $("#cpf").val(),
				senha : $("#Csenha").val(),
				contato : {
					telefone : $("#telefone").val(),
					celular : $("#celular").val(),
				},
				enderecos : [ {
					cep : $("#cep").val(),
					logradouro : $("#logradouro").val(),
					bairro : $("#bairro").val(),
					cidade : $("#cidade").val(),
					uf : $("#uf").val(),
					complemento : $("#complemento").val(),
					numero : $("#numero").val()
				} ]
			}

			var id = $('#id').val();

			$.ajax({
				type : 'PUT',
				url : 'http://localhost:8080/BigDog/rest/loginRedes/' + id,
				data : JSON.stringify(dados),
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				sucsess : function(data) {
					signOut();
					var link = "indexCliente?id=" + localStorage.getItem("id_cliente");
					window.location = link;
				}
			});
		}
	}
}
function converteData(date) {
	var split = date.split('-');
	var novaData = split[2] + "-" + split[1] + "-" + split[0];
	var dataFinal = new Date(novaData);
	var yyyy = dataFinal.getFullYear();
	var MM = dataFinal.getMonth() + 1;
	var dd = dataFinal.getDate();
	if (dd < 10) {
		dd = '0' + dd
	}
	if (MM < 10) {
		MM = '0' + MM
	}
	var dataF = dd + '/' + MM + '/' + yyyy;
	console.log(dataF)
	$("#dataN").val(dataF);
	validaData();
}

function validaData() {
	var data = $("#dataN").val();
	var split = data.split('/');
	var novaData = split[1] + "/" + split[0] + "/" + split[2];
	var dataFinal = new Date(novaData);
	var yyyy = dataFinal.getFullYear();
	var MM = dataFinal.getMonth() + 1;
	var dd = dataFinal.getDate();
	verificaData(yyyy);
	if (dd < 10) {
		dd = '0' + dd
	}
	if (MM < 10) {
		MM = '0' + MM
	}
	var dataF = yyyy + '-' + MM + '-' + dd;
	console.log(dataF)
	$("#dataF").val(dataF);
}

function gender() {
	if (document.getElementById("test2").checked == true) {
		genero = 'Feminino';
		console.log(genero)
	} else {
		genero = 'Masculino';
		console.log(genero)
	}

	function redirect(data) {
		console.log(data.idCliente)
		localStorage.setItem("id_cliente", data.idCliente)
		window.location = "indexCliente";
	}
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
    });
}