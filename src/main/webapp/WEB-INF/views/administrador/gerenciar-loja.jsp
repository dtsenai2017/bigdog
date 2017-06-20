<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Ícone da aba -->
<link rel="shortcut icon" type="image/x-icon"
	href="resources/dedicated/img/administrador/adm-icon.ico">

<!-- Título -->
<title>Administrador | Gerenciar Loja</title>

<!-- CSS dedicado em geral -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-loja/gerenciar-loja.css">

<!-- CSS dedicado para gerenciamento de produto -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-loja/gerenciar-produto.css">

<!-- CSS dedicado para gerenciamento de produto -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-loja/gerenciar-fornecedor.css">

<!-- CSS dedicado para compras -->
<link rel="stylesheet"
	href="resources/dedicated/css/administrador/gerenciar-loja/gerenciar-compra.css">
</head>
<body>
	<!--  import navbar -->
	<c:import url="component/navbar.jsp" />

	<!-- main - container principal -->
	<main class="container"> <!-- Descrição -->
	<div class="row">
		<div class="col s12 m12 l12">
			<!-- Section -->
			<div class="section">
				<!-- Título -->
				<h5 class="left-align">Gerenciar Loja</h5>

				<!-- Subtítulo -->
				<p class="left-align grey-text text lighten-1">Gerencie sua loja
					de forma simples.</p>

				<!-- divider -->
				<div class="divider"></div>
			</div>
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
				class="material-icons left red-text text-lighten-2">store</i>Produto</a>

			<!-- Espaçador -->
			<div class="col s12 m12 l12"></div>

			<!-- Botão fornecedor -->
			<a id="btn-fornecedor"
				class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
				class="material-icons left brown-text text-lighten-2">local_shipping</i>Fornecedor</a>

			<!-- Espaçador -->
			<div class="col s12 m12 l12"></div>

			<!-- Botão compras -->
			<a id="btn-compras" onclick="abrirCompras();"
				class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
				class="material-icons left cyan-text">shopping_basket</i>Compras</a>
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
					onclick="abrirPrincipalProduto();  Materialize.fadeInImage('#principal-produto')"><i
						class="material-icons red-text text-lighten-2">store</i>Principal</a></li>
				<li class="tab col s6"><a href="#novo-produto"
					onclick="abrirFormProduto(); Materialize.fadeInImage('#novo-produto')"><i
						class="material-icons green-text text-lighten-2">add</i>Novo
						Produto</a></li>
			</ul>

			<!-- Janela principal de produto -->
			<div id="principal-produto">
				<!-- Linha espaçadora -->
				<div class="row">
					<div class="col s12 m12 l12"></div>
				</div>

				<!-- Barra de pesquisa de produto -->
				<div class="row">
					<div class="col s12 m12 l12">
						<nav class="red hoverable">
						<div class="nav-wrapper">
							<form>
								<div class="input-field">
									<input id="search-produto" type="search" class="truncate"
										data-list="#lista-produto" onkeyup="buscar(this.id);"
										placeholder="Nome, Marca, Categoria ou Preço"> <label
										class="label-icon" for="search-produto"><i
										class="material-icons">search</i></label><i class="material-icons">close</i>
								</div>
							</form>
						</div>
						</nav>

						<!-- Descrição de pesquisa -->
						<p id="desc-nav-produto" class="grey-text">
							Para listar todos os produtos, clique na barra de pesquisa, <b>apague
								tudo</b> e pressione somente uma vez a <b>tecla de espaço</b>.
						</p>
					</div>
				</div>

				<!-- Lista de produtos -->
				<div class="row">
					<div id="cx-lista-produtos" class="col s12 m12 l12">
						<ul id="lista-produto" class="collection">
						</ul>
					</div>
				</div>
			</div>

			<!-- Janela de cadastro de produto -->
			<div id="novo-produto">
				<!-- br -->
				<br>

				<!-- br -->
				<br>

				<!-- Formulário de cadastro -->
				<div class="container">
					<div class="row">
						<!-- Formulário de cadastro de produto -->
						<form id="form-produto" class="col s12 m12 l12" method="post">
							<!-- Descrição de produto -->
							<div class="row">
								<!-- Título -->
								<div class="col s12 m12 l12">
									<h6 align="left">
										<b>Dados do Produto</b>
									</h6>

									<!-- divider -->
									<div class="divider"></div>
								</div>
							</div>

							<!-- Visualização da foto do produto -->
							<div class="row">
								<div class="col s12 m12 l12" align="center">
									<img id="imagem-produto" class="responsive-img materialboxed">
								</div>
							</div>

							<!-- Foto -->
							<div class="row">
								<div class="col s12 m12 l12">
									<div class="file-field input-field">
										<div id="btn-foto" class="btn cyan">
											<span><i class="material-icons center white-text">add_a_photo</i></span>
											<input id="foto" type="file" accept="image/*">
										</div>
										<div class="file-path-wrapper">
											<input id="pacote-foto" class="file-path validate truncate"
												type="text" placeholder="Escolha uma foto" required>
										</div>
										<div class="right-align truncate">
											<span class="grey-text text-lighten-1"
												style="font-size: 10px;"><i
												class="material-icons grey-text text-lighten-1 tiny">error</i>
												Tamanho máximo da foto: <b>5mb</b> </span> <br> <span
												id="tamanho-foto" class="green-text text-lighten-2"
												style="font-size: 11px;"></span>
										</div>
									</div>
								</div>
							</div>

							<!-- Nome do produto -->
							<div class="row">
								<div class="input-field col s12">
									<input id="nome" name="nome" type="text" maxlength="100"
										required> <label for="nome">* Nome do produto</label>
								</div>
							</div>

							<!-- Marca -->
							<div class="row">
								<div class="input-field col s12 m12 l12">
									<input id="marca" name="marca" type="text" class="truncate"
										maxlength="100" required> <label for="marca">*
										Marca</label>
								</div>
							</div>

							<!-- Categoria, Subcategoria e adicionar categoria -->
							<div class="row">
								<div class="input-field col s12 m5 l5">
									<select id="select-categoria" name="categoria" required>
									</select> <label>* Categoria :</label>
								</div>

								<div class="input-field col s12 m5 l5">
									<select id="select-subcategoria" name="subcategoria">
									</select> <label>Subcategoria :</label>
								</div>

								<div class="col s12 m2 l2 center">
									<a href="#modal-editar-categoria"
										onclick="abrirModalCategorias();"><i
										class="material-icons left-align">list</i>Categoria</a>
								</div>
							</div>

							<!-- Fornecedor e Cor -->
							<div class="row">
								<div class="input-field col s12 m8 l8">
									<select id="select-fornecedor" name="fornecedor" required>
									</select> <label>* Fornecedor :</label>
								</div>

								<div class="col s12 m4 l4">
									<div class="input-field">
										<input id="cor" name="cor" type="text" class="truncate"
											maxlength="100"> <label for="cor">Cor</label>
									</div>
								</div>
							</div>

							<!-- Tamanho e Quantidade -->
							<div class="row">
								<div class="input-field  col s5 l5 m5">
									<input id="tamanho" name="tamanho" type="text" class="truncate"
										maxlength="100"> <label for="tamanho">* Tam.</label>
								</div>

								<div class="input-field  col s7 l7 m7">
									<input id="quantidade" name="quantidade" type="text"
										class="truncate" maxlength="100" required> <label
										for="quantidade">* Qtde. do produto(uni)</label>
								</div>
							</div>

							<!-- Valor, Quantidade de estoque e Data de Vigência-->
							<div class="row">
								<div class="input-field  col s4 l4 m4">
									<input id="valor" name="valor" type="text" class="truncate">
									<label for="valor">* Valor (R$)</label>
								</div>

								<div class="input-field  col s4 l4 m4 ">
									<input id="qtdEstoque" name="qtdEstoque" pattern="[0-9.]+"
										type="number"> <label for="qtdEstoque">* Qtd.
										Estoque</label>
								</div>

								<div class="input-field col s4 m4 l4">
									<label for="dataVigencia">* Dt. vigência</label> <input
										id="dataVigencia" type="date" class="datepicker"
										name="dataVigencia" required>
								</div>
							</div>

							<!-- Descrição -->
							<div class="row">
								<div class="input-field col s12">
									<textarea id="descricao" class="materialize-textarea"
										data-length="255" maxlength="255"></textarea>
									<label for="descricao">Descrição do produto</label>
								</div>
							</div>

							<!-- Botão Cadastrar -->
							<div class="row">
								<div class="col s12 m12 l12">
									<button class="btn waves-effect waves-light right green"
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
			<!-- /#novo-produto -->
		</div>
		<!-- /#main-produto -->

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
					onclick="abrirPrincipalFornecedor(); Materialize.fadeInImage('#principal-fornecedor')"><i
						class="material-icons brown-text text-lighten-2">local_shipping</i>Principal</a></li>
				<li class="tab col s6"><a href="#novo-fornecedor"
					onclick="Materialize.fadeInImage('#novo-fornecedor')"><i
						class="material-icons green-text text-lighten-2">add</i>Novo
						Fornecedor</a></li>
			</ul>

			<!-- Janela principal de fornecedor -->
			<div id="principal-fornecedor">
				<!-- Linha espaçadora -->
				<div class="row">
					<div class="col s12 m12 l12"></div>
				</div>

				<!-- Descrição de busca e Barra de pesquisa de fornecedor -->
				<div class="row">
					<div class="col s12 m12 l12">
						<nav class="brown hoverable">
						<div class="nav-wrapper">
							<form>
								<div class="input-field">
									<input id="search-fornecedor" type="search" class="truncate"
										data-list="#lista-fornecedor" onkeyup="buscar(this.id);"
										placeholder="Nome, CNPJ, Telefone, Celular ou Email">
									<label class="label-icon" for="search-fornecedor"><i
										class="material-icons">search</i></label><i class="material-icons">close</i>
								</div>
							</form>
						</div>
						</nav>

						<!-- Descrição de pesquisa -->
						<p id="desc-nav-fornecedor" class="grey-text">
							Para listar todos os fornecedores, clique na barra de pesquisa, <b>apague
								tudo</b> e pressione somente uma vez a <b>tecla de espaço</b>.
						</p>
					</div>
				</div>

				<!-- Lista de fornecedor -->
				<div class="row">
					<div class="col s12 m12 l12">
						<ul id="lista-fornecedor" class="collection">
						</ul>
					</div>
				</div>
			</div>

			<!-- Janela de cadastro de fornecedor -->
			<div id="novo-fornecedor">
				<!-- br -->
				<br>

				<!-- Título de janela -->
				<h5 align="center" class="grey-text text-grey">Cadastrar um
					novo fornecedor</h5>

				<!-- divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Formulário -->
				<div class="container">
					<form id="form-fornecedor" class="col s12 m12 l12">
						<!-- Descrição de fornecedor -->
						<div class="row">
							<!-- Título -->
							<div class="col s12 m12 l12">
								<h6 align="left">
									<b>Dados do Fornecedor</b>
								</h6>
								<!-- divider -->
								<div class="divider"></div>
							</div>
						</div>

						<!-- Nome fantasia -->
						<div class="row">
							<div class="input-field col s12 m12 l12">
								<input id="nomeFantasia" type="text" maxlength="255" required>
								<label for="nomeFantasia">* Nome Fantasia</label>
							</div>
						</div>

						<!-- Razão Social -->
						<div class="row">
							<div class="input-field col s12 m12 l12">
								<input id="razaoSocial" type="text" maxlength="255" required>
								<label for="razaoSocial">* Razão Social</label>
							</div>
						</div>

						<!-- CNPJ e Email -->
						<div class="row">
							<div class="input-field col s12 m5 l5">
								<input id="cnpj" minlength="14" type="text" maxlength="18"
									required> <label for="cnpj">* CNPJ</label>
							</div>

							<div class="input-field col s12 m7 l7">
								<input id="email" type="email" class="validate" required>
								<label id="label-email" for="email">* Email</label>
							</div>
						</div>

						<!-- Celular e Telefone -->
						<div class="row">
							<div class="input-field col s6 m6 l6">
								<i class="material-icons prefix">stay_current_portrait</i> <input
									id="celular" type="tel" required> <label for="celular">*
									Celular</label>
							</div>

							<div class="input-field col s6 m6 l6">
								<i class="material-icons prefix">phone</i> <input id="telefone"
									type="tel"> <label for="telefone">Telefone</label>
							</div>
						</div>

						<!-- Descrição de endereço -->
						<div class="row">
							<!-- Título -->
							<div class="col s12 m12 l12">
								<h6 align="left">
									<b>Dados de Endereço</b>
								</h6>
								<!-- divider -->
								<div class="divider"></div>
							</div>
						</div>

						<!-- CEP e Logradouro -->
						<div class="row">
							<div class="input-field col s12 m4 l4">
								<input id="cep" type="text" maxlength="9" onblur="buscarCep();"
									required> <label id="label-cep-fornecedor" for="cep">*
									CEP</label>
							</div>

							<div class="input-field col s12 m8 l8">
								<input id="logradouro" type="text" maxlength="255"> <label
									id="label-logradouro-fornecedor" for="logradouro">*
									Logradouro</label>
							</div>
						</div>

						<!-- Número, Complemento e Bairro -->
						<div class="row">
							<div class="input-field col s5 m3 l3">
								<input id="numero" type="number" maxlength="10" step="1"
									required> <label for="numero">* Nº</label>
							</div>

							<div class="input-field col s7 m4 l4">
								<input id="complemento" type="text" maxlength="50"> <label
									for="complemento">Complemento</label>
							</div>

							<div class="input-field col s12 m5 l5">
								<input id="bairro" type="text" maxlength="100" required>
								<label id="label-bairro-fornecedor" for="bairro">*
									Bairro</label>
							</div>
						</div>

						<!-- Cidade e UF -->
						<div class="row">
							<div class="input-field col s7 m9 l9">
								<input id="cidade" type="text" maxlength="100" required>
								<label id="label-cidade-fornecedor" for="cidade">*
									Cidade</label>
							</div>

							<div class="input-field col s5 m3 l3">
								<select id="select-uf" required>
									<option value="AC">AC</option>
									<option value="AL">AL</option>
									<option value="AP">AP</option>
									<option value="AM">AM</option>
									<option value="BA">BA</option>
									<option value="CE">CE</option>
									<option value="DF">DF</option>
									<option value="ES">ES</option>
									<option value="GO">GO</option>
									<option value="MA">MA</option>
									<option value="MT">MT</option>
									<option value="MS">MS</option>
									<option value="MG">MG</option>
									<option value="PA">PA</option>
									<option value="PB">PB</option>
									<option value="PR">PR</option>
									<option value="PE">PE</option>
									<option value="PI">PI</option>
									<option value="RJ">RJ</option>
									<option value="RN">RN</option>
									<option value="RS">RS</option>
									<option value="RO">RO</option>
									<option value="RR">RR</option>
									<option value="SC">SC</option>
									<option value="SP">SP</option>
									<option value="SE">SE</option>
									<option value="TO">TO</option>
								</select> <label>UF</label>
							</div>
						</div>

						<!-- Botão Submit -->
						<div class="row">
							<div class="col s12 m12 l12">
								<button class="btn waves-effect waves-light right red"
									type="submit" name="action">
									Cadastrar<i class="material-icons right">add</i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<!-- /.container -->
			</div>
			<!-- /#novo-fornecedor -->
		</div>
		<!-- /#main-fornecedor -->

		<!-- Janela de compras -->
		<div id="main-compras" class="col s12 m9 l9">
			<!-- Título de janela -->
			<h5 align="center">Compras</h5>

			<!-- divider -->
			<div class="divider"></div>

			<!-- br -->
			<br>

			<!-- Barra de pesquisa de compras -->
			<div class="row">
				<div class="col s12 m12 l12">
					<nav class="cyan hoverable">
					<div class="nav-wrapper">
						<form>
							<div class="input-field">
								<input id="search-compra" type="search" class="truncate"
									data-list="#lista-compra" onkeyup="buscar(this.id);"
									placeholder="Data, Cliente, Valor ou Status"> <label
									class="label-icon" for="search-compra"><i
									class="material-icons">search</i></label><i class="material-icons">close</i>
							</div>
						</form>
					</div>
					</nav>

					<!-- Descrição de pesquisa -->
					<p id="desc-nav-compra" class="grey-text">
						Para listar todas as compras, clique na barra de pesquisa, <b>apague
							tudo</b> e pressione somente uma vez a <b>tecla de espaço</b>.
					</p>
				</div>
			</div>

			<!-- Lista de compras -->
			<div class="row">
				<div class="col s12 m12 l12">
					<ul id="lista-compra" class="collection">
					</ul>
				</div>
			</div>
		</div>
		<!-- /#main-compras -->
	</div>
	<!-- /.row (Conteúdo main) --> <!-- /.container --> </main>

	<!-- Modal's -->
	<!-- Modal Produto -->
	<div id="modal-produto" class="modal modal-fixed-footer white">
		<!-- Modal content -->
		<div class="modal-content">
			<!-- Botão fechar -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a class="modal-action modal-close right"><i
						class="material-icons grey-text">close</i></a>
				</div>
			</div>

			<!-- Imagem, nome e descrição em um card (Alteração dos mesmos também) -->
			<div class="row">
				<div class="col s12 m4 l4" align="center">
					<!-- Card -->
					<div class="card medium hoverable">
						<!-- Imagem -->
						<div class="card-image">
							<img id="imagem-produto-selecionado" class="materialboxed">
						</div>

						<!-- Content do Card com nome e descrição de produto -->
						<div class="card-content">
							<span id="nomeProduto" onclick="limparCardReveal();"
								class="card-title activator truncate cyan-text"></span>

							<p id="descricaoProduto" class="truncate"></p>
						</div>

						<!-- Action no card, para alteração de imagem. -->
						<div class="card-reveal">
							<!-- Título de alteração de foto -->
							<span id="titulo-card-reveal"
								class="card-title grey-text text-darken-4">Alterar imagem<i
								class="material-icons right">close</i>
							</span>

							<!-- br -->
							<br>

							<!-- Visualização da foto do produto -->
							<div class="row">
								<div class="col s12 m12 l12" align="center">
									<img id="imagem-produtoSelecionado"
										class="responsive-img materialboxed">
								</div>
							</div>

							<!-- Formulário para alteração de imagem -->
							<!-- Foto -->
							<div class="row">
								<div class="col s12 m12 l12">
									<div class="file-field input-field">
										<div id="btn-fotoProduto" class="btn cyan">
											<span><i class="material-icons center white-text">add_a_photo</i></span>
											<input id="fotoProduto" type="file" accept="image/*">
										</div>
										<div class="file-path-wrapper">
											<input id="pacote-fotoProduto"
												class="file-path validate truncate" type="text"
												placeholder="Escolha uma foto" required>
										</div>
										<div class="right-align truncate">
											<span class="grey-text text-lighten-1"
												style="font-size: 10px;"><i
												class="material-icons grey-text text-lighten-1 tiny">error</i>
												Tamanho máximo da foto: <b>5mb</b> </span> <br> <span
												id="tamanho-fotoProduto" class="green-text text-lighten-2"
												style="font-size: 11px;"></span>
										</div>
									</div>
								</div>
							</div>

							<!-- Botão alterar imagem -->
							<div class="row">
								<div class="col s12 m12 l12">
									<a id="btn-alterar-foto" href="#!"
										class="waves-effect btn-flat center">Alterar Foto</a>
								</div>
							</div>

						</div>
						<!-- /.card-reveal -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->

				<!-- Informações do produto -->
				<div class="col s12 m8 l8">
					<!-- Título e botão para alteração de produto -->
					<div class="row">
						<div class="col s12 m12 l12">
							<h5 align="left">Informações do produto</h5>

							<!-- divider -->
							<div class="divider"></div>
						</div>
					</div>

					<!-- Marca, categoria e subcategoria -->
					<div class="row">
						<!-- ID de produto -->
						<input id="idProduto-selecionado" type="hidden">

						<div class="col s12 m6 l6">
							<h6>
								<b>Marca</b>
							</h6>

							<p id="marcaProduto"></p>
						</div>

						<div class="col s12 m3 l3">
							<h6>
								<b>Categoria</b>
							</h6>

							<p id="categoriaProduto"></p>
						</div>

						<div class="col s12 m3 l3">
							<h6>
								<b>Subcategoria</b>
							</h6>

							<p id="subcategoriaProduto"></p>
						</div>
					</div>


					<!-- Cor, Tamanho e Quantidade -->
					<div class="row">
						<div class="col s12 m6 l6">
							<h6>
								<b>Cor do produto</b>
							</h6>


							<p id="corProduto"></p>
						</div>

						<div class="col s12 m3 l3">
							<h6>
								<b>Tamanho</b>
							</h6>

							<p id="tamanhoProduto"></p>
						</div>

						<div class="col s12 m3 l3">
							<h6>
								<b>Qtd. do produto</b>
							</h6>

							<p id="quantidadeProduto"></p>
						</div>
					</div>

					<!-- Quantidade de estoque, valor e data de vigência -->
					<div class="row">
						<div class="col s12 m6 l6">
							<h6>
								<b>Qtd. no estoque</b>
							</h6>

							<p id="qtdEstoqueProduto"></p>
						</div>

						<div class="col s12 m3 l3">
							<h6>
								<b>Valor</b>
							</h6>

							<p id="valorProduto"></p>
						</div>

						<div class="col s12 m3 l3">
							<h6>
								<b>Data de vigência</b>
							</h6>

							<p id="dataVigenciaProduto"></p>
						</div>
					</div>

					<!-- Fornecedor e botão para alterar produto -->
					<div class="row">
						<div class="col s12 m7 l7 truncate">
							<h6>
								<b>Fornecedor</b>
							</h6>

							<p id="fornecedorProduto"></p>
						</div>

						<div class="col s12 m5 l5 center">
							<div class="valign-wrapper">
								<p>
									<button id="btn-alterar-produto"
										data-target="modal-editar-produto"
										class="btn waves-effect waves-light cyan truncate">
										<i class="material-icons green-text text-lighten-4 left">mode_edit</i>
										Alterar
									</button>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<!-- Observações -->
			<div class="row">
				<div class="col s12 m12 l12">
					<!-- Título para observações -->
					<h6>
						<b>Observações</b>
					</h6>

					<!-- Descrição de card -->
					<p align="left" style="font-size: 12px;">
						Para alterar a imagem do produto, clique no <b>nome do produto</b>.
						Para alterar outras informações, clique no <b>botão </b> ALTERAR.
					</p>

					<!-- Descrição de alteração -->
					<p align="left" style="font-size: 12px;">
						Produtos alterados não afetam dados em compras <b>já
							realizadas</b>.
					</p>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->

		<!-- Modal footer -->
		<div class="modal-footer white">
			<!-- Botão para excluir produto -->
			<button id="btn-excluir-produto"
				class="btn-flat waves-effect waves-red left">
				<i class="material-icons left red-text">delete</i> Excluir Produto
			</button>
		</div>
	</div>
	<!-- /#modal-produto -->

	<!-- Modal para edição de produto -->
	<div id="modal-editar-produto" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="container">
				<!-- Botão fechar -->
				<div class="row">
					<div class="col s12 m12 l12">
						<a class="modal-close right"><i
							class="material-icons grey-text">close</i></a>
					</div>
				</div>

				<!-- Título de modal -->
				<div class="row">
					<h5>Alterar produto</h5>

					<!-- divider -->
					<div class="divider"></div>
				</div>

				<!-- Descrição de alteração -->
				<div class="row">
					<div class="col s12 m12 l12">
						<span>Para alterar o produto, clique no botão abaixo para <b>habilitar</b>
							alteração.
						</span>
					</div>
				</div>

				<!-- Switch para habilitar ou desabilitar formulário de alteração -->
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="switch center">
							<label> Desabilitar <input id="checkbox-alterar-produto"
								type="checkbox"> <span class="lever"></span> Habilitar
							</label>
						</div>
					</div>
				</div>

				<!-- Formulário de alteração -->
				<div class="row">
					<form id="form-alterar-produto">
						<!-- Nome do produto -->
						<div class="row">
							<div class="input-field col s12">
								<input id="nome-p-selecionado" name="nome" type="text"
									maxlength="100" disabled required> <label
									id="label-nome-p-selecionado" for="nome-p-selecionado">Nome
									do produto</label>
							</div>
						</div>

						<!-- Marca -->
						<div class="row">
							<div class="input-field col s12 m12 l12">
								<input id="marca-p-selecionado" name="marca" type="text"
									class="truncate" maxlength="100" disabled required> <label
									id="label-marca-p-selecionado" for="marca-p-selecionado">Marca</label>
							</div>
						</div>

						<!-- Categoria, Subcategoria e edição -->
						<div class="row">
							<div class="input-field col s12 m6 l6">
								<input id="idCategoria-p-selecionado" type="hidden"> <input
									disabled id="disabled-categoria" type="text"> <label
									id="label-disabled-categoria" for="disabled-categoria">Categoria</label>
							</div>

							<div class="input-field col s12 m5 l5">
								<input id="idSubcategoria-p-selecionado" type="hidden">
								<input disabled id="disabled-subcategoria" type="text">
								<label id="label-disabled-subcategoria"
									for="disabled-subcategoria">Subcategoria</label>
							</div>

							<div class="col s12 m1 l1">
								<p class="center">
									<a href="#modal-editar-categoria-p-selecionado"
										onclick="abrirModalAlterarCategoria();"><i
										class="material-icons">mode_edit</i> Editar</a>
								</p>
							</div>
						</div>

						<!-- Fornecedor e edição -->
						<div class="row">
							<div class="input-field col s12 m11 l11">
								<input id="idFornecedor-p-selecionado" type="hidden"> <input
									disabled id="disabled-fornecedor" type="text"> <label
									id="label-disabled-fornecedor" for="disabled-fornecedor">Fornecedor</label>
							</div>

							<div class="col s12 m1 l1">
								<p class="center">
									<a href="#modal-editar-fornecedor-p-selecionado"
										onclick="abrirModalAlterarFornecedor();"><i
										class="material-icons">local_shipping</i> Editar</a>
								</p>
							</div>
						</div>

						<!-- Cor, Tamanho e Quantidade -->
						<div class="row">
							<div class="col s12 m5 l5">
								<div class="input-field">
									<input id="cor-p-selecionado" name="cor" type="text"
										class="truncate" maxlength="100" disabled> <label
										id="label-cor-p-selecionado" for="cor-p-selecionado">*
										Cor</label>
								</div>
							</div>

							<div class="input-field  col s6 l4 m4">
								<input id="tamanho-p-selecionado" name="tamanho" type="text"
									class="truncate" maxlength="100" disabled> <label
									id="label-tamanho-p-selecionado" for="tamanho-p-selecionado">*
									* Tam.</label>
							</div>

							<div class="input-field  col s6 l3 m3">
								<input id="quantidade-p-selecionado" name="quantidade"
									type="text" class="truncate" maxlength="100" disabled required>
								<label id="label-qtd-p-selecionado"
									for="quantidade-p-selecionado">Qtde. do produto</label>
							</div>
						</div>

						<!-- Valor, Quantidade de estoque e Data de Vigência-->
						<div class="row">
							<div class="input-field  col s7 l4 m4">
								<input id="valor-p-selecionado" name="valor" class="truncate"
									type="text" disabled required> <label
									id="label-valor-p-selecionado" for="valor-p-selecionado">Valor
									(R$)</label>
							</div>

							<div class="input-field  col s5 l4 m4 ">
								<input id="qtdEstoque-p-selecionado" name="qtdEstoque"
									pattern="[0-9.]+" type="number" disabled required> <label
									id="label-qtdEstoque-p-selecionado"
									for="qtdEstoque-p-selecionado">Qtd. Estoque</label>
							</div>

							<div class="input-field col s12 m4 l4">
								<label id="label-dataVigencia-p-selecionado"
									for="dataVigencia-p-selecionado">Dt. vigência</label> <input
									id="dataVigencia-p-selecionado" name="dataVigencia"
									class="datepicker" type="date" disabled required>
							</div>
						</div>

						<!-- Descrição -->
						<div class="row">
							<div class="input-field col s12">
								<textarea id="descricao-p-selecionado"
									class="materialize-textarea" data-length="255" maxlength="255"
									disabled></textarea>
								<label id="label-descricao-p-selecionado"
									for="descricao-p-selecionado">Descrição do produto</label>
							</div>
						</div>

						<!-- Botão Alterar -->
						<div class="row">
							<div class="col s12 m12 l12">
								<button id="btn-alterar-produto"
									class="btn waves-effect waves-light right green" type="submit"
									name="action">
									Alterar Produto <i class="material-icons right">mode_edit</i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.modal-content -->

		<!-- Modal footer -->
		<div class="modal-footer"></div>
	</div>
	<!-- /#modal-editar-produto -->

	<!-- Modal para edição de categoria de produto cadastrado -->
	<div id="modal-editar-categoria-p-selecionado" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<!-- Botão fechar -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a class="modal-action modal-close right"><i
						class="material-icons grey-text">close</i></a>
				</div>
			</div>

			<!-- Título de modal -->
			<div class="row">
				<div class="col s12 m12 l12">
					<h5 align="center">Editar Categoria</h5>

					<!-- divider -->
					<div class="divider"></div>
				</div>
			</div>

			<!-- Select de categoria e subcategoria -->
			<form id="form-categoria-p-selecionado">
				<div class="row">
					<div class="input-field col s12 m6 l6">
						<select id="select-categoria-p-selecionado" name="categoria"
							required>
						</select> <label>Categoria:</label>
					</div>

					<div class="input-field col s12 m6 l6">
						<select id="select-subcategoria-p-selecionado" name="subcategoria">
						</select> <label>* Subcategoria:</label>
					</div>
				</div>

				<!-- Botão alterar categoria e subcategoria -->
				<div class="row">
					<div class="col s12 m12 l12">
						<button id="btn-alterar-categoria-p-selecionado"
							class="btn waves-effect waves-light right cyan" type="submit"
							name="action">
							OK <i class="material-icons right">done_all</i>
						</button>
					</div>
				</div>
			</form>
		</div>

		<!-- Modal footer -->
		<div class="modal-footer"></div>
	</div>
	<!-- /#modal-editar-categoria-p-selecionado -->

	<!-- Modal para edição de fornecedor de produto cadastrado -->
	<div id="modal-editar-fornecedor-p-selecionado" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<!-- Botão fechar -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a class="modal-action modal-close right"><i
						class="material-icons grey-text">close</i></a>
				</div>
			</div>

			<!-- Título de modal -->
			<div class="row">
				<div class="col s12 m12 l12">
					<h5 align="center">Editar Fornecedor</h5>

					<!-- divider -->
					<div class="divider"></div>
				</div>
			</div>

			<!-- Select de categoria e subcategoria -->
			<form id="form-fornecedor-p-selecionado">
				<div class="row">
					<div class="input-field col s12 m12 l12">
						<select id="select-fornecedor-p-selecionado" name="categoria"
							required>
						</select> <label>fornecedor:</label>
					</div>
				</div>

				<!-- Botão alterar fornedor -->
				<div class="row">
					<div class="col s12 m12 l12">
						<button id="btn-alterar-fornecedor-p-selecionado"
							class="btn waves-effect waves-light right cyan" type="submit"
							name="action">
							OK <i class="material-icons right">done_all</i>
						</button>
					</div>
				</div>
			</form>
		</div>

		<!-- Modal footer -->
		<div class="modal-footer"></div>
	</div>
	<!-- /#modal-editar-fornecedor-p-selecionad -->

	<!-- Modal para gerenciar categoria -->
	<div id="modal-editar-categoria" class="modal bottom-sheet">
		<div class="modal-content">
			<!-- Botão fechar -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a class="modal-action modal-close left"
						onclick="esconderListaCategoria();"><i
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

			<!-- Input de nome de categoria, botão submit e barra de pesquisa -->
			<div class="row">
				<!-- Input para id e nome de categoria -->
				<div class="input-field col s12 m6 l6">
					<form id="form-categoria" method="post">
						<input id="nomeCategoria" name="nome" type="text"
							class="col s12 m9 l9 truncate" maxlength="100" required>
						<label id="label-categoria" for="nomeCategoria">Nome da
							Categoria</label>
						<div class="col s12 m3 l3 center">
							<button class="btn waves-effect waves-light green" type="submit"
								name="action">
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
									placeholder="Nome da Categoria"> <label
									class="label-icon" for="search-categoria"><i
									class="material-icons">search</i></label><i class="material-icons">close</i>
							</div>
						</form>
					</div>
					</nav>

					<!-- Descrição de pesquisa -->
					<p id="desc-nav-categoria" class="grey-text">
						Para listar todas as categorias, clique na barra de pesquisa, <b>apague
							tudo</b> e pressione somente uma vez a <b>tecla de espaço</b>, ou
						clique na <i class="material-icons blue-text">keyboard_arrow_down</i>
						abaixo.
					</p>
				</div>
			</div>
			<!-- /.row -->

			<!-- Ícones para esconder ou mostrar lista de categorias -->
			<div class="row">
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
				<div class="col s12 m12 l12">
					<ul id="lista-categoria" class="collection">
						<!-- ... -->
					</ul>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer"></div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-editar-categoria -->

	<!-- Modal para categorias -->
	<div id="modal-categoria" class="modal modal-fixed-footer">
		<!-- Modal content -->
		<div class="modal-content">
			<!-- Botão fechar -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a class="modal-action modal-close left"><i
						class="material-icons grey-text">close</i></a>
				</div>
			</div>

			<!-- Titulo de modal -->
			<h5 id="titulo-modal-categoria" align="center"></h5>
			<div class="divider"></div>

			<!-- Main -->
			<div class="row">
				<!-- Input para nome de subcategoria -->
				<div class="input-field col s12 m6 l6">
					<form id="form-subcategoria" method="post">
						<input id="idCategoria" type="hidden"> <input
							id="nomeSubcategoria" name="nome" type="text"
							class="col s12 m9 l9 truncate" maxlength="100" required>
						<label id="label-subcategoria" for="nomeSubcategoria">Nome
							da SubCategoria</label>
						<div class="col s12 m3 l3 center">
							<button class="btn waves-effect waves-light green" type="submit"
								name="action">
								<i class="material-icons right-align white-text">add</i>
							</button>
						</div>
					</form>

					<!-- Espaçador mobile -->
					<div id="espacador-btn" class="col s12 hide-on-med-and-up"></div>
				</div>

				<!-- Lista de subcategorias -->
				<div class="col s12 m6 l6">
					<!-- Descrição de lista -->
					<h6 align="center">Subcategorias</h6>

					<!-- Lista de subcategorias -->
					<ul id="lista-subcategoria" class="collection">
						<!-- ... -->
					</ul>
				</div>
			</div>
		</div>

		<!-- Modal footer -->
		<div class="modal-footer">
			<a id="btn-excluir-categoria" href="#!"
				class="waves-effect waves-red btn-flat left"><i
				class="material-icons left red-text">delete</i>Excluir Categoria</a>

			<p style="font-size: 12px;">Só é possível excluir categoria(s) ou
				sub-categoria(s) se a mesma não estiver vinculada a nenhum produto.</p>
		</div>
	</div>
	<!-- /#modal-categoria -->

	<!-- Modal de fornecedor selecionado -->
	<div id="modal-fornecedor" class="modal modal-fixed-footer white">
		<!-- Modal content -->
		<div class="modal-content">
			<!-- Botão fechar -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a class="modal-action modal-close right"><i
						class="material-icons grey-text">close</i></a>
				</div>
			</div>

			<!-- Título de modal (Nome do fornecedor) -->
			<div class="row">
				<div class="col s12 m12 l12">
					<h5 align="center" id="titulo-modal-fornecedor"></h5>

					<!-- divider -->
					<div class="divider"></div>
				</div>
			</div>

			<!-- Informações do fornecedor (ID, Razao social e CNPJ)-->
			<div class="row">
				<div class="col s12 m6 l6">
					<input id="idFornecedor-selecionado" type="hidden">

					<h6>
						<b>Razão Social</b>
					</h6>

					<p id="razaoSocialFornecedor"></p>
				</div>

				<div class="col s12 m6 l6">
					<h6>
						<b>CNPJ</b>
					</h6>

					<p id="cnpjFornecedor"></p>
				</div>
			</div>

			<!-- Informações de contato fornecedor (Email, Telefone e celular)-->
			<div class="row">
				<div class="col s12 m6 l6">
					<h6>
						<b>Email</b>
					</h6>

					<p id="emailContatoFornecedor"></p>
				</div>

				<div class="col s12 m3 l3">
					<h6>
						<b>Telefone</b>
					</h6>

					<p id="telefoneContatoFornecedor"></p>
				</div>

				<div class="col s12 m3 l3">
					<h6>
						<b>Celular</b>
					</h6>

					<p id="celularContatoFornecedor"></p>
				</div>
			</div>

			<!-- Botão Alterar Fornecedor -->
			<div class="row">
				<div class="col s12 m12 l12">
					<a id="btn-alterar-fornecedor" href="#modal-alterar-fornecedor"
						data-target="modal-editar-fornecedor"
						class="btn waves-effect waves-light cyan truncate left"> <i
						class="material-icons green-text text-lighten-4 left">mode_edit</i>
						Alterar
					</a>
				</div>
			</div>

			<!-- Título de endereços -->
			<div class="row">
				<!-- Título e descrição de endereços -->
				<div class="col s12 m12 l12">
					<h5>Endereço(s) do Fornecedor</h5>

					<!-- divider -->
					<div class="divider"></div>

					<span>Para alterar ou excluir endereço, selecione o endereço
						e clique em <span class="grey-text"><i
							class="material-icons red-text text-lighten-2">mode_edit</i></span>.
					</span>
				</div>
			</div>

			<!-- Endereços -->
			<div class="row">
				<!-- Botão inserir novo endereço -->
				<div class="col s12 m2 l2 center">
					<!-- Botão para excluir fornecedor -->
					<a id="btn-novo-endereco-fornecedor"
						href="#modal-endereco-fornecedor" class="btn waves-effect green">
						<i class="material-icons">add</i>
					</a>
				</div>

				<!-- Lista de endereços -->
				<div class="col s12 m10 l10">
					<ul id="lista-endereco-fornecedor" class="collapsible hoverable"
						data-collapsible="accordion">
					</ul>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.modal-content -->

		<!-- Modal footer -->
		<div class="modal-footer white">
			<!-- Botão para excluir fornecedor -->
			<button id="btn-excluir-fornecedor"
				class="btn-flat waves-effect waves-red left">
				<i class="material-icons left red-text">delete</i> Excluir
				Fornecedor
			</button>
		</div>
	</div>
	<!-- /#modal-fornecedor -->

	<!-- Modal para alteração do fornecedor -->
	<div id="modal-alterar-fornecedor" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="container">
				<!-- Botão fechar -->
				<div class="row">
					<div class="col s12 m12 l12">
						<a class="modal-action modal-close right"><i
							class="material-icons grey-text">close</i></a>
					</div>
				</div>

				<!-- Título de modal -->
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 align="center">Alterar Fornecedor</h5>

						<!-- divider -->
						<div class="divider"></div>
					</div>
				</div>

				<!-- Formulário -->
				<form id="form-alterar-fornecedor">
					<!-- Nome fantasia -->
					<div class="row">
						<div class="input-field col s12 m12 l12">
							<input id="nomeFantasia-f-selecionado" type="text"
								maxlength="255" required> <label
								id="label-nomeFantasia-f-selecionado"
								for="nomeFantasia-f-selecionado">Nome Fantasia</label>
						</div>
					</div>

					<!-- Razão Social -->
					<div class="row">
						<div class="input-field col s12 m12 l12">
							<input id="razaoSocial-f-selecionado" type="text" maxlength="255"
								required> <label id="label-razaoSocial-f-selecionado"
								for="razaoSocial-f-selecionado">Razão Social</label>
						</div>
					</div>

					<!-- CNPJ e Email -->
					<div class="row">
						<div class="input-field col s12 m5 l5">
							<input id="cnpj-f-selecionado" minlength="14" type="text"
								maxlength="18" required> <label
								id="label-cnpj-f-selecionado" for="cnpj-f-selecionado">CNPJ</label>
						</div>

						<div class="input-field col s12 m7 l7">
							<input id="email-f-selecionado" type="email" class="validate">
							<label id="label-email-f-selecionado" for="email-f-selecionado">Email</label>
						</div>
					</div>

					<!-- Celular e Telefone -->
					<div class="row">
						<div class="input-field col s6 m6 l6">
							<i class="material-icons prefix">stay_current_portrait</i> <input
								id="celular-f-selecionado" type="tel" required> <label
								id="label-celular-f-selecionado" for="celular-f-selecionado">Celular</label>
						</div>

						<div class="input-field col s6 m6 l6">
							<i class="material-icons prefix">phone</i> <input
								id="telefone-f-selecionado" type="tel"> <label
								id="label-telefone-f-selecionado" for="telefone-f-selecionado">Telefone</label>
						</div>
					</div>

					<!-- Botões Alterar Fornecedor -->
					<div class="row">
						<div class="col s12 m12 l12">
							<button id="btn-alterar-fornecedor"
								class="btn waves-effect waves-light right green lighten-2"
								type="submit" name="action">
								Alterar<i id="icon-btn-endereco" class="material-icons right">mode_edit</i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.container -->
		</div>

		<!-- Modal footer -->
		<div class="modal-footer"></div>
	</div>

	<!-- Modal para inserir ou alterar endereço de fornecedor selecionado -->
	<div id="modal-endereco-fornecedor" class="modal modal-fixed-footer">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="container">
				<!-- Botão fechar -->
				<div class="row">
					<div class="col s12 m12 l12">
						<a class="modal-action modal-close right"><i
							class="material-icons grey-text">close</i></a>
					</div>
				</div>

				<!-- Título de modal -->
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 align="center">Endereço</h5>

						<!-- divider -->
						<div class="divider"></div>
					</div>
				</div>

				<!-- Formulário de Endereço -->
				<!-- CEP e Logradouro -->
				<form id="form-endereco-fornecedor">
					<!-- ID do endereço -->
					<input id="idEnderecoFornecedor-selecionado" type="hidden">

					<div class="row">
						<div class="input-field col s12 m3 l3">
							<input id="cep-f-selecionado" type="text" maxlength="9"
								onblur="buscarCep();" required> <label
								id="label-cep-f-selecionado" for="cep-f-selecionado">CEP</label>
						</div>

						<div class="input-field col s12 m9 l9">
							<input id="logradouro-f-selecionado" type="text" maxlength="255">
							<label id="label-logradouro-f-selecionado"
								for="logradouro-f-selecionado">Logradouro</label>
						</div>
					</div>

					<!-- Número, Complemento e Bairro -->
					<div class="row">
						<div class="input-field col s5 m2 l2">
							<input id="numero-f-selecionado" type="number" maxlength="10"
								step="1" required> <label
								id="label-numero-f-selecionado" for="numero-f-selecionado">Nº</label>
						</div>

						<div class="input-field col s7 m3 l3">
							<input id="complemento-f-selecionado" type="text" maxlength="50">
							<label id="label-complemento-f-selecionado"
								for="complemento-f-selecionado">Complemento</label>
						</div>

						<div class="input-field col s12 m7 l7">
							<input id="bairro-f-selecionado" type="text" maxlength="100"
								required> <label id="label-bairro-f-selecionado"
								for="bairro-f-selecionado">Bairro</label>
						</div>
					</div>

					<!-- Cidade e UF -->
					<div class="row">
						<div class="input-field col s7 m9 l9">
							<input id="cidade-f-selecionado" type="text" maxlength="100"
								required> <label id="label-cidade-f-selecionado"
								for="cidade-f-selecionado">Cidade</label>
						</div>

						<div class="input-field col s5 m3 l3">
							<select id="uf-f-selecionado" required>
								<option value="AC">AC</option>
								<option value="AL">AL</option>
								<option value="AP">AP</option>
								<option value="AM">AM</option>
								<option value="BA">BA</option>
								<option value="CE">CE</option>
								<option value="DF">DF</option>
								<option value="ES">ES</option>
								<option value="GO">GO</option>
								<option value="MA">MA</option>
								<option value="MT">MT</option>
								<option value="MS">MS</option>
								<option value="MG">MG</option>
								<option value="PA">PA</option>
								<option value="PB">PB</option>
								<option value="PR">PR</option>
								<option value="PE">PE</option>
								<option value="PI">PI</option>
								<option value="RJ">RJ</option>
								<option value="RN">RN</option>
								<option value="RS">RS</option>
								<option value="RO">RO</option>
								<option value="RR">RR</option>
								<option value="SC">SC</option>
								<option value="SP">SP</option>
								<option value="SE">SE</option>
								<option value="TO">TO</option>
							</select> <label>UF</label>
						</div>
					</div>

					<!-- Botões Alterar ou Inserir Endereço -->
					<div class="row">
						<div class="col s12 m12 l12">
							<button id="btn-alterar-endereco"
								class="btn waves-effect waves-light right green lighten-2"
								type="submit" name="action">
								Alterar<i id="icon-btn-endereco" class="material-icons right">mode_edit</i>
							</button>

							<button id="btn-inserir-endereco"
								class="btn waves-effect waves-light right green lighten-2"
								type="submit" name="action">
								Inserir novo<i id="icon-btn-endereco"
									class="material-icons right">add</i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.container -->
		</div>

		<!-- Modal footer -->
		<div class="modal-footer">
			<!-- Botão para excluir fornecedor -->
			<button id="btn-excluir-endereco"
				class="btn-flat waves-effect waves-red left">
				<i class="material-icons left red-text">delete</i> Excluir Endereço
			</button>
		</div>
	</div>

	<!-- Modal para informação de compra -->
	<div id="modal-info-compra" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="container">
				<!-- Botão fechar -->
				<div class="row">
					<div class="col s12 m12 l12">
						<a class="modal-action modal-close right"><i
							class="material-icons grey-text">close</i></a>
					</div>
				</div>

				<!-- Título da modal e id da compra-->
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 align="center">Informações da Compra</h5>

						<p>
							<b>Informações da compra</b>
						</p>

						<!-- divider -->
						<div class="divider"></div>
					</div>

					<input id="idCompra-selecionada" type="hidden">
				</div>

				<!-- Descrição para informações da compra -->
				<!-- Data da compra, status e frete -->
				<div class="row">
					<div class="col s12 m3 l3">
						<h6>
							<b>Data</b>
						</h6>

						<p id="dataCompra-selecionada"></p>
					</div>

					<div class="col s12 m3 l3">
						<h6>
							<b>Hora</b>
						</h6>

						<p id="horarioCompra-selecionada"></p>
					</div>

					<div class="col s12 m3 l3">
						<h6>
							<b>Frete</b>
						</h6>

						<p id="frete-selecionada"></p>
					</div>

					<div class="col s12 m3 l3">
						<div class="input-field col s12 m12 l12">
							<form>
								<input id="input-status-selecionada" type="text"
									class="truncate" required> <label
									id="label-status-selecionada" for="input-status-selecionada">Status</label>
							</form>
						</div>
					</div>
				</div>

				<!-- Descrição para informações do cliente -->
				<div class="row">
					<div class="col s12 m12 l12">
						<p>
							<b>Informações dos cliente</b>
						</p>

						<div class="divider"></div>
					</div>
				</div>

				<!-- Informações do cliente  -->
				<!-- Nome, cpf, email e celular -->
				<div class="row">
					<div class="col s12 m8 l8">
						<h6>
							<b>Nome do Cliente</b>
						</h6>

						<p id="cliente-compra-selecionada"></p>
					</div>

					<div class="col s12 m4 l4">
						<h6>
							<b>CPF</b>
						</h6>

						<p id="clienteCpf-compra-selecionada"></p>
					</div>

					<div class="col s12 m8 l8">
						<h6>
							<b>Email</b>
						</h6>

						<p id="clienteEmail-compra-selecionada"></p>
					</div>

					<div class="col s12 m4 l4">
						<h6>
							<b>Celular</b>
						</h6>

						<p id="clienteCelular-compra-selecionada"></p>
					</div>
				</div>

				<!-- Descrição para informações do endereço de entrega -->
				<div class="row">
					<div class="col s12 m12 l12">
						<p>
							<b>Endereço de Entrega</b>
						</p>

						<div class="divider"></div>
					</div>
				</div>

				<!-- Endereço da compra -->
				<div class="row">
					<!-- CEP -->
					<div class="col s12 m5 l5">
						<h6>
							<b>CEP</b>
						</h6>

						<p id="cep-compra-selecionada"></p>
					</div>

					<!-- Logradouro -->
					<div class="col s12 m7 l7">
						<h6>
							<b>Logradouro</b>
						</h6>

						<p id="logradouro-compra-selecionada"></p>
					</div>

					<!-- Complemento -->
					<div class="col s12 m5 l5">
						<h6>
							<b>Complemento</b>
						</h6>

						<p id="complemento-compra-selecionada"></p>
					</div>

					<!-- Bairro -->
					<div class="col s12 m7 l7">
						<h6>
							<b>Bairro</b>
						</h6>

						<p id="bairro-compra-selecionada"></p>
					</div>

					<!-- Cidade -->
					<div class="col s12 m8 l8">
						<h6>
							<b>Cidade</b>
						</h6>

						<p id="cidade-compra-selecionada"></p>
					</div>

					<!-- UF -->
					<div class="col s12 m4 l4">
						<h6>
							<b>UF</b>
						</h6>

						<p id="uf-compra-selecionada"></p>
					</div>
				</div>

				<!-- Descrição para informações do(s) produto(s) -->
				<div class="row">
					<div class="col s12 m12 l12">
						<p>
							<b>Informações dos itens</b>
						</p>

						<div class="divider"></div>
					</div>
				</div>

				<!-- Itens da compra  -->
				<div class="row">
					<!-- Tabela de itens -->
					<div class="col s12 m12 l12">
						<table id="tabela-itens-compra" class="striped">
							<thead>
								<tr>
									<th>Nome</th>
									<th>Qtd.</th>
									<th>Valor (uni.)</th>
									<th>Valor (total)</th>
								</tr>
							</thead>

							<tbody>
							</tbody>
						</table>
					</div>

					<!-- divider -->
					<div class="col s12 m12 l12">
						<div class="divider"></div>
					</div>

					<!-- Valor total da compra -->
					<div class="col s12 m12 l12 right-align">
						<h6>
							<b>QTD. DE ITENS</b> : <span id="qtdItens-selecionada"></span>
						</h6>

						<h5>
							<b>TOTAL + frete : </b> <span id="valor-selecionada"></span>
						</h5>

						<div class="divider"></div>
					</div>
				</div>
				<!-- /#itens-compra -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.modal-content -->

		<!-- Modal footer -->
		<div class="modal-footer"></div>
	</div>
	<!-- /#modal-info-compra -->

	<!-- import footer -->
	<c:import url="component/footer.jsp" />

	<!-- Script's dedicado -->
	<!-- JS dedicado para loja em geral -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-loja/gerenciar-loja.js"
		charset="utf-8" defer></script>

	<!-- ViaCEP -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/viacep/viacep.js"
		charset="utf-8" defer></script>

	<!-- JS dedicado para gerenciamento de produtos -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-loja/gerenciar-produto.js"
		charset="utf-8" defer></script>

	<!-- JS dedicado para gerenciamento de fornecedor -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-loja/gerenciar-fornecedor.js"
		charset="utf-8" defer></script>

	<!-- JS dedicado para compras -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-loja/gerenciar-compra.js"
		charset="utf-8" defer></script>

	<!-- Mascaras -->
	<script type="text/javascript"
		src="resources/dedicated/js/administrador/gerenciar-loja/mascara-loja.js"
		charset="utf-8" defer></script>
</body>
</html>