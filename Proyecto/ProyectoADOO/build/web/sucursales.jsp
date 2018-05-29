

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
                            
                        </div>
                    </nav>
                </div>
            </div>
        </section>
        
        <%--CONTENIDO DE LA PAGINA--%>
        <section id="encabezado">    
            <div class="container row">
                
            </div>
        </section>
        
        <%--PIE DE LA PAGINA--%>
        <section id="pie">
            <div class="row">
                <div class="col l12 m12 s12">
                    <footer class="page-footer" style="background-color:#5c6bc0; color:white;">
                        <div class="container row" style="background-image:url(Images/General/pie.jpg); " >
                            <div class="col l4 m6 s12" id="contorno" >
                                <p>	
                                    <h5><b>Enlaces</b></h5>
                                    Declaración de Accesibilidad<br>
                                    Política de privacidad<br>
                                    Términos y Condiciones<br>
                                    Marco Jurídico<br>
                                    Portal de Obligaciones de Transparencia <br>
                                    Sistema Infomex <br>
                                    INAI<br>
                                    Mapa de sitio<br>
                                </p>
                            </div>

                            <div class="col l4 m6 s12" id="contorno">
                                <p>
                                    <h5>¿QUÉ ES GOB.MX? </h5>
                                    Es el portal único de trámites, 
                                    información y participación ciudadana. 
                                    Leer más <br><br>
                                    <b><span id="hoverable" >English</span> </b><br>
                                    <b><span> Temas </span></b><br>
                                    <b><span>Reformas </span></b><br>
                                </p>
                            </div>

                            <div class="col l4 m12 s12"  id="contorno">
                                <p>
                                    <h5>CONTACTO</h5>
                                    Mesa de ayuda: dudas e información <br><br>
                                    <em>gobmx@funcionpublica.gob.mx</em><br><br>
                                    <i>Denuncia contra servidores públicos</i> <br>
                                </p>
                            </div>
                        </div>


                        <div class="footer-copyright">
                            <div class="container">
                                <p style="text-align: center;"> © 2017 Copyright <b>PRESTAUTOS</b> </p>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </section>
    </body>
</html>
