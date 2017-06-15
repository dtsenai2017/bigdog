// SCRIPT's para inicialização do collapse(sidenav para mobile) e modal.
// Initialize collapse button
$(".button-collapse").sideNav();

// Modal initialize
$('.modal').modal();

// Redirecionar página
function indexAdministrador() {
	// Requisição
	var xhr = new XMLHttpRequest();

	// Tipo, url e async
	xhr.open('GET', 'adm/indexAdministrador', false);

	// Atribuindo token
	xhr.setRequestHeader("Authorization", localStorage.getItem("tokenBigDog"));

	// Response
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			// Replace html
			$(document.body).html(xhr.response);
		}
	};

	// Request send()
	xhr.send();
}

// Logo do administrador
$("#logo-administrador").click(function() {
	// Ir para index
	indexAdministrador();
});

// Link de index do administrador
$("#btn-index-administrador").click(function() {
	// Ir para index
	indexAdministrador();
});

// Link de index do administrador (mobile)
$("#btn-mobile-index-administrador").click(function() {
	// Ir para index
	indexAdministrador();
});

// Links da navbar
$("#dropdown-gerenciar a").click(
		function() {
			// Atributo
			var tipo = $(this).attr('id').split('-');

			// Verifica tipo de link
			if (tipo[2] == 'cliente') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarCliente', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'loja') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarLoja', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'agenda') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarAgenda', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'servico') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarServico', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			}
		});

// Links da navbar
$("#menu-mobile a").click(
		function() {
			// Atributo
			var tipo = $(this).attr('id').split('-');

			// Verifica tipo de link
			if (tipo[2] == 'cliente') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarCliente', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'loja') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarLoja', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'agenda') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarAgenda', false);

				// Atribuindo token
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			} else if (tipo[2] == 'servico') {
				// Requisição
				var xhr = new XMLHttpRequest();

				// Tipo, url e async
				xhr.open('GET', 'adm/gerenciarServico', false);

				// Atribuindo tokenç
				xhr.setRequestHeader("Authorization", localStorage
						.getItem("tokenBigDog"));

				// Response
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						// Replace html
						$(document.body).html(xhr.response);
					}
				};

				// Request send()
				xhr.send();
			}
		});

// Deslogar
function logout() {
	// Limpando local storage e reload
	window.localStorage.removeItem('tokenBigDog');

	// Reload
	location.reload();
}