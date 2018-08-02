$(function () {


    var at_config = {
        at: "@",
        data: "http://localhost:4567/listaAmigos/",
        headerTpl: '<div class="atwho-header">Lista de Usuarios<small>&nbsp; ↑&nbsp; ↓&nbsp;</small></div>',
        insertTpl: '@${usuario}',
        displayTpl: "<li>${nombre} ${apellido} <small>${usuario}</small></li>",
        limit: 7,
        searchKey: "nombre"
    };

    $inputor = $('#inputor').atwho(at_config);
    $inputor.caret('pos', 47);
    $inputor.focus().atwho('run');

    $('#editable').atwho(at_config);


});
