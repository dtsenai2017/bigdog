// Login
$("#form-login-adm").submit(
		function(e) {
			// Cancela qualquer ação padrão do elemento
			e.preventDefault();

			// Dados de login
			var administrador = {
				email : $('#adm-email').val(),
				senha : $('#adm-senha').val()
			}

			// Requisição
			$.ajax({
				url : "loginAdm",
				type : "POST",
				data : JSON.stringify(administrador),
				async : false,
				contentType : "application/json; charset=utf-8",
				success : function(response) {
					// Set token
					localStorage.setItem("tokenBigDog", response.token);

					// Requisição
					var xhr = new XMLHttpRequest();

					// Tipo, url e async
					xhr.open('GET', 'adm/indexAdministrador', true);

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
				},
				error : function(e) {
					// Atributo para mensagem de resposta
					var mensagem;

					// Verifica status de resposta
					if (e.status == 401) {
						mensagem = "Login inválido!";
					} else {
						mensagem = "Ops, houve um problema!";
					}

					// Exibindo mensagem
					Materialize.toast(mensagem, 2555);
				}
			});
		});