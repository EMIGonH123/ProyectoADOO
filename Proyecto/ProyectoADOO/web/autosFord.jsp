

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
                                    <li class="tab"><a class="active" href="#CMAX">C-MAX</a></li>
                                    <li class="tab"><a class="active" href="#Fiesta">Fiesta</a></li>
                                    <li class="tab"><a class="active" href="#KA">KA</a></li>
                                    <li class="tab"><a class="active" href="#Mondeo">Mondeo</a></li>
                                    <li class="tab"><a class="active" href="#Mustang">Mustang</a></li>
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
                <%-- IMAGENES DE AUTO C-MAX --%>
                <%----------------------------%>
               <div class="row" id="CMAX">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/CMAX/cmax1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">C-MAX<i class="material-icons right">more_vert</i></span>
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Ford renueva el C-MAX y Grand C-MAX con espacio cómodo y flexible para 5 personas en el primero y 5 o 7 personas en el segundo, manteniendo sus longitudes en 4,38 y 4,52 metros respectivamente.
                                Por su flexibilidad interior, optimización del espacio y altura de 1610 mm, clasificamos el Ford C-MAX en la categoría de monovolúmenes.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/CMAX/cmax2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/CMAX/cmax3.png">
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
                <%-- IMAGENES DE AUTO FIESTA --%>
                <%----------------------------%>
               <div class="row" id="Fiesta">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Fiesta/fiesta1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">FIESTA<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con un diseño aerodinámico 7 centímetros más largo, el Ford Fiesta 2017 se moderniza con más tecnología y ofrece más espacio para las piernas, tanto delante como detrás.
                                Por su tamaño exterior y longitud de 4040 mm, clasificamos el Ford Fiesta en la categoría de coches utilitarios.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Fiesta/fiesta2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Fiesta/fiesta3.png">
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
               
               
                <%-------------------------%>
                <%-- IMAGENES DE AUTO KA --%>
                <%-------------------------%>
                <div class="row" id="KA">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/KA/ka1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">FIESTA<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con un diseño aerodinámico 7 centímetros más largo, el Ford Fiesta 2017 se moderniza con más tecnología y ofrece más espacio para las piernas, tanto delante como detrás.
                                Por su tamaño exterior y longitud de 4040 mm, clasificamos el Ford Fiesta en la categoría de coches utilitarios.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/KA/ka2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/KA/ka3.png">
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
                <%-- IMAGENES DE AUTO MONDEO --%>
                <%----------------------------%>
                <div class="row" id="Mondeo">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Mondeo/mondeo1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">MONDEO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con nuevo frontal, diseño innovador y ingeniería de precisión, el Ford Mondeo 2015 mide 4,87 metros de longitud.
                                Por su tamaño exterior y longitud de 4871 mm, clasificamos el Ford Mondeo en la categoría de berlinas grandes.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Mondeo/mondeo2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Mondeo/mondeo3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Inforamación</span>
                            <p>Espacio interior de 5 plazas.</p>
                          </div>
                        </div>
                    </div>
                </div>
                
                
                <%------------------------------%>
                <%-- IMAGENES DE AUTO MUSTANG --%>
                <%------------------------------%>
                <div class="row" id="Mustang">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Mustang/mustang1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">MUSTANG<i class="material-icons right">more_vert</i></span>
                           
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>También disponible en carrocería descapotable, el Ford Mustang se actualiza en 2018 manteniendo sus medidas exteriores.
                                Por su mecánica de altas prestaciones y altura de 1381 mm, clasificamos el Ford Mustang en la categoría de coches deportivos.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Mustang/mustang2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Ford/Mustang/mustang3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Espacio interior de 4 plazas.</p>
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
