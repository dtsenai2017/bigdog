<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Administrador | Gerenciar Loja</title>
</head>
<body>
	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- main - container principal -->
	<div class="container">

		<!-- Descrição -->
		<div class="row">
			<!-- Section -->
			<div class="section">
				<!-- Título -->
				<h5 class="left-align">Gerenciar Loja</h5>

				<!-- Subtítulo -->
				<p class="left-align grey-text text lighten-1">Gerencie seus
					produtos sem complicações.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Conteúdo main -->
		<div class="row">
			<!-- Opções -->
			<div class="col s12 m3 l3">
				<!-- Descrição -->
				<h5 align="center">Opções</h5>

				<!-- Divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Cadastrar produto -->
				<a id="btn-novo-produto"
					class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
					class="material-icons right green-text text-green"
					onclick="janelaNovoProduto();">add</i>Novo</a>

				<!-- Espaçador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Consultar produtos -->
				<a id="btn-consultar-produtos"
					class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
					class="material-icons right blue-text text-darken-1"
					onclick="janelaConsultarProdutos();">search</i>Consultar</a>

				<!-- Espaçador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Espaçador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Descrição para cadastro -->
				<div id="descricao-consulta" class="col s12 m12 l12">
					<!-- Título de descrição -->
					<h6 align="center">Descrição</h6>

					<!-- Divider -->
					<div class="divider"></div>

					<!-- Descrição -->
					<span class="grey-text text-grey">Pesquise por categoria ou
						nome. </span>
				</div>
			</div>

			<!-- Novo produto -->
			<div id="janela-novo-produto" class="col s12 m9 l9">
				<!-- Título de janela -->
				<h5 align="center">Cadastrar um novo produto</h5>

				<!-- Divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Formulário de cadastro -->
				<div class="container">
					<div class="row">
						<!-- Formulário -->
						<form action="inserirProduto" class="col s12 m12 l12"
							method="post">
							<!-- Nome do produto -->
							<div class="row">
								<div class="input-field col s12">
									<input placeholder="Digite o nome do produto" id="nome"
										name="nome" type="text" class="validate" maxlength="100"
										required> <label for="nome">Nome do produto</label>
								</div>
							</div>

							<!-- Marca -->
							<div class="row">
								<div class="col s12 m12 l12">
									<div class="input-field">
										<input placeholder="Digite a marca do produto" id="marca"
											name="marca" type="text" class="validate truncate"
											maxlength="100" required> <label for="marca">Marca</label>
									</div>
								</div>
							</div>

							<!-- Categoria, Subcategoria e adicionar categoria -->
							<div class="row">
								<div class="input-field col s12 m5 l5">
									<select id="select-categoria" name="categoria" required>
									</select> <label>Categoria</label>
								</div>

								<div class="input-field col s12 m5 l5">
									<select id="select-subcategoria" name="subcategoria">
									</select> <label>* Subcategoria:</label>
								</div>

								<div class="col s12 m2 l2 center">
									<a href="#modal-add-categoria" onclick="abrirCategorias();"
										class="waves-effect"><i class="material-icons left-align">add</i>Adicionar</a>
								</div>
							</div>

							<!-- Foto do produto e Cor -->
							<div class="row">
								<div class="col s6 m9 l9">
									<div class="file-field input-field">
										<div class="btn cyan">
											<span>Foto</span> <input type="file">
										</div>
										<div class="file-path-wrapper">
											<input class="file-path validate truncate" type="text"
												placeholder="Escolha uma foto" required>
										</div>
									</div>
								</div>

								<div class="col s6 m3 l3">
									<div class="input-field">
										<input placeholder="Digite a cor" id="cor" name="cor"
											type="text" class="truncate" maxlength="100"> <label
											for="cor">* Cor</label>
									</div>
								</div>
							</div>

							<!-- Tamanho e Quantidade -->
							<div class="row">
								<div class="input-field  col s3 l3 m3">
									<input placeholder="Tamanho" id="tamanho" name="tamanho"
										type="text" class="truncate" maxlength="100"> <label
										for="tamanho">* Tamanho</label>
								</div>

								<div class="input-field  col s9 l9 m9">
									<input placeholder="Digite a quantide do produto"
										id="quantidade" name="quantidade" type="text"
										class="validate truncate" maxlength="100" required> <label
										for="quantidade">Quantidade do produto</label>
								</div>
							</div>

							<!-- Valor, Quantidade de estoque e Data de Vigência-->
							<div class="row">
								<div class="input-field  col s4 l4 m4">
									<input placeholder="Digite o valor" id="valor" name="valor"
										type="text" class="truncate" pattern="[0-9]+(\.[0-9]{0,2})?%?"
										step="0.01"> <label for="valor">Valor do
										produto (R$)</label>
								</div>

								<div class="input-field  col s3 l3 m3 ">
									<input placeholder="Quantidade" id="qtdEstoque"
										name="qtdEstoque" pattern="[0-9.]+" type="number"> <label
										for="qtdEstoque">Qtd. de estoque</label>
								</div>

								<div class="col s5 m5 l5">
									<label for="dataVigencia">Data de vigência</label> <input
										type="date" class="datepicker" id="dataVigencia"
										name="dataVigencia">
								</div>
							</div>

							<!-- Descrição -->
							<div class="row">
								<div class="input-field col s12">
									<textarea id="descricao" class="materialize-textarea"
										data-length="255" maxlength="255"></textarea>
									<label for="textarea1">Descrição do produto</label>
								</div>
							</div>

							<!-- Botão Cadastrar -->
							<div class="row">
								<div class="col s12 m12 l12">
									<button class="btn waves-effect waves-light right red"
										type="submit" name="action">
										Cadastrar <i class="material-icons right">add</i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /janela-novo-produto -->

			<!-- Modal para adicionar categoria e subcategorias -->
			<div id="modal-add-categoria" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<!-- Título de modal -->
					<h4 class="center-align">Adicionar categoria e subcategoria</h4>

					<!-- Subtítulo -->
					<h6 class="center-align">Adicione ou altere a categoria
						desejada.</h6>

					<!-- Divider -->
					<div class="divider"></div>

					<!-- Conteúdo principal do modal -->
					<!-- Lista de categorias -->
					<div class="row">
						<div class="col s12 m5 l5">
							<ul class="collection with-header hoverable">
								<li class="collection-header"><h4>Categoria:</h4></li>
								<li class="collection-item"><div>
										Alvin<a href="#!" class="secondary-content"><i
											class="material-icons">send</i></a>
									</div></li>
							</ul>
						</div>

						<!-- Formulário para alteração -->
						<div class="col s12 m7 l7 green"></div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a class="modal-action modal-close waves-effect btn-flat">Voltar</a>
				</div>
			</div>

			<!-- Consultar produtos -->
			<div id="janela-consultar-produtos" class="col s12 m9 l9">
				<!-- Título de janela -->
				<h5 align="center">Consultar</h5>

				<!-- Divider -->
				<div class="divider"></div>

				<!-- Lista -->
				<div class="row"></div>
			</div>
		</div>
	</div>

	<!-- Script's dedicado -->
	<!-- JS dedicado -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-loja.js"
		charset="utf-8" defer></script>

	<!-- Mascaras -->
	<script type="text/javascript"
		src="resources/dedicated/js/util/mascara.js" charset="utf-8" defer></script>
</body>
</html>