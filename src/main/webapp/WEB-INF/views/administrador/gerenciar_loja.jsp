<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- T�tulo -->
<title>Administrador | Gerenciar Loja</title>
</head>
<body>
	<!--  import navbar -->
	<c:import url="../component/navbar.jsp" />

	<!-- main - container principal -->
	<div class="container">

		<!-- Descri��o -->
		<div class="row">
			<!-- Section -->
			<div class="section">
				<!-- T�tulo -->
				<h5 class="left-align">Gerenciar Loja</h5>

				<!-- Subt�tulo -->
				<p class="left-align grey-text text lighten-1">Gerencie seus
					produtos sem complica��es.</p>

				<!-- Divider -->
				<div class="divider"></div>
			</div>
		</div>

		<!-- Conte�do main -->
		<div class="row">
			<!-- Op��es -->
			<div class="col s12 m3 l3">
				<!-- Descri��o -->
				<h5 align="center">Op��es</h5>

				<!-- Divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Cadastrar produto -->
				<a id="btn-novo-produto"
					class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
					class="material-icons right green-text text-green"
					onclick="janelaNovoProduto();">add</i>Novo</a>

				<!-- Espa�ador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Consultar produtos -->
				<a id="btn-consultar-produtos"
					class="waves-effect btn col s12 m12 l12 white grey-text text-grey truncate"><i
					class="material-icons right blue-text text-darken-1"
					onclick="janelaConsultarProdutos();">search</i>Consultar</a>

				<!-- Espa�ador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Espa�ador -->
				<div id="espacador-btn" class="col s12 m12 l12"></div>

				<!-- Descri��o para cadastro -->
				<div id="descricao-consulta" class="col s12 m12 l12">
					<!-- T�tulo de descri��o -->
					<h6 align="center">Descri��o</h6>

					<!-- Divider -->
					<div class="divider"></div>

					<!-- Descri��o -->
					<span class="grey-text text-grey">Pesquise por categoria ou
						nome. </span>
				</div>
			</div>

			<!-- Novo produto -->
			<div id="janela-novo-produto" class="col s12 m9 l9">
				<!-- T�tulo de janela -->
				<h5 align="center">Cadastrar um novo produto</h5>

				<!-- Divider -->
				<div class="divider"></div>

				<!-- br -->
				<br>

				<!-- Formul�rio de cadastro -->
				<div class="container">
					<div class="row">
						<!-- Formul�rio -->
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

							<!-- Categoria -->
							<div class="row">
								<div class="input-field col s12 m6 l6">
									<select name="categoria" id="select-categoria" required>
									</select> <label>Categoria</label>
								</div>

								<!-- Subcategoria -->
								<div class="input-field col s12 m6 l6">
									<select name="subcategoria" id="select-subcategoria">
									</select> <label>* Subcategoria:</label>
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

							<!-- Valor, Quantidade de estoque e Data de Vig�ncia-->
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
									<label for="dataVigencia">Data de vig�ncia</label> <input
										type="date" class="datepicker" id="dataVigencia"
										name="dataVigencia">
								</div>
							</div>

							<!-- Descri��o -->
							<div class="row">
								<div class="input-field col s12">
									<textarea id="descricao" class="materialize-textarea"
										data-length="255" maxlength="255"></textarea>
									<label for="textarea1">Descri��o do produto</label>
								</div>
							</div>

							<!-- Bot�o Cadastrar -->
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
				</div>
			</div>

			<!-- Consultar produtos -->
			<div id="janela-consultar-produtos" class="col s12 m9 l9">
				<!-- T�tulo de janela -->
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