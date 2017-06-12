var host = window.location.host;
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
		getUser();
	}
});

function getUser() {
	if (localStorage.getItem("dataNascimento") == "") {
		$('#dataN').val('')
	} else {
		$('#dataN').val(localStorage.getItem("dataNascimento"))
		if ($('#dataF').val() == "") {
			validaData();
		}
		if (localStorage.getItem("genero") == 'Masculino') {
			document.getElementById("test1").checked = true;
		} else {
			document.getElementById("test2").checked = true;
		}
	}
	$('#nome').val(localStorage.getItem("nome"));
	$('#email').val(localStorage.getItem("email"));
}

function ativaCampo() {
	document.getElementById("nome").disabled = !document.getElementById("nome").disabled;
	document.getElementById("email").disabled = !document
			.getElementById("email").disabled;
	$('#nome').val('');
	$('#email').val('');
	$('#dataN').val('');
}

function limparCampos() {
	$("#nome").val("");
	$("#dataN").val("");
	$("#cpf").val("");
	$("#telefone").val("");
	$("#celular").val("");
	$("#cep").val("");
	$("#logradouro").val("");
	$("#bairro").val("");
	$("#cidade").val("");
	$("#uf").val("");
	$("#complemento").val("");
	$("#numero").val("");
	$("#email").val("");
	$("#senha").val("");
	$("#Csenha").val("");
}
function cadastrar() {

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

	$.ajax({
		type : 'POST',
		url : 'http://' + host + '/BigDog/rest/login',
		data : JSON.stringify(dados),
		contentType : 'application/json;charset=UTF-8',
		dataType : 'json',
		sucsess : function(data) {
		}
	});
	localStorage.setItem("sucesso", "Cadastro Realizado com Sucesso!")
	window.location.replace("entrar");
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
	$("#dataF").val(dataF);
}

function gender() {
	if (document.getElementById("test2").checked == true) {
		genero = 'Feminino';
	} else {
		genero = 'Masculino';
	}
}