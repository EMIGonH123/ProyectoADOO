

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
                                <li class="tab"><a class="active" href="#Niro">Niro</a></li>
                                <li class="tab"><a class="active" href="#Proceed">Proceed</a></li>
                                <li class="tab"><a class="active" href="#Rio">Rio</a></li>
                                <li class="tab"><a class="active" href="#Sorento">Sorento</a></li>
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
                <%-- IMAGENES DE AUTO Elandra --%>
                <%----------------------------%>
                <div class="row" id="Niro">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Niro/niro1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">NIRO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Iformación</span>
                            <p>El nuevo Kia Niro 2017 es un crossover híbrido de exterior compacto y interior espacioso de 4,36 metros de longitud. 
                                Por su tamaño, características, altura libre al suelo de 16 cm y longitud de 4355 mm, clasificamos el Kia Niro en la categoría de SUV compactos.
                                Compara el Kia Niro con otros híbridos de tamaño similar. El modelo híbrido enchufable recibe el nombre de Niro PHEV.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Niro/niro2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Niro/niro3.png">
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
                <%-- IMAGENES DE AUTO Sorento --%>
                <%----------------------------%>
               <div class="row" id="Sorento">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Sorento/sorento1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">SORENTO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>El espacioso interior permite que hasta 7 personas viajen en el Kia Sorento 2015 con comodidad.
                                Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4780 mm, clasificamos el Kia Sorento en la categoría de SUV grandes y todoterrenos.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Sorento/sorento2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Sorento/sorento3.png">
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
                <%-- IMAGENES DE AUTO RIO --%>
                <%--------------------------%>
                <div class="row" id="Rio">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Rio/rio1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">RIO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Espacioso, práctico y polivalente, el Kia Rio 2017 ofrece una capacidad de maletero de 325 litros respecto a los 288 litros del modelo de 2015.
                                Por su tamaño exterior y longitud de 4065 mm, clasificamos el Kia Rio en la categoría de coches utilitarios.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Rio/rio2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Rio/rio3.png">
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
                
                
                <%------------------------------%>
                <%-- IMAGENES DE AUTO PROCEED --%>
                <%------------------------------%>
                <div class="row" id="Proceed">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Proceed/proceed1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Pro_cee'd<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con silueta dinámico, el Kia pro_cee'd 2016 es la versión 3 puertas y 4 centímetros más bajo que el cee'd de 5 puertas.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Proceed/proceed2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/KIA/Proceed/proceed3.png">
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
