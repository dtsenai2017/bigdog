var googleUser = {};
var profile;
$(document).ready(function() {
	 gapi.load('auth2', function() {
	        auth2 = gapi.auth2.init({
	            client_id: '125644047445-9j60sbkl1kssriskoolv4o946m18r8in.apps.googleusercontent.com',
	            scope: 'profile'
	        });
	        var elemento = document.getElementById("btnGoogle");
	        loginGoogle(elemento)
	    });
});

function loginGoogle(element) {
    auth2.attachClickHandler(element, {}, function() {
    	profile = auth2.currentUser.get().getBasicProfile();
    	sendGo();
    });
}

function sendGo() {
	var idL = profile.getId();
	getGoogle(idL);
}

function redireciona(param, param2, param3) {
	var link;
	var id;
	var idR = profile.getId();
	localStorage.setItem("id_redes", idR);
	localStorage.setItem("id_cliente", param3);
	var passaValor = function(url) {
		window.location = link;
	}
	if (param == null && param2 == null) {
		cadastrarGo(profile);
		link = "faca-parte";
	} else if (param == null) {
		link = "faca-parte";
	} else {
		link = "indexCliente?id=" + localStorage.getItem("id_cliente");
	}
	signOut();
	passaValor(link);
}

function getGoogle(id) {
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/BigDog/rest/loginRedes/" + id,
		success : function(data) {
			redireciona(data.cpf, data.email, data.idCliente);
		},
		error : function(e) {
			alert("Erro: " + e);
		}

	});
}

function cadastrarGo(profile) {
	localStorage.setItem("id_redes", profile.getId());
	var clienteAjax = {
		nome : profile.getName(),
		email : profile.getEmail(),
		id_redes : profile.getId()
	}

	$.ajax({
		type : 'POST',
		url : 'http://localhost:8080/BigDog/rest/loginRedes',
		data : JSON.stringify(clienteAjax),
		contentType : "application/json;charset=UTF-8",
		dataType : 'json',
		success : function(data) {
		}
	});
}
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
	});
}