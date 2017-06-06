// Abrir dashboard
function consumir() {
	// Mostrando informações gerais
	$('#info-dashboard').fadeIn(1800);

	// Inicializar tabs
	$('ul.tabs').tabs();
	$('#tab-ultimos-clientes').click();

	// Limpando listas de últimas atualizações
	$('#table-ultimos-clientes tbody').html('');
	$('#table-ultimas-compras tbody').html('');

	// Requisição de dados gerais
	$
			.getJSON({
				url : 'adm/dadosGerais',
				headers : {
					'Authorization' : localStorage.getItem("tokenBigDog")
				},
				type : 'GET',
				success : function(dadosGerais) {
					// Atribuindo informações gerais
					$('#qtdCliente')
							.text(
									dadosGerais.qtdCliente != '' ? dadosGerais.qtdCliente
											: '-');
					$('#qtdPet')
							.text(
									dadosGerais.qtdPet != '' ? dadosGerais.qtdPet
											: '-');
					$('#qtdEnderecoCliente')
							.text(
									dadosGerais.qtdEnderecoCliente != '' ? dadosGerais.qtdEnderecoCliente
											: '-');
					$('#qtdFornecedor')
							.text(
									dadosGerais.qtdFornecedor != '' ? dadosGerais.qtdFornecedor
											: '-');
					$('#qtdEnderecoFornecedor')
							.text(
									dadosGerais.qtdFornecedor != '' ? dadosGerais.qtdFornecedor
											: '-');
					$('#qtdCategoria')
							.text(
									dadosGerais.qtdCategoria != '' ? dadosGerais.qtdCategoria
											: '-');
					$('#qtdSubCategoria')
							.text(
									dadosGerais.qtdSubCategoria != '' ? dadosGerais.qtdSubCategoria
											: '-');
					$('#qtdProduto')
							.text(
									dadosGerais.qtdProduto != '' ? dadosGerais.qtdProduto
											: '-');
					$('#qtdCompra').text(
							dadosGerais.qtdCompra != '' ? dadosGerais.qtdCompra
									: '-');
					$('#qtdServico')
							.text(
									dadosGerais.qtdServico != '' ? dadosGerais.qtdServico
											: '-');
					$('#qtdAgendamento')
							.text(
									dadosGerais.qtdAgendamento != '' ? dadosGerais.qtdAgendamento
											: '-');

					// Atribuindo informações de últimas atualizações
					// Últimos clientes cadastrados
					$.each(dadosGerais.ultimosClientes, function(key, cliente) {
						// Atribuindo valor para table
						$('#table-ultimos-clientes tbody').append(
								'<tr><td><span id="tr-ultimo-cliente"><b>'
										+ cliente.nome + '</b> se cadastrou '
										+ 'há pouco tempo.</span></td></tr>');
					});

					// Últimas compras realizadas
					$.each(dadosGerais.ultimasCompras, function(key, compra) {
						// Atribui 0 para minutos
						function addZero(i) {
							if (i < 10) {
								i = "0" + i;
							}
							return i;
						}

						// Atributos
						var dataCompra = new Date(compra.dataCompra);
						var horas = addZero(dataCompra.getHours());
						var minutos = addZero(dataCompra.getMinutes());
						var nomeSemana;
						var nomeMes;

						// Atribuindo dia da semana
						if (dataCompra.getDay() == 0) {
							nomeSemana = 'Domingo';
						} else if (dataCompra.getDay() == 1) {
							nomeSemana = 'Segunda-Feira';
						} else if (dataCompra.getDay() == 2) {
							nomeSemana = 'Terça-Feira';
						} else if (dataCompra.getDay() == 3) {
							nomeSemana = 'Quarta-Feira';
						} else if (dataCompra.getDay() == 4) {
							nomeSemana = 'Quinta-Feira';
						} else if (dataCompra.getDay() == 5) {
							nomeSemana = 'Sexta-Feixa';
						} else if (dataCompra.getDay() == 6) {
							nomeSemana = 'Sábado';
						}

						// Atribuindo nome do mês
						if (dataCompra.getMonth() == 0) {
							nomeMes = 'Janeiro';
						} else if (dataCompra.getMonth() == 1) {
							nomeMes = 'Fevereiro';
						} else if (dataCompra.getMonth() == 2) {
							nomeMes = 'Março';
						} else if (dataCompra.getMonth() == 3) {
							nomeMes = 'Abril';
						} else if (dataCompra.getMonth() == 4) {
							nomeMes = 'Maio';
						} else if (dataCompra.getMonth() == 5) {
							nomeMes = 'Junho';
						} else if (dataCompra.getMonth() == 6) {
							nomeMes = 'Julho';
						} else if (dataCompra.getMonth() == 7) {
							nomeMes = 'Agosto';
						} else if (dataCompra.getMonth() == 8) {
							nomeMes = 'Setembro';
						} else if (dataCompra.getMonth() == 9) {
							nomeMes = 'Outubro';
						} else if (dataCompra.getMonth() == 10) {
							nomeMes = 'Novembro';
						} else if (dataCompra.getMonth() == 11) {
							nomeMes = 'D';
						}

						// Atribuindo valor para table
						$('#table-ultimas-compras tbody').append(
								'<tr><td><span id="tr-ultima-compra"><b>'
										+ compra.cliente.nome
										+ '</b> realizou uma compra '
										+ 'no dia <b>'
										+ $.datepicker.formatDate("dd",
												dataCompra) + ' de ' + nomeMes
										+ '</b> (' + nomeSemana + ', as <b>'
										+ horas + ':' + minutos
										+ '</b>), no valor de <b>R$ '
										+ compra.valor.toFixed(2)
										+ '</b>.</span></td></tr>');
					});
				},
				error : function(e) {
					console.log('ERROR : ' + e);
				}
			});

	// Informações para gráfico de Agendamentos
	// Atributos
	var qtdAgendamento = 0;
	var qtdEstetica = 0;
	var qtdVeterinario = 0;

	// Requisição Agendamentos
	$.getJSON({
		url : 'adm/agendamento',
		headers : {
			'Authorization' : localStorage.getItem("tokenBigDog")
		},
		async : false,
		type : 'GET',
		success : function(agendamentos) {
			// Atribuindo quantidade total
			qtdAgendamento = agendamentos.length;

			// Atribuindo valor por tipo de serviço
			$.each(agendamentos, function(key, agendamento) {
				if (agendamento.servico.tipoServico == 'Estetica') {
					qtdEstetica++;
				} else {
					qtdVeterinario++;
				}
			});
		},
		error : function(e) {
			console.log('ERROR : ' + e);
		}
	});

	// Atribuindo valores de porcentagem
	qtdEstetica = (qtdEstetica / qtdAgendamento);
	qtdEstetica *= 100;
	qtdVeterinario = (qtdVeterinario / qtdAgendamento);
	qtdVeterinario *= 100;

	// Gráfico
	Highcharts.chart('container', {
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : 0,
			plotShadow : false
		},
		title : {
			text : 'Tipo de serviço agendado',
			align : 'center',
		},
		tooltip : {
			pointFormat : '{series.name}: <b>{point.percentage:.2f}%</b>'
		},
		plotOptions : {
			pie : {
				dataLabels : {
					enabled : true,
					distance : -50,
					style : {
						fontWeight : 'bold',
						color : 'white'
					}
				},
				startAngle : -90,
				endAngle : 90,
				center : [ '50%', '75%' ]
			}
		},
		series : [ {
			type : 'pie',
			name : 'Porcentagem',
			innerSize : '60%',
			data : [ [ 'Estética', qtdEstetica ],
					[ 'Veterinário', qtdVeterinario ], {
						name : 'Proprietary or Undetectable',
						y : 0.2,
						dataLabels : {
							enabled : false
						}
					} ]
		} ]
	});
}