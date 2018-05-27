
<%@page import="Modelos.ServicioFragmentacionLocal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServicioFragmentacionLocal servicio;
%>
<%
    InitialContext contexto = new InitialContext();
    InitialContext contextop = new InitialContext();
    servicio = (ServicioFragmentacionLocal)contexto.lookup("java:global/ProyectoADOO/ServicioFragmentacion!Modelos.ServicioFragmentacionLocal");
    List<Object> infoTablas = servicio.getTablasDeLaBD();
    List<String> descTabla = servicio.getAtributosDeTabla();
    List<String> infoPredicados = servicio.getListaDePredicados();
%>
<c:set scope="page" var="infoPredicados" value="<%=infoPredicados%>"/>
<c:set scope="page" var="infoTablas" value="<%=infoTablas%>"/>
<c:set scope="page" var="descTabla" value="<%=descTabla%>"/>
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
                        
                        <form action="ControlFragmentaciones.do"  method="POST">
                           
                            <div class="input-field col s12">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select id="nombreTabla" name="nombreTabla">
                                    <c:forEach items="${infoTablas}" var="it">
                                        <option>${it}</option>
                                    </c:forEach>                                
                                </select>
                            </div>
                            <button style="background-color: #304ffe;" type="submit" name="btnControlador" value="verAtributos" class="btn center">
                                Ver Atributos
                            </button>
                        </form>

                    </div>
                    <div class="col l6 m6 s12">
                        <h4 style="color:#304ffe;text-align: center;">Predicados Simples</h4><br>
                        <form>
                            <div class="row">
                                
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">hdr_strong</i>
                                    <select id="atributo">
                                        <c:forEach items="${descTabla}" var="it">
                                            <option>${it}</option>
                                        </c:forEach>                                
                                    </select>
                                    <label>Atributo</label>
                                </div>
                                <div class="input-field col s12">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  
                                  <select id="operador">
                                      <option value=">">MAYOR</option>
                                      <option value="<">MENOR</option>
                                      <option value="=">IGUAL</option>
                                      <option value="!=">DIFERENTE</option>
                                      <option value=">=">MAYOR IGUAL</option>
                                      <option value="<=">MENOR IGUAL</option>
                                  </select>
                                  <label>Operador</label>
                                </div>
                                <div class="input-field col s12">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <input id="valor" name="valor" type="text" class="validate">
                                  <label for="valor">Valor</label>
                                </div>
                            </div>
                            
                        </form><br>
                        <input type="button" id="generarPredicados" value="Generar Predicados" />
                    </div>
                        
                </div>
                <div class="row">
                    <div class="col l4 m4 s12">
                        <table class='highlight responsive-table centered'>
                        <thead>
                          <tr>
                              <th>Atributos</th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach items="${descTabla}" var="it">
                            <tr>
                              <td>${it}</td>
                            </tr>
                          </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                    <div class="col l8 m8 s12">
                        <div id="despliegaPredicados"></div>
                        <input type="button" id="eliminarPredicados" value="Borrar Predicados" />
                        <input type="button" id="analizarPredicados" value="Analizar Predicados" />
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
