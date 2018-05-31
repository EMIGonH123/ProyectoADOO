<%@page import="Modelos.ServicioEmpleadoLocal"%>
<%@page import="EntidadesADOO.Clienterenta"%>
<%@page import="EntidadesADOO.Empleadorenta"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! ServicioEmpleadoLocal servicio;
%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioEmpleadoLocal)contexto.lookup("java:global/ProyectoADOO/ServicioEmpleado!Modelos.ServicioEmpleadoLocal");
    Empleadorenta empleado = (Empleadorenta)session.getAttribute("empleado");
    int id = empleado.getIdEmpleado();
    List<Object> infoSucursal = servicio.getInfoDeSucursalPorAdministrador(id);
    List<Empleadorenta> infoEmpleado = servicio.getInfoEmpleado(id);
    List<Clienterenta> clientes = servicio.getClientesAsociadosAlEmpleado(id);
    List<Object> idsAdmin = servicio.getIdsDeAdministradores();
%>
<c:set scope="page" var="infoSucursal" value="<%=infoSucursal%>"/>
<c:set scope="page" var="infoEmpleado" value="<%=infoEmpleado%>"/>
<c:set scope="page" var="idsAdmin" value="<%=idsAdmin%>"/>
<c:set scope="page" var="clientes" value="<%=clientes%>"/>
    
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <title>Empleado</title>
    </head>

    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>
        <c:if test="${not empty empleado}">
        <!--Aqui enpieza el Encabezado-->
        <section id="encabezado">
           
            <!-- MODALES PARA LOS BOTONES FLOTANTES -->
            <!---------------------------------->
            <!-- AGREGAR CLIENTE POR EMPLEADO -->
            <!---------------------------------->
            <div id="modalAgrega" class="modal modal-fixed-footer">
                <div class="modal-content">
                    <h3 style="color:greenyellow; text-align: center;">Nuevo Cliente</h3>
                    <form action="ControlEmpleado.do"  method="POST" class="col s12 m12 l12">
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">account_circle</i>
                              <input id="nombre" name="nombre" type="text" class="validate">
                              <label for="nombre">Nombre</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">hdr_strong</i>
                              <input id="apPaterno" name="apPaterno" type="text" class="validate">
                              <label for="apPaterno">Apellido Paterno</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">hdr_weak</i>
                              <input id="apMaterno" name="apMaterno" type="text" class="validate">
                              <label for="apMaterno">Apellido Materno</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">my_location</i>
                              <input id="estado" name="estado" type="text" class="validate">
                              <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">nature</i>
                              <input id="municipio" name="municipio" type="text" class="validate">
                              <label for="municipio">Municipio</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">nature_people</i>
                              <input id="colonia" name="colonia" type="text" class="validate">
                              <label for="colonia">Colonia</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">location_on</i>
                              <input id="calle" name="calle" type="text" class="validate">
                              <label for="calle">Calle</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">markunread_mailbox</i>
                              <input id="cp" name="cp" type="text" class="validate">
                              <label for="cp">Código Postal</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">lock_open</i>
                              <input id="pass" name="pass" type="password" class="validate">
                              <label for="pass">Contraseña</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">folder_shared</i>
                              <input id="rfc" name="rfc" type="text" class="validate">
                              <label for="rfc">RFC</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">call</i>
                              <input id="tel" name="tel" type="text" class="validate">
                              <label for="tel">Telefono</label>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">wc</i>
                                <select name="genero">
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                </select>
                                <label>Genero</label>
                            </div>
                            
                        </div>
                        
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">center_focus_weak</i>
                              <input value="${ia[8]}" id="numExterior" name="numExterior" type="text" class="validate">
                              <label for="numExterior">Número Exterior</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">center_focus_strong</i>
                              <input value="${ia[9]}" id="numInterior" name="numInterior" type="text" class="validate">
                              <label for="numInterior">Número Interior</label>
                            </div>
                            
                            <div class="input-field col s4">
                                <i class="material-icons prefix">folder_shared</i>
                                <select name="idEmpleado">
                                    <c:forEach items="${idsAdmin}" var="c">
                                        <option value="${c}">${c}</option>
                                    </c:forEach>
                                </select>
                                <label>Id Empleado</label>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="input-field col s12">
                              <i class="material-icons prefix">email</i>
                              <input id="email" name="email" type="text" class="validate">
                              <label for="email">Email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col l4"></div>
                            <div class="col l4">
                                <button style="background-color:#0059bc;" type="submit" name="btnControlador" value="crearClientePorEmpleado" class="btn">
                                Crear
                                </button>
                            </div>
                            <div class="col l4"></div>
                        </div>

                    </form>
                </div>  
            </div>
            
            <div id="modalEditaEmpleadoRenta" class="modal">
                <div class="modal-content">
                    <h4 style="color: greenyellow; text-align: center;">Información</h4>
                    <c:forEach items="${infoEmpleado}" var="ia">
                    <form action="ControlEmpleado.do"  method="POST" class="col s12 m12 l12"> 
                        <div class="row">    
                            <div class="input-field col s4">
                                <i class="material-icons prefix">account_circle</i>
                                <input value="${ia[1]}" id="nombreEmpleado" name="nombreEmpleado" type="text" class="validate">
                                <label for="nombreEmpleado">Nombre</label>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_strong</i>
                                <input value="${ia[2]}" id="numInterior" name="apPaterno" type="text" class="validate">
                                <label for="apPaterno">Apellido Paterno</label>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_weak</i>
                                <input value="${ia[3]}" id="apMaterno" name="apMaterno" type="text" class="validate">
                                <label for="apMaterno">Apellido Materno</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">my_location</i>
                              <input value="${ia[4]}" id="estado" name="estado" type="text" class="validate">
                              <label for="estado">Estado</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">nature</i>
                              <input value="${ia[5]}" id="municipio" name="municipio" type="text" class="validate">
                              <label for="municipio">Municipio</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">nature_people</i>
                              <input value="${ia[6]}" id="colonia" name="colonia" type="text" class="validate">
                              <label for="colonia">Colonia</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">location_on</i>
                              <input value="${ia[7]}" id="calle" name="calle" type="text" class="validate">
                              <label for="calle">Calle</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">markunread_mailbox</i>
                              <input value="${ia[10]}" id="cp" name="cp" type="text" class="validate">
                              <label for="cp">Código Postal</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">lock_open</i>
                              <input value="${ia[13]}" id="pass" name="pass" type="text" class="validate">
                              <label for="pass">Contraseña</label>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="input-field col s4">
                              <i class="material-icons prefix">call</i>
                              <input value="${ia[11]}" id="tel" name="tel" type="text" class="validate">
                              <label for="tel">Telefono</label>
                            </div>
                            <div class="input-field col s8">
                              <i class="material-icons prefix">email</i>
                              <input value="${ia[12]}" id="email" name="email" type="text" class="validate">
                              <label for="email">Email</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="input-field col s4">
                              <i class="material-icons prefix">center_focus_weak</i>
                              <input value="${ia[8]}" id="numExterior" name="numExterior" type="text" class="validate">
                              <label for="numExterior">Número Exterior</label>
                            </div>
                            <div class="input-field col s4">
                              <i class="material-icons prefix">center_focus_strong</i>
                              <input value="${ia[9]}" id="numInterior" name="numInterior" type="text" class="validate">
                              <label for="numInterior">Número Interior</label>
                            </div>
                            
                            <div class="input-field col s4" >
                                <i class="material-icons prefix">folder_shared</i>
                                <input readonly="readonly" value="${ia[0]}" id="idEmpleado" name="idEmpleado" type="text" class="validate">
                                <label for="idEmpleado">Identificador</label>                       
                            </div>
                        
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">wc</i>
                                <select name="genero">
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                </select>
                                <label>Genero</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col l4"></div>
                            <div class="col l4">
                                <button style="background-color: #0059bc;" type="submit" name="btnControlador" value="editarEmpleadoPorEmpleado" class="btn center">
                                Actualizar
                                </button>
                            </div>
                            <div class="col l4"></div>
                        </div>
                    </form>
                    </c:forEach>
                </div>
            </div>


            
            
            
            
            <div class="fixed-action-btn vertical">
                <a class="btn-floating btn-large blue pulse">
                  <i class="large material-icons">dashboard</i>
                </a>
                <ul>
                  <li><a class="btn-floating green waves-effect waves-light btn modal-trigger" href="#modalAgrega">
                            <i class="material-icons">person_add</i>
                      </a>
                  </li>
                  <c:forEach items="${infoEmpleado}" var="ia">
                  <li>
                    <a class="btn-floating red btn" href="ControlEmpleado.do?btnControlador=borrarEmpleadoPorEmpleado&idEmpleado=${ia[0]}">
                          <i class="material-icons">delete</i>
                    </a>
                  </li>
                  </c:forEach>
                  <li><a class="btn-floating yellow waves-effect waves-light btn modal-trigger" href="#modalEditaEmpleadoRenta">
                            <i class="material-icons">mode_edit</i>
                      </a>
                  </li>
                </ul>
            </div>
            
            <div class="container row">
                <div class="col s12 m12 l12" style="background-color: #022f42;">
                    <nav>
                        <div class="nav-wrapper" style="background-color: #022f42; color:white;">
                            <c:forEach items="${infoEmpleado}" var="ia">
                            <a class="brand-logo" style="margin-left: 20px;"><b>Bienvenido ${ia[1]}</b></a>
                            </c:forEach>
                            <ul class="right hide-on-med-and-down">
                                <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </section>
        
        <!--Aqui enpieza el Cuerpo principal-->
        <section id="contenidos">
            <div class="container">
                <div class="row">
                    <div class="col l4 m12 s12">
                        <c:forEach items="${infoEmpleado}" var="ie">
                            <div class="card small">
                                <c:if test="${ie[15] == 'M'}">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator responsive-img" src="Images/General/usuario01.png">
                                    </div>
                                </c:if>
                                <c:if test="${ie[15] == 'F'}">
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
                            <c:forEach items="${infoEmpleado}" var="ia">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">account_circle</i>Nombre</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ia[1]} ${ia[2]} ${ia[3]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">lock_open</i>Contraseña</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ia[5]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">location_on</i>Ubicación</div>
                                <div class="collapsible-body">
                                    <span>
                                        <b style="color:greenyellow;">Estado: </b>${ia[4]}<br>
                                        <b style="color:greenyellow;">Municipio: </b>${ia[5]}<br>
                                        <b style="color:greenyellow;">Colonia: </b>${ia[6]}<br>
                                        <b style="color:greenyellow;">Calle: </b>${ia[7]}<br>
                                        <b style="color:greenyellow;">#Exterior: </b>${ia[8]}<br>
                                        <b style="color:greenyellow;">#Interior: </b>${ia[9]}<br>
                                        
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">call</i>Teléfono</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ia[11]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">email</i>Email</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${ia[12]}
                                    </span>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    
                    <div class="col l4 m6 s12">
                        
                        <div class="card blue-grey darken-1">
                            <c:forEach items="${infoSucursal}" var ="is">
                            <div class="card-content white-text">
                                <span class="card-title"><h5 style="text-align:center;"><b>Sucursal</b></h5></span>
                                <h5>Información</h5>
                                
                                    <b>Nombre:</b> ${is[1]}<br>
                                    <b>Estado:</b> ${is[2]}<br>
                                    <b>Colonia:</b> ${is[3]}<br>
                                    <b>Calle:</b> ${is[4]}<br>
                                    <b>Codigo Postal:</b> ${is[5]}<br>
                                    <b>Telefono:</b> ${is[6]}<br>
                                
                            </div>
                            <div class="card-action">
                                <a href="ControlSesiones.do?btnControlador=visitarSucursal&idSucursal=${is[0]}"><b style="text-align:center;">Visitar</b></a>
                            </div>
                            </c:forEach>
                        </div>                        
                    </div>
                    
                    <div class="col l4 m6 s12">
                        <h5 style="text-align:center; color:greenyellow;"><b>Clientes asociados</b></h5>
                        <table class="highlight centered responsive-table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${clientes}" var="cliente">
                                    <tr>
                                        <td>
                                            <a href="ControlEmpleado.do?btnControlador=verClientePorEmpleado&idCliente=${cliente[0]}">${cliente[2]}</a>
                                            <i class="material-icons">create</i>
                                            <i class="material-icons">delete</i>                                            
                                            <i class="material-icons">perm_identity</i>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </section>
        
        <!--Aqui enpieza el Footer-->
        <section id="pie">
            <div class="row">
                <div class="col l12 m12 s12">
                    <footer class="page-footer" style="background-color: #022f42; color:white;">
                        <div class="container row" >
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
        <c:if test="${empty empleado}">
            Error, No existe Sesion
            <meta http-equiv ="refresh" content="3;URL=index.jsp">
        </c:if>
    </body>
</html>