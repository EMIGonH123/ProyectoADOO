<%@page import="Modelos.ServicioFragmentacionLocal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServicioFragmentacionLocal servicio;%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioFragmentacionLocal)contexto.lookup("java:global/ProyectoADOO/ServicioFragmentacion!Modelos.ServicioFragmentacionLocal");
    List<Object> infoTablas = servicio.getTablasDeLaBD();
%>
<c:set scope="page" var="infoTablas" value="<%=infoTablas%>"/>
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
        <script type="text/javascript" src="js/fragmentacion.js"></script>
        
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
                        
                        <form>
                            <div class="input-field col s12">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select id="nombreTabla">
                                    <c:forEach items="${infoTablas}" var="it">
                                        <option>${it}</option>
                                    </c:forEach>                                
                                </select>
                            </div>
                        </form>
                        <input type="button" id="verAtributos" value="Ver Atributos" />
                    </div>
                    <div class="col l6 m6 s12">
                        <h4 style="color:#304ffe;text-align: center;">Predicados Simples</h4><br>
                        </form>
                            <div class="row">
                                <div class="input-field col s12">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <select id="operador">
                                      <option value="62">MAYOR</option>
                                      <option value="60">MENOR</option>
                                      <option value="61">IGUAL</option>
                                      <option value="62">MAYOR IGUAL</option>
                                      <option value="60">MENOR IGUAL</option>
                                  </select>
                                </div>
                                <div class="input-field col s12">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <input id="valor" name="valor" type="text" class="validate">
                                  <label for="valor">Valor</label>
                                </div>
                            </div>
                        </form><br>
                        <input type="button" id="generarPredicados" value="Generar Predicado" />
                    </div>
                        
                </div>
                <div class="row">
                    <div class="col l6 m6 s12">
                        <div id="despliegaAtributos"></div>
                    </div>
                    <div class="col l6 m6 s12">
                        <div id="despliegaPredicados"></div>
                        <input type="button" id="eliminarPredicados" value="Borrar Predicados" />
                        <input type="button" id="analizarPredicados" value="Analizar Predicados" />
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
