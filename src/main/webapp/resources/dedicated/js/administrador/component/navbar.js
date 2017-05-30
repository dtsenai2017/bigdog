// SCRIPT's para inicialização do collapse(sidenav para mobile) e modal.
// Initialize collapse button
$(".button-collapse").sideNav();

// Modal initialize
$('.modal').modal();

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
				xhr.open('GET', 'gerenciarCliente', false);

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
				xhr.open('GET', 'gerenciarLoja', false);

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
				xhr.open('GET', 'gerenciarAgenda', false);

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
				xhr.open('GET', 'gerenciarServico', false);

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
				xhr.open('GET', 'gerenciarCliente', false);

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
				xhr.open('GET', 'gerenciarLoja', false);

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
				xhr.open('GET', 'gerenciarAgenda', false);

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
				xhr.open('GET', 'gerenciarServico', false);

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

// Recarregando...
// var xhr = new XMLHttpRequest();
// xhr.open('GET', "gerenciarServico", false);
// xhr.setRequestHeader("Authorization", localStorage.getItem("tokenBigDog"));
// xhr.onreadystatechange = function() {
// if (xhr.readyState == 4) {
// $(document.body).html(xhr.response);
// }
// };
// xhr.send();
