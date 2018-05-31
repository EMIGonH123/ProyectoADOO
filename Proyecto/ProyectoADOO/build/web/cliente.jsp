
<%@page import="Modelos.ServicioClienteLocal"%>
<%@page import="EntidadesADOO.Clienterenta"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServicioClienteLocal servicio;%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioClienteLocal)contexto.lookup("java:global/ProyectoADOO/ServicioCliente!Modelos.ServicioClienteLocal");
    Clienterenta cliente = (Clienterenta)session.getAttribute("cliente");
    int idCliente = cliente.getIdCliente();
    List<Clienterenta> infoCliente = servicio.getInfoCliente(idCliente);
%>
<c:set scope="page" var="infoCliente" value="<%=infoCliente%>" />
<!DOCTYPE html>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <title>Cliente</title>
    </head>

    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>        
        <c:if test="${not empty cliente}">
        <!--Encabezado de la pagina-->
        <section id="encabezado">
            <div class="container" >
                <div class="row">
                    <nav>
                        <div class="nav-wrapper" style="background-color: #ff5722; color:white;">
                            <a class="brand-logo" style="margin-left: 20px;"><b>Cliente ${cliente.nombreCliente}</b></a>
                            <ul class="right hide-on-med-and-down">
                               <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </section>
        
        <!--Cuerpo de la pagina-->
        <section id="contenidos">
            <div class="container" >
                <div class="row">
                    <div class="col s12 m4 l4">
                        <h5 style="text-align:center; color:greenyellow;"><b>Rentas</b></h5>
                        
                    </div>
                    <div class="col s12 m4 l4">
                        <h5 style="text-align:center; color:greenyellow;"><b>Información</b></h5>
                        <c:forEach items="${infoCliente}" var="ic">
                            <div class="card small">
                                <c:if test="${ic[16] == 'M'}">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator responsive-img" src="Images/General/usuario01.png">
                                    </div>
                                </c:if>
                                <c:if test="${ic[16] == 'F'}">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator responsive-img" src="Images/General/usuario02.png">
                                    </div>
                                </c:if>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4">
                                        Mas Información
                                        <i class="material-icons small"></i>
                                    </span>
                                    <p><a href="#" style="color:greenyellow"><b>Perfil Propio</b></a></p>
                                </div>

                                <div class="card-reveal">
                                    <span class="card-title grey-text text-darken-4">
                                        <p style="color:greenyellow;">Datos</p>
                                        <i class="material-icons small"></i>
                                    </span>
                                    <p>
                                        Here is some more information about this 
                                        product that is only revealed once clicked on.
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                        <ul class="collapsible" data-collapsible="accordion">
                            <c:forEach items="${infoCliente}" var="ic">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">account_circle</i>Nombre</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ic[2]} ${ic[3]} ${ic[4]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">location_on</i>Ubicación</div>
                                <div class="collapsible-body">
                                    <span>
                                        <b style="color:#ff5722;">Estado: </b>${ic[6]}<br>
                                        <b style="color:#ff5722;">Municipio: </b>${ic[7]}<br>
                                        <b style="color:#ff5722;">Colonia: </b>${ic[8]}<br>
                                        <b style="color:#ff5722;">Calle: </b>${ic[9]}<br>
                                        <b style="color:#ff5722;">#Exterior: </b>${ic[10]}<br>
                                        <b style="color:#ff5722;">#Interior: </b>${ic[11]}<br>
                                        
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">lock_open</i>Contraseña</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ic[15]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">call</i>Teléfono</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ic[13]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">email</i>Email</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ic[14]}
                                    </span>
                                </div>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="col s12 m4 l4">
                        <h5 style="text-align:center; color:greenyellow;"><b>Transacciones</b></h5>
                        <ul class="collapsible" data-collapsible="accordion">
                            <%--<c:forEach items="${infoTransaccion}" var="it">
                                <li>
                                    <div class="collapsible-header"><i class="material-icons">account_circle</i>#Transacción ${it[0]}</div>
                                    <div class="collapsible-body">
                                        <span>
                                            <b style="color: greenyellow;">Máximo Prestamo: </b>${it[1]}<br>
                                            <b style="color: greenyellow;">Saldo: </b>${it[2]}<br>
                                            <b style="color: greenyellow;">Cuenta: </b>${it[3]}<br>
                                            <b style="color: greenyellow;">Monto: </b>${it[4]}<br>
                                            <b style="color: greenyellow;">Fecha: </b>${it[5]}<br>
                                            <b style="color: greenyellow;">STT: </b>${it[6]}<br>
                                            <b style="color: greenyellow;">Tipo: </b>${it[7]}<br>
                                            <b style="color: greenyellow;">Interes: </b>${it[8]}<br>
                                            <b style="color: greenyellow;">Tipo: </b>${it[9]}<br>
                                            <b style="color: greenyellow;">Nombre: </b>${it[10]}<br>
                                        </span>
                                    </div>
                                </li>
                            </c:forEach>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        
                        
          <!-- Modal Structure -->
        <div id="modalEdita" class="modal">
            <div class="modal-content">
                <h4 style="color: greenyellow; text-align: center;">Información</h4>
                <c:forEach items="${infoCliente}" var="ic">
                <form action="ControlCliente.do"  method="POST" class="col s12 m12 l12">
                    <div class="row">
                        <div class="input-field col s6">
                          <i class="material-icons prefix">my_location</i>
                          <input value="${ic[6]}" id="estado" name="estado" type="text" class="validate">
                          <label for="estado">Estado</label>
                        </div>
                        <div class="input-field col s6">
                          <i class="material-icons prefix">nature</i>
                          <input value="${ic[7]}" id="municipio" name="municipio" type="text" class="validate">
                          <label for="municipio">Municipio</label>
                        </div>
                    </div>
                    
                    <div class="row">    
                        <div class="input-field col s6">
                          <i class="material-icons prefix">nature_people</i>
                          <input value="${ic[8]}" id="colonia" name="colonia" type="text" class="validate">
                          <label for="colonia">Colonia</label>
                        </div>
                    
                        <div class="input-field col s6">
                          <i class="material-icons prefix">location_on</i>
                          <input value="${ic[9]}" id="calle" name="calle" type="text" class="validate">
                          <label for="calle">Calle</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">email</i>
                            <input value="${ic[14]}" id="email" name="email" type="text" class="validate">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field col s6">
                          <i class="material-icons prefix">lock_open</i>
                          <input value="${ic[15]}" id="pass" name="pass" type="text" class="validate">
                          <label for="pass">Contraseña</label>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">call</i>
                            <input value="${ic[13]}" id="tel" name="tel" type="text" class="validate">
                            <label for="tel">Telefono</label>
                        </div>
                        <div class="input-field col s6">
                          <i class="material-icons prefix">markunread_mailbox</i>
                          <input value="${ic[12]}" id="cp" name="cp" type="text" class="validate">
                          <label for="cp">Código Postal</label>
                        </div>
                    </div>    
                    <div class="row">    
                        <div class="input-field col s6">
                            <i class="material-icons prefix">center_focus_weak</i>
                            <input value="${ic[10]}" id="numExterior" name="numExterior" type="text" class="validate">
                            <label for="numExterior">#Exterior</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">center_focus_strong</i>
                            <input value="${ic[11]}" id="numInterior" name="numInterior" type="text" class="validate">
                            <label for="numInterior">#Interior</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4" >
                            <i class="material-icons prefix">center_focus_strong</i>
                            <input readonly="readonly" value="${ic[0]}" id="idCliente" name="idCliente" type="text" class="validate">
                            <label for="idCliente">Identificador</label>                       
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4"></div>
                        <div class="col s4">
                            <button style="background-color:#1976D2; " type="submit" name="btnControlador" value="editarClientePorCliente" class="btn center">
                            Actualizar
                            </button>
                        </div>
                        <div class="col s4"></div>
                    </div>
                </form>
                </c:forEach>
            </div>
        </div>                
                        
        <!--Pie de la pagina-->
        <section id="pie">
            <div class="row">
                <div class="col l12 m12 s12">
                    <div class="fixed-action-btn vertical">
                        <a class="btn-floating btn-large blue pulse">
                            <i class="large material-icons">dashboard</i>
                        </a>
                        <ul>
                            <li>
                                <a class="btn-floating yellow waves-effect btn modal-trigger" href="#modalEdita">
                                    <i class="material-icons">mode_edit</i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    
                    <footer class="page-footer" style="background-color: #ff5722; color:white;">
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
        </c:if>
        <c:if test="${empty cliente}">
            Error, No existe Sesion
            <meta http-equiv ="refresh" content="3;URL=index.jsp">
        </c:if>
    </body>
</html>

