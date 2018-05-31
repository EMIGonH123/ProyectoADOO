
<%@page import="Modelos.ServicioAdministradorLocal"%>
<%@page import="EntidadesADOO.Tipoauto"%>
<%@page import="EntidadesADOO.Automovilmarca"%>
<%@page import="EntidadesADOO.Empleadorenta"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! ServicioAdministradorLocal servicio;
%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioAdministradorLocal)contexto.lookup("java:global/ProyectoADOO/ServicioAdministrador!Modelos.ServicioAdministradorLocal");
    Empleadorenta empleado = (Empleadorenta)session.getAttribute("empleado");
    int id = empleado.getIdEmpleado();
    List<Empleadorenta> infoAdmin = servicio.getInfoAdministrador(id);
    List<Object> infoProveedores = servicio.getInfoProveedores();
    List<Object> infoSucursales = servicio.getInfoSucursales();
    List<Automovilmarca> infoMarcas = servicio.getMarcaDeAutos();
    List<Tipoauto> infoTipoAuto = servicio.getTipoDeAutos();
    List<Empleadorenta> infoEmpleados = servicio.getEmpleadosAsociadosAlAdministrador();
%>
<c:set scope="page" var="infoAdmin" value="<%=infoAdmin%>"/>
<c:set scope="page" var="infoMarcas" value="<%=infoMarcas%>"/>
<c:set scope="page" var="infoTipoAuto" value="<%=infoTipoAuto%>"/>
<c:set scope="page" var="infoEmpleados" value="<%=infoEmpleados%>"/>
<c:set scope="page" var="infoProveedores" value="<%=infoProveedores%>"/>
<c:set scope="page" var="infoSucursales" value="<%=infoSucursales%>"/>

    
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <title>Administrador</title>
    </head>

    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>
        
        
        <c:if test="${not empty empleado}">
            

        <!--Aqui enpieza el Encabezado-->
        <section id="encabezado">
           
            <!----------------------------------------------->
            <!-- EDITAR AL ADMINISTRADOR POR ADMINISTRADOR -->
            <!----------------------------------------------->
            <div id="modalEditarAdministrador" class="modal">
                <div class="modal-content">
                    <h4 style="color: greenyellow; text-align: center;">Información</h4>
                    <c:forEach items="${infoAdmin}" var="ia">
                    <form action="ControlAdministrador.do"  method="POST" class="col s12 m12 l12">
                        
 
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
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col l4"></div>
                            <div class="col l4">
                                <button style="background-color: #a0f;" type="submit" name="btnControlador" value="editarAdministradorPorAdministrador" class="btn center">
                                Actualizar
                                </button>
                            </div>
                            <div class="col l4"></div>
                        </div>


                    </form>
                    </c:forEach>
                </div>
            </div>

            <!-------------------------------------->
            <!-- CREAR EMPLEADO POR ADMINISTRADOR -->
            <!-------------------------------------->
            <div id="crearEmpleadoPorAdministrador" class="modal">
                <div class="modal-content">
                    <h4 style="color: greenyellow; text-align: center;">Nuevo Empleado</h4>
                    
                    <form action="ControlAdministrador.do"  method="POST" class="col s12 m12 l12">
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
                              <i class="material-icons prefix">call</i>
                              <input id="tel" name="tel" type="text" class="validate">
                              <label for="tel">Telefono</label>
                            </div>
                            <div class="input-field col s8">
                              <i class="material-icons prefix">email</i>
                              <input id="email" name="email" type="text" class="validate">
                              <label for="email">Email</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="input-field col s6">
                              <i class="material-icons prefix">call</i>
                              <input id="numExterior" name="numExterior" type="text" class="validate">
                              <label for="numExterior">Número Exterior</label>
                            </div>
                            <div class="input-field col s6">
                              <i class="material-icons prefix">email</i>
                              <input id="numInterior" name="numInterior" type="text" class="validate">
                              <label for="numInterior">Número Interior</label>
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">assignment_ind</i>
                                <select name="tipo">
                                    <option value="1">Administrador</option>
                                    <option value="2">Agente de venta</option>
                                </select>
                                <label>Tipo de Empleado</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">add_shopping_cart</i>
                                <select name="idSucursal">
                                    <option value="1">Azcapotzalco</option>
                                    <option value="2">Centro</option>
                                    <option value="3">Santa Monica</option>
                                </select>
                              <label>Sucursal Asociada</label>
                            </div>
                            
                        </div>
                        <div class="row">
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
                            <div class="col l4"></div>
                            <div class="col l4">
                                <button style="background-color: #a0f;" type="submit" name="btnControlador" value="crearEmpleadoPorAdministrador" class="btn center">
                                Crear
                                </button>
                            </div>
                            <div class="col l4"></div>
                        </div>
                    </form>
                </div>
            </div>
            
            <!----------------------------------------->
            <!-- CREAR ADQUISICION POR ADMINISTRADOR -->
            <!----------------------------------------->
            <div id="crearAdquisicionPorAdministrador" class="modal">
                <div class="modal-content">
                    <h4 style="color: greenyellow; text-align: center;">Adquisición</h4>
                    
                    <form action="ControlAdministrador.do"  method="POST" class="col s12 m12 l12">
                        <div class="row">
                            <div class="input-field col s12 m12 l12">
                                <i class="material-icons prefix">folder_shared</i>
                                <select name="idProveedor">
                                    <c:forEach items="${infoProveedores}" var="idp">
                                        <option  value="${idp[0]}">${idp[1]}</option>
                                    </c:forEach>
                                </select>
                                <label>Proveedor</label>
                            </div>
                        </div>
                        <div class="row">    
                            <div class="input-field col s4">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="fecha" name="fecha" type="text" class="datepicker">
                                <label for="fecha">Fecha Adquisición</label>
                            </div>
                            
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select name="nombreAuto">
                                    <option>Jetta</option>
                                    <option>Golf</option>
                                    <option>Passat</option>
                                    <option>Bora</option>
                                    <option>Bocho</option>
                                </select>
                                <label>Automovil</label>
                            </div>                            
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_weak</i>
                                <select name="modeloAuto">
                                    <option>2007</option>
                                    <option>2008</option>
                                    <option>2009</option>
                                    <option>2010</option>
                                    <option>2011</option>
                                    <option>2012</option>
                                    <option>2013</option>
                                    <option>2014</option>
                                    <option>2015</option>
                                    <option>2016</option>
                                    <option>2017</option>
                                </select>
                                <label>Modelo Auto</label>
                            </div>
                        </div>
                        <div class="row">    
                            <div class="input-field col s4">
                                <i class="material-icons prefix">center_focus_weak</i>
                                <input id="unidadesAuto" name="unidadesAuto" type="text" class="validate">
                                <label for="unidadesAuto">Cantidad</label>
                            </div>
                            <div class="input-field col s4" >
                                <i class="material-icons prefix">folder_shared</i>
                                <c:forEach items="${infoAdmin}" var="ia">
                                <input readonly="readonly" value="${ia[0]}" id="idAdministrador" name="idAdministrador" type="text" class="validate">
                                <label for="idAdministrador">IdAdministrador</label>
                                </c:forEach>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_weak</i>
                                <select name="kilometraje">
                                    <option value="1">Menor a 100000</option>
                                    <option value="2">Entre 100000-200000</option>
                                    <option value="3">Entre 200000-250000</option>
                                    <option value="4">Mas de 250000</option>
                                </select>
                                <label>Kilometraje</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select name="colorAuto">
                                    <option>Azul Marino</option>
                                    <option>Blanco</option>
                                    <option>Gris</option>
                                    <option>Negro</option>
                                    <option>Rojo</option>
                                </select>
                                <label>Color de Auto</label>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select name="idMarca">
                                    <c:forEach items="${infoMarcas}" var="im">
                                        <option value="${im[0]}">${im[1]}</option>
                                    </c:forEach>
                                </select>
                                <label>Marca</label>
                            </div>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select name="idSucursal">
                                    <option value="1">Azcapotzalco</option>
                                    <option value="2">Centro</option>
                                    <option value="3">Santa Monica</option>
                                </select>
                                <label>Sucursal</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_strong</i>
                                <select name="idTipo">
                                    <c:forEach items="${infoTipoAuto}" var="ita">
                                        <option value="${ita[0]}">${ita[1]}</option>
                                    </c:forEach>
                                </select>
                                <label>Tipo Auto</label>
                            </div>
                            <%--<div class="input-field col s4">
                                <i class="material-icons prefix">hdr_weak</i>
                                <input id="matricula" name="matricula" type="text" class="validate">
                                <label for="matricula">Matricula</label>
                            </div>--%>
                            <div class="input-field col s4">
                                <i class="material-icons prefix">hdr_weak</i>
                                <select name="capacidad">
                                    <option value="2">Deportivo</option>
                                    <option value="5">Normal</option>
                                    <option value="8">Familiar</option>
                                </select>
                                <label for="capacidad">Capacidad Pasajeros</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col l4"></div>
                            <div class="col l4">
                                <button type="submit" name="btnControlador" style="background-color:#a0f; color:white;" value="crearAdquisicionPorAdministrador" class="btn center">
                                Crear
                                </button>
                            </div>
                            <div class="col l4"></div>
                        </div>

                    </form>
                </div>
            </div>
            
            
            
            
            <div class="fixed-action-btn vertical">
                <a class="btn-floating btn-large blue pulse">
                  <i class="large material-icons">dashboard</i>
                </a>
                <ul>
                  <c:forEach items="${infoAdmin}" var="ia">
                  <li>
                    <a class="btn-floating red btn" href="ControlAdministrador.do?btnControlador=borrarAdministradorPorAdministrador&idAdministrador=${ia[0]}">
                          <i class="material-icons">delete</i>
                    </a>
                  </li>
                  </c:forEach>
                  <li>
                        <a class="btn-floating yellow waves-effect waves-light btn modal-trigger" href="#modalEditarAdministrador">
                            <i class="material-icons">mode_edit</i>
                        </a>
                  </li>
                </ul>
            </div>
            
            <div class="container row">
                <div class="col s12 m12 l12">
                    <nav>
                        <div class="nav-wrapper" style="background-color:#a0f; color:white;">
                            <c:forEach items="${infoAdmin}" var="ia">
                            <a class="brand-logo" style="margin-left: 20px;"><b>Bienvenido ${ia[1]}</b></a>
                            </c:forEach>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
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
                        <c:forEach items="${infoAdmin}" var="ia">
                            <div class="card small">
                                <c:if test="${ia[15] == 'M'}">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator responsive-img" src="Images/General/usuario01.png">
                                    </div>
                                </c:if>
                                <c:if test="${ia[15] == 'F'}">
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
                            <c:forEach items="${infoAdmin}" var="ia">
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
                                        ${ia[13]}
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
                        
                        <a href="#crearEmpleadoPorAdministrador" style="background-color:#a0f; color:white;" class="waves-effect btn modal-trigger">
                            Crear Empleado
                        </a><br><br>
                        <a href="#crearAdquisicionPorAdministrador" style="background-color:#a0f; color:white;" class="waves-effect btn modal-trigger">
                            Crear Adquisicion
                        </a>
                    </div>
                    
                    <div class="col l4 m4 s12">
                        <h5 style="text-align:center; color:greenyellow;"><b>Sucursales</b></h5>
                        <c:forEach items="${infoSucursales}" var ="is">
                            <b style="color:#a0f;">${is[1]}</b><br>
                            <b style="color:#000;">Estado: </b>${is[2]} <br>
                            <b style="color:#000;">Colonia: </b>${is[3]} <br>
                            <b style="color:#000;">Telefono: </b>${is[6]} <br>                                                  
                            <a href="ControlSesiones.do?btnControlador=visitarSucursal&idSucursal=${is[0]}"><b style="text-align:center;">Visitar</b></a><br><br>
                        </c:forEach>
                    </div>                        
                    
                    
                    <div class="col l4 m6 s12">
                        <h5 style="text-align:center; color:greenyellow;"><b>Empleados Asociados</b></h5>
                        <table class="highlight centered responsive-table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${infoEmpleados}" var="ie">
                                    <tr>
                                        <td>
                                            <a href="ControlAdministrador.do?btnControlador=verEmpleadoPorAdministrador&idEmpleado=${ie[0]}">${ie[1]}</a>
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
                <div class="row">
                    <div class="col s12 m6 l6">
                        <h5 style="color: greenyellow; text-align: center;"><b>Adquisiciones</b></h5>
                        <ul class="collapsible" data-collapsible="accordion">
                            <c:forEach items="${infoAdquisiciones}" var="iaq">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">archive</i>Por: ${iaq[6]}</div>
                                <div class="collapsible-body">
                                    <span>
                                        <b style="color:#a0f;">Fecha de Adquisicion:</b> ${iaq[0]}<br>
                                        <b style="color:#a0f;">Nombre Auto:</b> ${iaq[1]}<br>
                                        <b style="color:#a0f;">Modelo Auto:</b> ${iaq[2]}<br>
                                        <b style="color:#a0f;">Unidades Auto:</b> ${iaq[3]}<br>
                                        <b style="color:#a0f;">Precio Unitario:</b> ${iaq[5]}<br>
                                        <b style="color:#a0f;">Precio Total:</b> ${iaq[4]}<br>
                                    </span>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>    
                    </div>
                    <div class="col s12 m6 l6">
                        <h5 style="color: greenyellow; text-align: center;"><b>Proveedores</b></h5>                        
                        <ul class="collapsible" data-collapsible="accordion">
                        <c:forEach items="${infoProveedores}" var="ip">
                            <li>
                                <div class="collapsible-header">
                                    <i class="material-icons">account_balance</i>
                                    ${ip[1]}
                                </div>
                                <div class="collapsible-body">
                                    <b style="color:#a0f;">Email: </b> ${ip[2]}<br>
                                    <b style="color:#a0f;">Telefono: </b> ${ip[3]}<br>
                                    
                                    <a href="Controlador.do?btnControlador=editarProveedor&idProveedor=${ip[0]}">
                                        <i class="material-icons">
                                            create
                                        </i>
                                    </a>
                                    <a href="Controlador.do?btnControlador=borrarProveedor&idProveedor=${ip[0]}">
                                        <i class="material-icons">
                                            delete
                                        </i>
                                    </a>
                                </div>
                            </li>
                        </c:forEach>
                        </ul>

                    </div>
                </div>
            </div>
        </section>
        
        <!--Aqui enpieza el Footer-->
        <section id="pie">
            <div class="row">
                <div class="col l12 m12 s12">
                    <footer class="page-footer" style="background-color:#a0f; color:white;">
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
            <meta http-equiv="refresh" content="3;url=index.jsp">
        </c:if>
    </body>
</html>