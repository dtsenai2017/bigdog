var host = window.location.host;
// Função de Formatar a Data "toDate()"
String.prototype.toDate = function(format, delimiter) {
	var date = this;
	var formatedDate = null;
	var formatLowerCase = format.toLowerCase();
	var formatItems = formatLowerCase.split(delimiter);
	var dateItems = date.split(delimiter);
	var monthIndex = formatItems.indexOf("mm");
	var monthNameIndex = formatItems.indexOf("mmm");
	var dayIndex = formatItems.indexOf("dd");
	var yearIndex = formatItems.indexOf("yyyy");
	var d = dateItems[dayIndex];
	if (d < 10) {
		d = "0" + d;
	}
	if (monthIndex > -1) {
		var month = parseInt(dateItems[monthIndex]);
		month -= 1;
		if (month < 10) {
			month = "0" + month;
		}
		formatedDate = new Date(dateItems[yearIndex], month, d);
	} else if (monthNameIndex > -1) {
		var monthName = dateItems[monthNameIndex];
		month = getMonthIndex(monthName);
		if (month < 10) {
			month = "0" + month;
		}
		formatedDate = new Date(dateItems[yearIndex], month, d);
	}
	return formatedDate;
};

function getMonthIndex(name) {
	name = name.toLowerCase();
	if (name == "jan" || name == "january") {
		return 0;
	} else if (name == "feb" || name == "february") {
		return 1;
	} else if (name == "mar" || name == "march") {
		return 2;
	} else if (name == "apr" || name == "april") {
		return 3;
	} else if (name == "may" || name == "may") {
		return 4;
	} else if (name == "jun" || name == "june") {
		return 5;
	} else if (name == "jul" || name == "july") {
		return 6;
	} else if (name == "aug" || name == "august") {
		return 7;
	} else if (name == "sep" || name == "september") {
		return 8;
	} else if (name == "oct" || name == "october") {
		return 9;
	} else if (name == "nov" || name == "november") {
		return 10;
	} else if (name == "dec" || name == "december") {
		return 11;
	}
}

// Inicializando a sdk do Facebook
window.fbAsyncInit = function() {
	FB.init({
		appId : '188623801639122',
		xfbml : true,
		version : 'v2.9'
	});
	FB.AppEvents.logPageView();
};

// Conectando a sdk do Facebook
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/pt_BR/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Realiza login e resgata os campos necessarios
function checkFacebook() {
	FB.login(function(response) {
		if (response.authResponse) {
			FB.api('/me', 'GET', {
				"fields" : "name,email,birthday,gender,id"
			}, function(response) {
				getFb(response);
			});
		} else {
		}
	});
}

// Verifica se o usuario ja existe no Sistema
function getFb(response) {
	$.ajax({
		type : "GET",
		url : "http://" + host + "/BigDog/rest/loginRedes/" + response.id,
		success : function(data) {
			redirecionaFb(data.idCliente, response);
		},
		error : function(e) {
			alert("Erro: " + e);
		}

	});
}

// Função para redirecionar o cliente
function redirecionaFb(param, response) {
	var link;
	var idL = response.id;
	localStorage.setItem("id_redes", idL);
	localStorage.setItem("id_cliente", param)
	var passaValor = function(url) {
		window.location = link;
	}
	if (param == null) {
		cadastrarFb(response);
		link = "faca-parte";
	} else {
		link = "indexCliente?id=" + localStorage.getItem("id_cliente");
	}

	passaValor(link);
}

// Realiza o cadastro basico no Sistema
function cadastrarFb(response) {
	var dataN = response.birthday
	var idL = response.id
	var genero = response.gender
	if (genero == 'male') {
		genero = 'Masculino'
	} else if (genero == 'female') {
		genero = "Feminino"
	}

	if (dataN == null) {
		localStorage.setItem("dataNascimento", "")
		localStorage.setItem("nome", response.name)
		localStorage.setItem("email", response.email)
		localStorage.setItem("genero", genero)
	} else {
		localStorage.setItem("nome", response.name)
		localStorage.setItem("email", response.email)
		localStorage.setItem("genero", genero)
		localStorage.setItem("dataNascimento", dataN)
	}
}