

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
                                    <li class="tab"><a class="active" href="#Jetta">Jetta</a></li>
                                    <li class="tab"><a class="active" href="#Golf">Golf</a></li>
                                    <li class="tab"><a class="active" href="#Passat">Passat</a></li>
                                    <li class="tab"><a class="active" href="#Polo">Polo</a></li>
                                    <li class="tab"><a class="active" href="#Beetle">Beetle</a></li>
                                    <li class="tab"><a class="active" href="#Scirocco">Scirocco</a></li>
                                    <li class="tab"><a class="active" href="#Touran">Touran</a></li>
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
                <div class="row" id="Jetta">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Jetta/jetta1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">JETTA<i class="material-icons right">more_vert</i></span>
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Informacion </span>
                            <p>El Volkswagen Jetta 2015 es una berlina de proporciones equilibradas con una imagen elegante y deportiva.
                                    Por su tamaño exterior y longitud de 4659 mm, clasificamos el Volkswagen Jetta en la categoría de berlinas 
                            </p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card " >
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Jetta/jetta2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadero.<i class="material-icons right">more_vert</i></span>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Jetta/jetta3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Informacion </span>
                            <p> Espacio interior de 5 plazas
                            </p>
                          </div>
                        </div>
                    </div>
                </div>
                
                <%-------------------------%>
                <%--IMAGENES DE AUTO GOLF--%>
                <%-------------------------%>
                <div class="row" id="Golf">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Golf/golf1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">GOLF<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Con tecnología de última generación, el Volkswagen Golf se renueva en 2017 manteniendo sus medidas exteriores.
                                Por su tamaño exterior y longitud de 4258 mm, clasificamos el Volkswagen Golf en la categoría de coches compactos.
                                El modelo híbrido enchufable recibe el nombre de Golf GTE. El modelo eléctrico recibe el nombre de e-Golf.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Golf/golf2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Golf/golf3.png">
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
                
                <%-----------------------------%>
                <%--IMAGENES DE AUTO BEEATLE --%>
                <%-----------------------------%>
                <div class="row" id="Beetle">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Beeatle/beetle1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">BEETLE<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Volkswagen renueva el Beetle en 2016 con similares medidas exteriores y un nuevo frontal.
                                Por su tamaño exterior y longitud de 4288 mm, clasificamos el Volkswagen Beetle en la categoría de coches compactos.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Beeatle/beetle2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Beeatle/beetle3.png">
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
                
                
                <%----------------------------%>
                <%--IMAGENES DE AUTO PASSAT --%>
                <%----------------------------%>
                <div class="row" id="Passat">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Passat/passat1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">PASSAT<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>De aspecto impresionante y silueta larga con líneas limpias y elegantes, el Volkswagen Passat 2015 tiene una longitud de 4,77 metros.
                                Por su tamaño exterior y longitud de 4767 mm, clasificamos el Volkswagen Passat en la categoría de berlinas grandes. 
                                El modelo híbrido enchufable recibe el nombre de Passat GTE.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Passat/passat2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Passat/passat3.png">
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
                <%--IMAGENES DE AUTO POLO --%>
                <%--------------------------%>
                <div class="row" id="Polo">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Polo/polo1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">POLO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>La sexta generación del Volkswagen Polo es 8 centímetros más larga, 7 centímetros más ancha y tiene un maletero de mayor capacidad.
                                Por su tamaño exterior y longitud de 4053 mm, clasificamos el Volkswagen Polo en la categoría de coches utilitarios.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Polo/polo2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Polo/polo3.png">
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
                <%--IMAGENES DE AUTO Scirocco --%>
                <%------------------------------%>
                <div class="row" id="Scirocco">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Sciroco/scirocco1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">SCIROCCO<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>La silueta dinámica con ambiciones deportivas del Volkswagen Scirocco 2014 es 1 cm más bajo y 1 cm más ancho.
                                Por su mecánica de altas prestaciones y altura de 1398 mm, clasificamos el Volkswagen Scirocco en la categoría de coches deportivos.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Sciroco/scirocco2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Sciroco/scirocco3.png">
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
                
                
                <%----------------------------%>
                <%--IMAGENES DE AUTO Touran --%>
                <%----------------------------%>
                <div class="row" id="Touran">
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Touran/touran1.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">TOURAN<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>El Volkswagen Touran 2016 combina las dimensiones compactas que requiere la conducción urbana con un habitáculo confortable y modulable para hasta 7 plazas.
                                Por su flexibilidad interior, optimización del espacio y altura de 1659 mm, clasificamos el Volkswagen Touran en la categoría de monovolúmenes.</p>
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card ">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Touran/touran2.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Salpicadera<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                        </div>
                    </div>
                    <div class="col l14 m4 s12">
                        <div class="card">
                          <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/Touran/touran3.png">
                          </div>
                          <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Espacio interior<i class="material-icons right">more_vert</i></span>
                            
                          </div>
                          <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                            <p>Espacio interior de hasta 7 plazas.</p>
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
