<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Título -->
<title>Administrador | Gerenciar Loja</title>

<!-- CSS dedicado -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-loja.css">
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
				<p class="left-align grey-text text lighten-1">Gerencie sua loja
					com simplicidade e facilidade.</p>

				<!-- divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Conteúdo main -->
		<div class="row">
			<!-- Opções -->
			<div class="col s12 m3 l3">
				<!-- Descrição -->
				<h5 align="center">Opções</h5>

				<!-- divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Botão produto -->
				<a id="btn-produto"
					class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
					class="material-icons left red-text text-lighten-2"
					onclick="janelaProduto();">store</i>Produto</a>

				<!-- Espaçador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Botão fornecedor -->
				<a id="btn-fornecedor"
					class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
					class="material-icons left brown-text text-lighten-2"
					onclick="janelaFornecedor();">local_shipping</i>Fornecedor</a>
			</div>

			<!-- Janela produto -->
			<div id="main-produto" class="col s12 m9 l9">
				<!-- Título de janela -->
				<h5 align="center">Produtos</h5>

				<!-- divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Tabs de produto -->
				<ul class="tabs">
					<li class="tab col s6"><a href="#principal-produto"
						onclick="Materialize.fadeInImage('#principal-produto')"><i
							class="material-icons red-text text-lighten-2">store</i>Principal</a></li>
					<li class="tab col s6"><a href="#novo-produto"
						onclick="abrirFormProduto(); Materialize.fadeInImage('#novo-produto')"><i
							class="material-icons green-text text-lighten-2">add</i>Novo
							Produto</a></li>
				</ul>

				<!-- Janela principal de produto -->
				<div id="principal-produto" class="col s12 blue">Test 1</div>

				<!-- Janela de cadastro de produto -->
				<div id="novo-produto" class="col s12">
					<!-- br -->
					<br>

					<!-- Janela de cadastro de produto -->
					<div id="janela-novo-produto" class="col s12 m12 l12">
						<!-- Título de janela -->
						<h5 align="center" class="grey-text text-grey">Cadastrar um
							novo produto</h5>

						<!-- divider -->
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
											<a href="#modal-editar-categoria"
												onclick="abrirModalCategorias();"><i
												class="material-icons left-align">add</i>Categoria</a>
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
												class="validate truncate" maxlength="100" required>
											<label for="quantidade">Quantidade do produto</label>
										</div>
									</div>

									<!-- Valor, Quantidade de estoque e Data de Vigência-->
									<div class="row">
										<div class="input-field  col s4 l4 m4">
											<input placeholder="Digite o valor" id="valor" name="valor"
												type="text" class="truncate"
												pattern="[0-9]+(\.[0-9]{0,2})?%?" step="0.01"> <label
												for="valor">Valor do produto (R$)</label>
										</div>

										<div class="input-field  col s3 l3 m3 ">
											<input placeholder="Quantidade" id="qtdEstoque"
												name="qtdEstoque" pattern="[0-9.]+" type="number"> <label
												for="qtdEstoque">Qtd. em estoque</label>
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
					<!-- /#janela-novo-produto -->
				</div>
				<!-- /#novo-produto -->
			</div>
			<!-- /#main-produto -->

			<!-- Modal Structure -->
			<div id="modal-editar-categoria" class="modal bottom-sheet">
				<div class="modal-content">
					<!-- Botão fechar -->
					<div class="row">
						<div class="col s12 m12 l12">
							<a class="modal-action modal-close right"
								onclick="abrirFormProduto(); esconderListaCategoria();"><i
								class="material-icons grey-text">close</i></a>
						</div>
					</div>

					<!-- Título de modal -->
					<div class="row">
						<div class="col s12 m12 l12">
							<!-- Título do formulário -->
							<h5 align="center">Gerenciar Categoria(s)</h5>

							<!-- divider -->
							<div class="divider"></div>
						</div>
					</div>

					<!-- Input de id e nome de categoria, botão submit e barra de pesquisa -->
					<div class="row">
						<!-- Input para id e nome de categoria -->
						<div class="input-field col s12 m6 l6">
							<form id="form-categoria">
								<input id="nomeCategoria" name="nome" type="text"
									class="validate col s12 m9 l9 truncate" maxlength="100"
									required> <label id="label-categoria" for="categoria">Nome
									da Categoria</label>
								<div class="col s12 m3 l3 center">
									<button class="btn waves-effect waves-light green"
										type="submit" name="action">
										<i class="material-icons right-align white-text">add</i>
									</button>
								</div>
							</form>

							<!-- Espaçador mobile -->
							<div id="espacador-btn" class="col s12 hide-on-med-and-up"></div>
						</div>

						<!-- Barra de pesquisa de categoria -->
						<div class="col s12 m6 l6">
							<nav class="brown hoverable">
							<div class="nav-wrapper">
								<form>
									<div class="input-field">
										<input id="search-categoria" type="search" class="truncate"
											data-list="#lista-categoria"
											onkeyup="buscar(this.id); verificarValor();"
											placeholder="Buscar categoria"> <label
											class="label-icon" for="search-categoria"><i
											class="material-icons">search</i></label><i class="material-icons">close</i>
									</div>
								</form>
							</div>
							</nav>
						</div>
					</div>
					<!-- /.row -->

					<!-- Lista de clientes -->
					<div class="row">
						<!-- Espaçador -->
						<div id="espacador-btn" class="col s12 m12 l12"></div>

						<!-- Mostrar e esconder lista de categorias -->
						<div class="col s12 m12 l12 right-align">
							<!-- Mostrar todas categorias -->
							<a id="btn-mostrar-categorias" href="#" class="tooltipped"
								data-position="left" data-delay="50"
								data-tooltip="Mostrar categorias"
								onclick="mostrarListaCategoria();"><i
								class="material-icons blue-text">keyboard_arrow_down</i></a> <a
								id="btn-esconder-categorias" href="#" class="tooltipped"
								data-position="left" data-delay="50"
								data-tooltip="Esconder categorias"
								onclick="esconderListaCategoria();"><i
								class="material-icons grey-text">keyboard_arrow_up</i></a>
						</div>
					</div>

					<!-- Lista de categorias -->
					<div class="row">
						<div id="cx-lista-categoria" class="col s12 m12 l12">
							<ul id="lista-categoria" class="collection">

							</ul>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer"></div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-editar-categoria -->

			<!-- Modal para gerenciamento da categoria selecionada -->
			<!-- Modal Structure -->
			<div id="modal-categoria" class="modal modal-fixed-footer">
				<!-- Modal content -->
				<div class="modal-content">
					<!-- Botão fechar -->
					<div class="row">
						<div class="col s12 m12 l12">
							<a class="modal-action modal-close right"
								onclick="abrirModalCategorias();"><i
								class="material-icons grey-text">close</i></a>
						</div>
					</div>


					<h5 align="center">Editar categoria</h5>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<input id="cx-idCategoria" type="hidden"> <a
						id="btn-excluir-categoria" href="#!"
						class="modal-action waves-effect waves-red btn-flat left"><i
						class="material-icons left red-text">delete</i>Excluir Categoria</a>
				</div>
			</div>

			<!-- Janela fornecedor -->
			<div id="main-fornecedor" class="col s12 m9 l9">
				<!-- Título de janela -->
				<h5 align="center">Fornecedores</h5>

				<!-- divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Tabs de fornecedor -->
				<ul id="tabs-swipe-demo" class="tabs">
					<li class="tab col s6"><a href="#principal-fornecedor"
						onclick="Materialize.fadeInImage('#principal-fornecedor')"
						class="active"><i
							class="material-icons brown-text text-lighten-2">local_shipping</i>Principal</a></li>
					<li class="tab col s6"><a href="#novo-fornecedor"
						onclick="Materialize.fadeInImage('#novo-fornecedor')"><i
							class="material-icons green-text text-lighten-2">add</i>Novo
							Fornecedor</a></li>
				</ul>

				<!-- Janela principal de fornecedor -->
				<div id="principal-fornecedor" class="col s12 blue">Test 1</div>

				<!-- Janela de cadastro de fornecedor -->
				<div id="novo-fornecedor" class="col s12 red"></div>
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