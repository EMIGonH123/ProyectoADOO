$(document).ready(function() {
    $('#verAtributos').click(function(event) {
        var nombreTabla = $('#nombreTabla').val();
        $.ajax({
            type: 'POST',
            data:{nombreTabla:nombreTabla},
            url: "ControlFragmentaciones.do?btnControlador=verAtributos",
            success:function(result){
                $('#despliegaAtributos').html(result);
            }
        });
    });   
});

$(document).ready(function() {
    $('#generarPredicados').click(function(event) {
        var operador = $('#operador').val();
        var valor = $('#valor').val();
        $.ajax({
            type: 'POST',
            data:{operador:operador,valor:valor},
            url: "ControlFragmentaciones.do?btnControlador=generarPredicados",
            success:function(result){
                $('#despliegaPredicados').html(result);
            }
        });
    });   
});

$(document).ready(function() {
    $('#eliminarPredicados').click(function(event) {
        $.ajax({
            type: 'POST',
            url: "ControlFragmentaciones.do?btnControlador=eliminarPredicados",
            success:function(result){
                $('#despliegaPredicados').html(result);
            }
        });
    });   
});

$(document).ready(function() {
    $('#analizarPredicados').click(function(event) {
        $.ajax({
            type: 'POST',
            url: "ControlFragmentaciones.do?btnControlador=analizarPredicados",
            success:function(result){
                $('#despliegaAnalisis').html(result);
            }
        });
    });   
});
