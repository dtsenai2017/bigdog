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
				url : "adm/loginAdm",
				type : "POST",
				data : JSON.stringify(administrador),
				async : false,
				contentType : "application/json; charset=utf-8",
				success : function(response) {
					localStorage.setItem("tokenBigDog", response.token);
					var xhr = new XMLHttpRequest();
					xhr.open('GET', "indexAdministrador", false);
					xhr.setRequestHeader("Authorization", localStorage
							.getItem("tokenBigDog"));
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4) {
							$(document.body).html(xhr.response);
						}
					};
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