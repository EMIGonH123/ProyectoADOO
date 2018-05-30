

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
                                <li class="tab"><a class="active" href="#Elantra">Elantra</a></li>
                                <li class="tab"><a class="active" href="#Kona">Kona</a></li>
                                <li class="tab"><a class="active" href="#I30-N">I30-N</a></li>
                                <li class="tab"><a class="active" href="#I30-Fastback">I30-Fastback</a></li>
                                <li class="tab"><a class="active" href="#I40">I40</a></li>
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
                <%----------------------------%>
                <%-- IMAGENES DE AUTO Elantra --%>
                <%----------------------------%>
                <div class="row" id="Elantra">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/Elantra/elantra1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">ELANTRA<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>La sexta generación del Hyundai Elantra se presenta en 2016 con un diseño contemporáneo y orientado al conductor.
                                Por su tamaño exterior y longitud de 4570 mm, clasificamos el Hyundai Elantra en la categoría de berlinas medianas.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/Elantra/elantra2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/Elantra/elantra3.png">
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
               
                <%----------------------------%>
                <%-- IMAGENES DE AUTO Kona --%>
                <%----------------------------%>
               <div class="row" id="Kona">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/Kona/kona1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">KONA<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Hyundai entra en el segmento B-SUV con el nuevo Hyundai Kona 2018 de diseño audaz y vanguardista para los conductores urbanos modernos.
                                Por su tamaño, características, altura libre al suelo de 17 cm y longitud de 4165 mm, clasificamos el Hyundai Kona en la categoría de crossover pequeños.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/Kona/kona2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/Kona/kona3.png">
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
               
               
                <%----------------------------%>
                <%-- IMAGENES DE AUTO I30-N --%>
                <%----------------------------%>
                <div class="row" id="I30-N">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i30N/i30n1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">I30-N<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con una imagen potente y deportiva, el Hyundai i30 N 2018 es el primer vehículo de altas prestaciones de Hyundai bajo la línea N.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i30N/i30n2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i30N/i30n3.png">
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
                
                
                <%-----------------------------------%>
                <%-- IMAGENES DE AUTO I30-Fastback --%>
                <%-----------------------------------%>
                <div class="row" id="I30-Fastback">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">I30-Fastback<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>El nuevo Hyundai i30 Fastback 2018 es la última incorporación a la gama i30 con un diseño elegante de coupé 5 puertas y una experiencia de conducción más dinámica.
                                Por su tamaño exterior y longitud de 4455 mm, clasificamos el Hyundai i30 Fastback en la categoría de berlinas medianas.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback3.png">
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
                <%-- IMAGENES DE AUTO I40 --%>
                <%--------------------------%>
                <div class="row" id="I40">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i40/i401.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">I40<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Renovado y totalmente estilizado, el Hyundai i40 2015 tiene una longitud de 4,75 metros. 
                                Por su tamaño exterior y longitud de 4745 mm, clasificamos el Hyundai i40 en la categoría de berlinas grandes.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i40/i402.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Hyundai/i40/i403.png">
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
