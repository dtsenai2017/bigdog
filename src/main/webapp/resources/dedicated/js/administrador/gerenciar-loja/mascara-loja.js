// Input Valor do formulário de inserção
$('#valor').mask('000000.00', {
	reverse : true
});

// Input Valor do formulário de alteração de produto
$('#valor-p-selecionado').mask('000000.00', {
	reverse : true
});

// Formulário de inserção de fornecedor
// CNPJ
$("#cnpj").mask("00.000.000/0000-00");

// Celular
$('#celular').mask('(00) 00000-0000');

// Telefone
$('#telefone').mask('(00) 0000-0000');

// Cep
$('#cep').mask('00000-000');

// Formulário de alteração de fornecedor
// CNPJ
$("#cnpj-f-selecionado").mask("00.000.000/0000-00");

// Celular
$('#celular-f-selecionado').mask('(00) 00000-0000');

// Telefone
$('#telefone-f-selecionado').mask('(00) 0000-0000');

// Cep
$('#cep-f-selecionado').mask('00000-000');
