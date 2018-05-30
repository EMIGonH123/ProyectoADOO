

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
    int idProveedor = proveedor.getIdProveedor();
    List<Proveedor> infoProveedor = servicio.getInfoProveedor(idProveedor);
    
%>
<c:set scope="page" var="infoProveedor" value="<%=infoProveedor%>"/>
<c:set scope="page" var="idProveedor" value="<%=idProveedor%>"/>
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
                    <c:forEach items="${infoProveedor}" var="ip">
                    <nav class="nav-extended">
                        <div class="nav-wrapper" style="background-color:#5c6bc0; color:white;">
                            
                            <a class="brand-logo" style="margin-left: 20px;"><b>${ip[1]}</b></a>
                            
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                        </div>
                        <div class="nav-content" style="background-color:#5c6bc0; color:white;">
                            <ul class="tabs tabs-transparent">
                                <li class="tab"><a class="active" href="#Ateca">Ateca</a></li>
                                <li class="tab"><a class="active" href="#Leon">Leon</a></li>
                                <li class="tab"><a class="active" href="#Toledo">Toledo</a></li>
                            </ul>
                        </div>
                    </nav>
                    </c:forEach>
                </div>
            </div>
        </section>
        
        <%--CONTENIDO DE LA PAGINA--%>
        <section id="contenidos">    
            <div class="container">
                
                <%-----------------------------------%>
                <%-- IMAGENES DE AUTO ATECA --%>
                <%-----------------------------------%>
                <div class="row" id="Ateca">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Ateca/ateca1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">ATECA<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>El SEAT Ateca 2016 se sitúa como un competidor en el segmento de los SUV para ofrecer a los conductores lo que necesitan tanto en ciudad como fuera de ella.
                                Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4363 mm, clasificamos el Seat Ateca en la categoría de SUV compactos.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Ateca/ateca2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Ateca/ateca3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Espacio interior de 5 plazas.</p>
                          </div>
                        </div>
                    </div>
                </div>
                
                <%--------------------------%>
                <%-- IMAGENES DE AUTO LEON --%>
                <%--------------------------%>
                <div class="row" id="Leon">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Leon/leon1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">LEON<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con diseño compacto y aerodinámico, el 3 puertas SEAT León SC 2017 mantiene las medidas exteriores.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Leon/leon2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Leon/leon3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Espacio interior de 5 plazas.</p>
                          </div>
                        </div>
                    </div>
                </div>
                
                <%--------------------------%>
                <%-- IMAGENES DE AUTO TOLEDO --%>
                <%--------------------------%>
                <div class="row" id="Toledo">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Toledo/toledo1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">TOLEDO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Vuelve el Seat Toledo en 2012 en bella sinergia con el actual ADN de diseño Seat con una longitud de 4,48 metros.
                                Por su tamaño exterior y longitud de 4482 mm, clasificamos el Seat Toledo en la categoría de berlinas medianas.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Toledo/toledo2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Seat/Toledo/toledo3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Espacio interior de 5 plazas.</p>
                          </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <c:forEach items="${infoProveedor}" var="ip">
                    <div id="idObjetivos" class="col l6 m6 s12">
                        <div style="background-color: #5c6bc0; color:white; text-align:center;">
                           <i class="material-icons">call</i> Teléfono
                           
                        </div>
                        <div style=" color:#5c6bc0; text-align:center;">
                           ${ip[3]}
                        </div>
                    </div>
                    <div class="col l6 m6 s12">
                        <div style="background-color: #5c6bc0; color:white; text-align:center;">
                           <i class="material-icons">email</i> Email
                        </div>
                        <div style=" color:#5c6bc0; text-align:center;">
                            ${ip[2]}
                        </div>
                    </div>
                    </c:forEach>
                </div>
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
