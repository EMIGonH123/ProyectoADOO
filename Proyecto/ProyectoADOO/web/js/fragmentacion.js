/*$(document).ready(function() {
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
*/
$(document).ready(function() {
    $('#generarPredicados').click(function(event) {
        var atributo = $('#atributo').val();
        var operador = $('#operador').val();
        var valor = $('#valor').val();
        $.ajax({
            type: 'POST',
            data:{operador:operador,valor:valor,atributo:atributo},
            url: "ControlFragmentaciones.do?btnControlador=generarPredicados",
            success:function(result){
                $('#despliegaPredicados').html(result);
            }
        });
    });   
});

$(document).ready(function() {
    $('#fragmentar').click(function(event) {
        $.ajax({
            type: 'POST',
            url: "ControlFragmentaciones.do?btnControlador=fragmentar",
            success:function(result){
                $('#respuestaFragmentacion').html(result);
            }
        });
    });   
});

$(document).ready(function() {
    $('#generarMiniterminos').click(function(event) {
        $.ajax({
            type: 'POST',
            url: "ControlFragmentaciones.do?btnControlador=generarMiniterminos",
            success:function(result){
                $('#despliegaMiniterminos').html(result);
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
        var nombreTabla = $('#nombreTabla').val();
        $.ajax({
            type: 'POST',
            data:{nombreTabla:nombreTabla},
            url: "ControlFragmentaciones.do?btnControlador=analizarPredicados",
            success:function(result){
                $('#despliegaPredicados').html(result);
            }
        });
    });   
});
