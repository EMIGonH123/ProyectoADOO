

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="EntidadesADOO.Sucursal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Modelos.ServicioSucursalLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! ServicioSucursalLocal servicio;%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioSucursalLocal)contexto.lookup("java:global/ProyectoADOO/ServicioSucursal!Modelos.ServicioSucursalLocal");
    Sucursal sucursal = (Sucursal)session.getAttribute("sucursal");
    int idSucursal = sucursal.getIdSucursal();
    List<Sucursal> infoSucursal = servicio.getInfoDeSucursal(idSucursal);
%>
<c:set scope="page" var="infoSucursal" value="<%=infoSucursal%>"/>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Sucursal</title>
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
                    <nav>
                        <div class="nav-wrapper" style="background-color:#5c6bc0; color:white;">
                            <c:forEach items="${infoSucursal}" var="is">
                            <a class="brand-logo" style="margin-left: 20px;"><b>${is[1]}</b></a>
                            </c:forEach>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="#redesSociales"><i class="icon fa fa-laptop" ></i></a></li>
                            </ul>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="#idObjetivos"><i class="icon fa fa-globe" ></i></a></li>
                            </ul>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="#idUbicacion"><i class="icon fa fa-map-marker" ></i></a></li>
                            </ul>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a class="dropdown-button" data-activates="marcas">
                                        Marcas<i class="material-icons right">arrow_drop_down</i>
                                    </a>
                                </li>
                            </ul>
                            
                        </div>
                    </nav>
                    <c:forEach items="${infoSucursal}" var="is">
                    <ul id="marcas" class="dropdown-content">
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=1&idSucursal=${is[0]}">Volkswagen</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=2&idSucursal=${is[0]}">Ford</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=4&idSucursal=${is[0]}">Nissan</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=5&idSucursal=${is[0]}">Toyota</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=6&idSucursal=${is[0]}">Renault</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=7&idSucursal=${is[0]}">Hunday</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=8&idSucursal=${is[0]}">KIA</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=9&idSucursal=${is[0]}">Seat</a></li>
                        <li class="divider"></li>
                        <li><a href="ControlSesiones.do?btnControlador=inicioSesionProveedorAuto&idProveedor=3&idSucursal=${is[0]}">Volvo</a></li>
                       
                    </ul>
                    </c:forEach>
                    
                </div>
            </div>
        </section>
        
        <%--CONTENIDO DE LA PAGINA--%>
        <section id="contenidos">    
            <div class="container row">
                <div class="row col s12 m12 l12">
                    <div class="slider">
                        <ul class="slides">
                            <li>
                                <img class="responsive-img" src="Images/Bancos/Hablando.png"> <!-- random image -->
                            </li>
                            <li>
                                <img class="responsive-img" src="Images/Bancos/Compras.png"> <!-- random image -->
                            </li>
                            <li>
                                <img class="responsive-img" src="Images/Bancos/Administrativos2.png"> <!-- random image -->
                            </li>
                            <li>
                                <img class="responsive-img" src="Images/Bancos/Hablando4.png"> <!-- random image -->
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div id="idObjetivos" class="col l6 m6 s12">
                        <div style="background-color: #5c6bc0; color:white; text-align:center;">
                           <i class="material-icons">trending_flat</i> <b>Misión</b>
                        </div>
                        <div>
                            La misión del negocio es tener los mejores servicion en cuanto a la renta de automoviles, asi como brindar 
                            un buen servicion a nuestros usuarios de tal manerea que sean
                        </div>
                    </div>
                    <div class="col l6 m6 s12">
                        <div style="background-color: #5c6bc0; color:white; text-align:center;">
                           <i class="material-icons">trending_up</i> <b>Visión</b>
                        </div>
                        <div>
                            Nuestra visión es ser lideres en cuanto a la renta de automoviles a nivel nacional.<br>
                            Brindar nuestros servicios de forma eficaz e inovar dia con dia para que nuestro cliente este satisfecho.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col l12 m12 s12" id="redesSociales" style="background-color: #5c6bc0; color:white; text-align: center;">
                        <i class="icon fa fa-laptop"></i>Redes Sociales
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/rs.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Facebook</span>
                            <a href="#"><i class="icon fa fa-facebook-square"></i> #prestAutosFacebook</a>
                          </div>
                        </div>
                    </div>
                    
                    <div class="col l4 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/rs2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Instagram</span>
                            <a href="#"><i class="icon fa fa-instagram"></i> #prestAutosInstagram</a>
                          </div>
                        </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/rs4.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Twitter</span>
                            <a href="#"><i class="icon fa fa-twitter-square "></i>#prestAutosTwitter</a>
                          </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${infoSucursal}" var="is">
                    <div class="row" >
                        <div class="col l12 m12 s12" id="idUbicacion">
                            <div style="background-color: #5c6bc0; color:white; text-align:center;">
                               <i class="icon fa fa-map-marker"></i> Ubicación
                            </div>
                            <div class="col l3 m6 s12">
                                <div style="color:#5c6bc0; text-align:center;">
                                    <b>Estado</b><br>
                                    ${is[2]} 
                                </div>
                            </div>
                            <div class="col l3 m6 s12">
                                <div style="color:#5c6bc0; text-align:center;">
                                    <b>Colonia</b><br>
                                    ${is[3]} 
                                </div>
                            </div>
                            <div class="col l3 m6 s12">
                                <div style="color:#5c6bc0; text-align:center;">
                                    <b>Calle</b><br>
                                    ${is[4]} 
                                </div>
                            </div>
                            <div class="col l3 m6 s12">
                                <div style="color:#5c6bc0; text-align:center;">
                                    <b>Código Postal</b><br>
                                    ${is[5]}   
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
