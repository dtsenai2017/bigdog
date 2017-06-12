var host = window.location.host;
var a;
var li;
var vector = [];
var id;
function teste(parametro) {
	var par = ".a" + parametro;
	$(par).toggle();

	var id = "aSb" + parametro;

	if (a == undefined) {
		vector.push(id);

		listaCategoria(parametro);
	} else {
		var sla = a.id;
		if (vector.indexOf(id) == -1) {
			vector.push(id);
			listaCategoria(parametro);

		}
	}
};

function listaCategoria(parametro) {
	$.ajax({
		type : "GET",
		url : "http://" + host + "/BigDog/categoria/" + parametro,
		success : function(data) {
			for (i = 0; i < data.subCategorias.length; i++) {
				a = document.createElement("a");
				a.setAttribute("type", "hidden");
				li = document.createElement("li");
				a.id = 'aSb' + parametro;
				console.log(data.subCategorias[i].idSubCategoria);
				a.href = 'produtos?idCategoria=' + data.idCategoria
						+ "&idSubCategoria="
						+ data.subCategorias[i].idSubCategoria;
				console.log(a.href);
				li.innerHTML = data.subCategorias[i].nome;
				a.append(li)
				$(".a" + parametro).append(a);
			}
		},
		error : function(e) {
			alert("Erro: " + e);
		}
	});
}
