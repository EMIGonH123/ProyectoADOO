<%@page import="Modelos.ServicioFragmentacionLocal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServicioFragmentacionLocal servicio;%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioFragmentacionLocal)contexto.lookup("java:global/ProyectoADOO/ServicioFragmentacion!Modelos.ServicioFragmentacionLocal");
    List<String> info = servicio.obtenerAtributosDeTabla("cuenta");
%>
<c:set scope="page" var="info" value="<%=info%>"/>
<!DOCTYPE html>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Fragmentaciones</title>
    </head>

    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>
        <script>
            $(document).ready(function() {
                $('#verAtributos').click(function(event) {
                    var nombreTabla = $('#nombreTabla').val();
                    $.ajax({
                        type: 'POST',
                        data:{nombreTabla:nombreTabla},
                        url: "ControlFragmentaciones.do?btnControlador=verAtributos",
                        success: function (result) {
                            $('#despliegaAtributos').html(result);
                        }
                    });
                });   
            });
        </script>        
        
        <!--Encabezado de la pagina-->
        <section id="encabezado">
            <div class="container" >
                <div class="row">
                    <nav>
                        <div class="nav-wrapper" style="background-color: #304ffe; color:white;">
                            <a class="brand-logo" style="margin-left: 20px;"><b>Framentaciones</b></a>
                            <ul class="right hide-on-med-and-down">
                                <li><a href="#"></a></li>
                                <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </section>
        <section id="contenidos">
            <div class="container">
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h4 style="color:#304ffe;text-align: center;">Tablas</h4><br>
                        <%--<form class="col s12 m12 l12">    
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">dashboard</i>
                                    <select>
                                        <c:forEach items="${info}" var="it">
                                            <option id="nombreTabla" value="${it}">${it}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form><br><br>--%>
                        <form>
                            Nombre:<input type="text" id="nombreTabla">
                        </form>
                        <input type="button" id="verAtributos" value="Ver Atributos" />
                    </div>
                    <div class="col l6 m6 s12">
                        <h4 style="color:#304ffe;text-align: center;">Atributos</h4><br>
                        
                        <div id="despliegaAtributos"></div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
