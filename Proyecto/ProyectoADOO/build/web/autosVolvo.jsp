

<%@page import="EntidadesADOO.Automovil"%>
<%@page import="EntidadesADOO.Sucursal"%>
<%@page import="EntidadesADOO.Proveedor"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Modelos.ServicioSucursalLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! ServicioSucursalLocal servicio;%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioSucursalLocal)contexto.lookup("java:global/ProyectoADOO/ServicioSucursal!Modelos.ServicioSucursalLocal");
    Proveedor proveedor = (Proveedor)session.getAttribute("proveedor");
    Sucursal sucursal = (Sucursal)session.getAttribute("sucursal");
    String nombre = sucursal.getNombreSucursal();
    int idProveedor = proveedor.getIdProveedor();
    int idSucursal = sucursal.getIdSucursal();
    List<Sucursal> infoSucursal = servicio.getInfoDeSucursal(idSucursal);
    List<Proveedor> infoProveedor = servicio.getInfoProveedor(idProveedor);
    List<Automovil> infoAutos = servicio.getAutosAsociadosASucursal(idSucursal,"Volvo");
    
%>
<c:set scope="page" var="infoProveedor" value="<%=infoProveedor%>"/>
<c:set scope="page" var="idProveedor" value="<%=idProveedor%>"/>
<c:set scope="page" var="infoSucursal" value="<%=infoSucursal%>"/>
<c:set scope="page" var="infoAutos" value="<%=infoAutos%>"/>
<c:set scope="page" var="nombre" value="<%=nombre%>"/>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>AutomovilesSucursal</title>
    </head>
    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>
        <%--ENCABEZADO DE LA PAGINA--%>
        <section id="encabezado">    
            <div class="container row">
                <div class="col s12 m12 l12">
                    <nav class="nav-extended">
                         <c:forEach items="${infoProveedor}" var="ip">
                        <div class="nav-wrapper" style="background-color:#5c6bc0; color:white;">
                            <a class="brand-logo" style="margin-left: 10px;">
                                <h5><b><%=nombre%>:</b> ${ip[1]}</h5>
                            </a>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                        </div>
                        </c:forEach>
                        <div class="nav-content" style="background-color:#5c6bc0; color:white;">
                            <ul class="tabs tabs-transparent">
                                <c:forEach items="${infoAutos}" var="ia">
                                <li class="tab"><a class="active" href="#${ia[1]}">${ia[1]}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </section>
        
        <%--CONTENIDO DE LA PAGINA--%>
        <section id="contenidos">    
            <div class="container">
                <div class="row">
                    <div class="col l12 m12 s12">
                        <div style="background-color: #5c6bc0; color:white; text-align:center;">
                            <i class="material-icons">info_outline</i> <b>Información general del automovil</b>
                        </div>
                    </div>
                </div>
                <%--------------------------------%>
                <%-- IMAGENES DE LISTA DE AUTOS --%>
                <%--------------------------------%>
                <c:forEach items="${infoAutos}" var="ia">
                    <div id="${ia[1]}">    
                        <div class="row">
                            <div class="col l14 m4 s12">
                                <div class="card ">
                                  <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="${ia[8]}">
                                  </div>
                                  <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4">${ia[1]}<i class="material-icons right">more_vert</i></span>

                                  </div>
                                  <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                                    <p>${ia[6]}</p>
                                  </div>
                                </div>
                            </div>
                            <div class="col l14 m4 s12">
                                <div class="card " >
                                  <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="${ia[9]}">
                                  </div>
                                  <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                                  </div>
                                </div>
                            </div>
                            <div class="col l14 m4 s12">
                                <div class="card ">
                                  <div class="card-image waves-effect waves-block waves-light">
                                    <img class="activator" src="${ia[10]}">
                                  </div>
                                  <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>

                                  </div>
                                  <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                                    <p>${ia[7]}</p>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col l3 m3 s6">
                                <div style="background-color: #5c6bc0; color:white; text-align:center;">
                                    <c:if test="${ia[15] eq 'DISPONIBLE'}">
                                        <i class="material-icons">event_available</i> <b>Estado Del Auto</b>
                                    </c:if>
                                    <c:if test="${ia[15] eq 'OCUPADO'}">
                                        <i class="material-icons">event_busy</i> <b>Estado Del Auto</b>
                                    </c:if>
                                </div>
                                <c:if test="${ia[15] eq 'OCUPADO'}">
                                    <div style=" color:red; text-align:center;">
                                        <b>${ia[15]}</b>
                                    </div>
                                </c:if>
                                <c:if test="${ia[15] eq 'DISPONIBLE'}">
                                    <div style=" color:green; text-align:center;">
                                        <b>${ia[15]}</b>
                                    </div>
                                </c:if>
                            </div>
                            <div class="col l3 m3 s6">
                                <div style="background-color: #5c6bc0; color:white; text-align:center;">
                                    <i class="material-icons">filter_9_plus</i> <b>Tipo De Auto</b>
                                </div>
                                <div style=" color:#5c6bc0; text-align:center;">
                                    ${ia[16]}
                                </div>
                            </div>
                            <div class="col l3 m3 s6">
                                <div style="background-color: #5c6bc0; color:white; text-align:center;">
                                    <i class="material-icons">palette</i> <b>Color</b>
                                </div>
                                <div style=" color:#5c6bc0; text-align:center;">
                                    ${ia[2]}
                                </div>
                            </div>
                            <div class="col l3 m3 s6">
                                <div style="background-color: #5c6bc0; color:white; text-align:center;">
                                   <i class="material-icons">warning</i> <b>Kilometraje</b>
                                </div>
                                <div style=" color:#5c6bc0; text-align:center;">
                                    ${ia[4]}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col l6 m6 s12">
                                <div style="background-color: #5c6bc0; color:white; text-align:center;">
                                    <i class="material-icons">call_to_action</i> <b>Matricula</b>
                                </div>
                                <div style=" color:#5c6bc0; text-align:center;">
                                   ${ia[0]}
                                </div>
                            </div>
                            <div class="col l6 m6 s12">
                                <div style="background-color: #5c6bc0; color:white; text-align:center;">
                                   <i class="material-icons">attach_money</i> <b>Precio Renta</b>
                                </div>
                                <div style=" color:#5c6bc0; text-align:center;">
                                    ${ia[5]}
                                </div>
                            </div>
                        </div>
                    </div>        
                </c:forEach>
            </div>
        </section>
        
        <%--PIE DE LA PAGINA--%>
        <section id="pie">
            <div class="row">
                <div class="col l12 m12 s12">
                    <footer class="page-footer" style="background-color:#5c6bc0; color:white;">
                        <div class="container row"  >
                            <div class="col l4 m6 s12" id="contorno" >
                                <p>	
                                    <h5><b>Experiencia</b></h5>
                                    Promociones<br>
                                </p>
                            </div>

                            <div class="col l4 m6 s12" id="contorno">
                                <p>
                                    <h5><b>Servicio a cliente</b></h5>
                                    Atencion a cliente <br>
                                    PrestAutos Corporate<br>
                                    Servicios Financieros<br>
                                </p>
                            </div>

                            <div class="col l4 m12 s12"  id="contorno">
                                <p>
                                    <h5><b>Compañía</b></h5>
                                    Planta de PrestAutos en México<br>
                                    Comité Ejecutivo<br>
                                    Responsabilidad Social<br>
                                    Media Center<br>
                                    Bolsa de Trabajo<br>
                                    Avisos de Privacidad PrestAutos México<br>
                                </p>
                            </div>
                        </div>
                        <div class="footer-copyright">
                            <div class="container">
                                <p style="text-align: center;"> © 2018 Copyright <b>PRESTAUTOS</b> </p>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </section>
    </body>
</html>
