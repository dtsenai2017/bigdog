var host = window.location.host;
var googleUser = {};
var profile;
$(document).ready(function() {
	 gapi.load('auth2', function() {
	        auth2 = gapi.auth2.init({
	            client_id: '461691358173-2ns4scm8m1k8hc1sm19vbqbeu85s5u2q.apps.googleusercontent.com',
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

function redireciona(param) {
	var link;
	var id;
	var idR = profile.getId();
	localStorage.setItem("id_redes", idR);
	localStorage.setItem("id_cliente", param);
	var passaValor = function(url) {
		window.location = link;
	}
	if (param == null) {
		cadastrarGo(profile);
		link = "faca-parte";
	} else {
		link = "indexCliente?id=" + localStorage.getItem("id_cliente");
		localStorage.setItem("nome", null)
		localStorage.setItem("email", null)
	}
	passaValor(link);
}

function getGoogle(id) {
	$.ajax({
		type : "GET",
		url : "http://"+ host +"/BigDog/rest/loginRedes/" + id,
		success : function(data) {
			redireciona(data.idCliente);
		},
		error : function(e) {
			alert("Erro: " + e);
		}

	});
}

function cadastrarGo(profile) {
	localStorage.setItem("id_redes", profile.getId());
	localStorage.setItem("nome", profile.getName());
	localStorage.setItem("email", profile.getEmail());
	localStorage.setItem("dataNascimento", "")
}