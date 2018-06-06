
<%@page import="EntidadesADOO.Detallecuenta"%>
<%@page import="EntidadesADOO.Automovil"%>
<%@page import="EntidadesADOO.Clienterenta"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Modelos.ServicioCrudClienteLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%! ServicioCrudClienteLocal servicio;%>
<%
    InitialContext contexto = new InitialContext();
    servicio = (ServicioCrudClienteLocal)contexto.lookup("java:global/ProyectoADOO/ServicioCrudCliente!Modelos.ServicioCrudClienteLocal");
    Clienterenta cliente = (Clienterenta)session.getAttribute("cliente");
    if(cliente == null){
        request.setAttribute("msgRespuesta","No existe sesión para CrudCliente");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    int idCliente = cliente.getIdCliente();
    int idEmpleado = (int)cliente.getIdEmpleado();
    List<Clienterenta> infoCliente = servicio.getInfoCliente(idCliente);
    List<Automovil> infoAutos = servicio.getInfoDeAutosParaRentarAsociadosAlEmpleado(idEmpleado);
    List<Object> infoCuentas = servicio.getInfoCuentasDeCliente(idCliente);
    List<Detallecuenta> infoDetalleCuentas = servicio.getDetalleCuentasDeCliente(idCliente);
    List<Object> infoRentas = servicio.getInfoRentasCliente(idCliente);
%>
<c:set scope="page" var="infoCliente" value="<%=infoCliente%>" />
<c:set scope="page" var="idEmpleado" value="<%=idEmpleado%>" />
<c:set scope="page" var="infoAutos" value="<%=infoAutos%>" />
<c:set scope="page" var="infoCuentas" value="<%=infoCuentas%>" />
<c:set scope="page" var="infoRentas" value="<%=infoRentas%>" />
<c:set scope="page" var="infoDetalleCuentas" value="<%=infoDetalleCuentas%>"/>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <title>CRUDCliente</title>
    </head>
    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script> 
        
        
        <c:if test="${not empty cliente}">  
            
        <!-- MODALES PARA LOS BOTONES FLOTANTES -->
        <div id="despliegaTransacciones"></div>
        <!----------------------------------->
        <!-- MODIFICA CLIENTE POR EMPLEADO -->
        <!----------------------------------->
        <div id="modalEditaClientePorEmpleado" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h3 style="color:#64dd17; text-align: center;">Información</h3>
                <c:forEach items="${infoCliente}" var="ic">
                <form action="ControlEmpleado.do"  method="POST" class="col s12 m12 l12">
                    <div class="row">
                        <div class="input-field col s4">
                          <i class="material-icons prefix">account_circle</i>
                          <input value="${ic[2]}" id="nombre" name="nombre" type="text" class="validate">
                          <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">hdr_strong</i>
                          <input value="${ic[3]}" id="apPaterno" name="apPaterno" type="text" class="validate">
                          <label for="apPaterno">Apellido Paterno</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">hdr_weak</i>
                          <input value="${ic[4]}" id="apMaterno" name="apMaterno" type="text" class="validate">
                          <label for="apMaterno">Apellido Materno</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4">
                          <i class="material-icons prefix">my_location</i>
                          <input value="${ic[6]}" id="estado" name="estado" type="text" class="validate">
                          <label for="estado">Estado</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">nature</i>
                          <input value="${ic[7]}" id="municipio" name="municipio" type="text" class="validate">
                          <label for="municipio">Municipio</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">nature_people</i>
                          <input value="${ic[8]}" id="colonia" name="colonia" type="text" class="validate">
                          <label for="colonia">Colonia</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4">
                          <i class="material-icons prefix">location_on</i>
                          <input value="${ic[9]}" id="calle" name="calle" type="text" class="validate">
                          <label for="calle">Calle</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">markunread_mailbox</i>
                          <input value="${ic[12]}" id="cp" name="cp" type="text" class="validate">
                          <label for="cp">Código Postal</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">lock_open</i>
                          <input value="${ic[15]}" id="pass" name="pass" type="text" class="validate">
                          <label for="pass">Contraseña</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4">
                          <i class="material-icons prefix">folder_shared</i>
                          <input value="${ic[5]}" id="rfc" name="rfc" type="text" class="validate">
                          <label for="rfc">RFC</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">call</i>
                          <input value="${ic[13]}" id="tel" name="tel" type="text" class="validate">
                          <label for="tel">Telefono</label>
                        </div>
                        
                        <div class="input-field col s4">
                            <i class="material-icons prefix">folder_shared</i>
                            <input readonly="readonly" value="${idEmpleado}" id="idEmpleado" name="idEmpleado" type="text" class="validate" >
                          <label for="idEmpleado">Id Empleado</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s4">
                          <i class="material-icons prefix">center_focus_weak</i>
                          <input value="${ic[10]}" id="numExterior" name="numExterior" type="text" class="validate">
                          <label for="numExterior">Número Exterior</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">center_focus_strong</i>
                          <input value="${ic[11]}" id="numInterior" name="numInterior" type="text" class="validate">
                          <label for="numInterior">Número Interior</label>
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
                            <i class="material-icons prefix">folder_shared</i>
                            <input readonly="readonly" value="${ic[0]}" id="idCliente" name="idCliente" type="text" class="validate" >
                          <label for="idCliente">Id Cliente</label>
                        </div>
                        <div class="input-field col s8">
                          <i class="material-icons prefix">email</i>
                          <input value="${ic[14]}" id="email" name="email" type="text" class="validate">
                          <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col l4"></div>
                        <div class="col l4">
                            <button style="background-color:#64dd17;" type="submit" name="btnControlador" value="editarCRUDClientePorEmpleado" class="btn">
                            Actualizar
                            </button>                                
                        </div>
                        <div class="col l4"></div>
                    </div>

                </form>
                </c:forEach>
            </div>  
        </div>
        <!-------------------------------->
        <!-- AGREGAR RENTA POR EMPLEADO -->
        <!-------------------------------->
        <div id="modalCreaRentaDeCliente" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h3 style="color:#18ffff; text-align: center;">Nueva Renta</h3>
                <c:forEach items="${infoCliente}" var="ic">
                <form action="ControlEmpleado.do"  method="POST" class="col s12 m12 l12">
                    <div class="row">
                        <div class="input-field col s4">
                          <i class="material-icons prefix">account_circle</i>
                          <input readonly="readonly" id="idCliente" value="${ic[0]}" name="idCliente" type="text" class="validate">
                          <label for="idCliente">Id Cliente</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">hdr_strong</i>
                          <input id="fechaInicio" name="fechaInicio" type="text" class="validate datepicker">
                          <label for="fechaInicio">Fecha Inicio</label>
                        </div>
                        <div class="input-field col s4">
                          <i class="material-icons prefix">hdr_weak</i>
                          <input id="fechaFin" name="fechaFin" type="text" class="validate datepicker">
                          <label for="fechaFin">Fecha Fin</label>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="input-field col s4">
                            <i class="material-icons prefix">folder_shared</i>
                            <select name="matricula">
                                <c:forEach items="${infoAutos}" var="ia">
                                    <option value="${ia[0]}">${ia[1]}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="input-field col s4">
                            <i class="material-icons prefix">folder_shared</i>
                            <select name="idTipoPago">
                                <option value="1">Efectivo</option>
                                <option value="2">Tarjeta</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s8">
                          <i class="material-icons prefix">account_circle</i>
                          <input  id="descripcionRenta" name="descripcionRenta" type="text" class="validate">
                          <label for="descripcionRenta">Descripción</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col l4"></div>
                        <div class="col l4">
                            <button style="background-color: #18ffff;" type="submit" name="btnControlador" value="nuevaRentaCliente" class="btn">
                                Crear Renta
                            </button>
                        </div>
                        <div class="col l4"></div>
                    </div>
                </form>
                </c:forEach>
            </div>  
        </div>

        <!-------------------------------------------->
        <!-- AGREGAR CUENTA DE CLIENTE POR EMPLEADO -->
        <!-------------------------------------------->
        <div id="modalCreaCuentaDeCliente" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h3 style="color:#ff0; text-align: center;">Nueva Cuenta</h3>
                <c:forEach items="${infoCliente}" var="ic">
                    <form action="ControlEmpleado.do"  method="POST" class="col s12 m12 l12">
                        <div class="row">
                            <div class="input-field col s6">
                              <i class="material-icons prefix">account_circle</i>
                              <input readonly="readonly" id="idCliente" value="${ic[0]}" name="idCliente" type="text" class="validate">
                              <label for="idCliente">Id Cliente</label>
                            </div>
                            <div class="input-field col s6">
                              <i class="material-icons prefix">credit_card</i>
                              <input id="numCuenta" name="numCuenta" type="text" class="validate">
                              <label for="numCuenta">Número Cuenta</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                              <i class="material-icons prefix">insert_invitation</i>
                              <input  id="diasLimitePago" name="diasLimitePago" type="text" class="validate">
                              <label for="diasLimitePago">Dias para pagar</label>
                            </div>
                            <div class="input-field col s6">
                              <i class="material-icons prefix">attach_money</i>
                              <input  id="monto" name="monto" type="text" class="validate">
                              <label for="monto">Prestamo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                              <i class="material-icons prefix">local_offer</i>
                              <input  id="descripcionCuenta" name="descripcionCuenta" type="text" class="validate">
                              <label for="descripcionCuenta">Descripción</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col l3"></div>
                            <div class="col l6">
                                <button style="background-color: #ff0;" type="submit" name="btnControlador" value="nuevaCuentaCRUDCliente" class="btn">
                                    Crear Cuenta
                                </button>
                            </div>
                            <div class="col l3"></div>
                        </div>

                    </form>
                </c:forEach>
            </div>  
        </div>
        
        <!---------------------------------------------------->
        <!-- AGREGAR NUEVO PRESTAMO DE CLIENTE POR EMPLEADO -->
        <!---------------------------------------------------->
        <div id="modalCreaPrestamoDeCliente" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h3 style="color:#ff0; text-align: center;">Nueva Prestamo</h3>
                <c:forEach items="${infoCliente}" var="ic">
                    <form action="ControlEmpleado.do"  method="POST" class="col s12 m12 l12">
                        <div class="row">
                            <div class="input-field col s6">
                              <i class="material-icons prefix">credit_card</i>
                              <select name="numCuenta">
                                <c:forEach items="${infoCuentas}" var="ic">
                                    <option value="${ic[0]}">${ic[0]}</option>
                                </c:forEach>
                              </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                              <i class="material-icons prefix">insert_invitation</i>
                              <input  id="diasLimitePago" name="diasLimitePago" type="text" class="validate">
                              <label for="diasLimitePago">Dias para pagar</label>
                            </div>
                            <div class="input-field col s6">
                              <i class="material-icons prefix">attach_money</i>
                              <input  id="monto" name="monto" type="text" class="validate">
                              <label for="monto">Prestamo</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col l3"></div>
                            <div class="col l6">
                                <button style="background-color: #ff0;" type="submit" name="btnControlador" value="nuevoPrestamoCRUDCliente" class="btn">
                                    Crear Prestamo
                                </button>
                            </div>
                            <div class="col l3"></div>
                        </div>

                    </form>
                </c:forEach>
            </div>  
        </div>
        
        <!--Encabezado de la pagina-->
        <section id="encabezado">
            <div class="container" >
                <div class="row">
                    
                    <nav class="nav-extended">
                        <div class="nav-wrapper" style="background-color: #00E676; color:white;">
                            <c:forEach items="${infoCliente}" var="ic">    
                                <a class="brand-logo" style="margin-left: 20px;">
                                    <b>
                                        Cliente ${ic[2]}
                                    </b>
                                </a>
                            </c:forEach>
                            <ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="salir.jsp">Salir</a></li>
                            </ul>
                        </div>
                        <div class="nav-content" style="background-color:#00E676; color:white;">
                            <ul class="tabs tabs-transparent">
                                <li class="tab"><a class="active" href="#rentas">Rentas</a></li>
                                <li class="tab"><a href="#cuentas">Cuentas</a></li>
                                 <li class="tab"><a onclick="Materialize.toast('<%=request.getAttribute("msgRespuesta")%>', 4000,'rounded')">Respuesta</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </section>
                                
        <section id="contenido">
            <div class="container">
                <div class="row">
                    <div class="col s12 m4 l4">
                        
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
                                        ${ic[2]}
                                    </span>
                                    <p><a href="ControlSesiones.do?btnControlador=verClienteDesdeCrud&idCliente=${ic[0]}&pass=${ic[15]}">Perfil propio</a></p>
                                </div>
                            </div>
                        </c:forEach>
                        
                        <ul class="collapsible" data-collapsible="accordion">
                            <c:forEach items="${infoCliente}" var="c">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">account_circle</i>Nombre</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${c[2]} ${c[3]} ${c[4]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">location_on</i>Ubicación</div>
                                <div class="collapsible-body">
                                    <span>
                                        <b style="color:#00E676;">Estado: </b>${c[6]}<br>
                                        <b style="color:#00E676;">Municipio: </b>${c[7]}<br>
                                        <b style="color:#00E676;">Colonia: </b>${c[8]}<br>
                                        <b style="color:#00E676;">Calle: </b>${c[9]}<br>
                                        <b style="color:#00E676;">#Exterior: </b>${c[10]}<br>
                                        <b style="color:#00E676;">#Interior: </b>${c[11]}<br>
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">lock_open</i>Contraseña</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${c[15]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">wc</i>Genero</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${c[16]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">call</i>Teléfono</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${c[13]}
                                    </span>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">email</i>Email</div>
                                <div class="collapsible-body">
                                    <span>
                                        ${c[14]}
                                    </span>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div id="cuentas">
                        <div class="col s12 m8 l8">
                            <div style="background-color: #00E676; color:white; text-align:center;">
                               <i class="material-icons">attach_money</i> <b>Cuentas</b>
                            </div>
                            
                            <c:forEach items="${infoCuentas}" var="ic">
                            <ul class="collapsible" data-collapsible="accordion">
                                
                                <li>
                                    <div class="collapsible-header">
                                        <i class="material-icons">
                                            art_track
                                        </i>
                                        ${ic[0]} 

                                    </div>
                                    <div class="collapsible-body">
                                        <span>
                                            <b style="color:#ff0;">Saldo: </b>${ic[1]}<br>
                                            <b style="color:#ff0;">Adquisición: </b>${ic[4]}<br>
                                            <b style="color:#ff0;">Fecha Límite: </b>${ic[5]}<br>
                                            <b style="color:#ff0;">Pago Mínimo: </b>${ic[6]}<br>
                                            <b style="color:#ff0;">Intereses: </b>${ic[7]}<br>
                                            <b style="color:#ff0;">Detalle: </b>${ic[3]}<br>
                                        </span>
                                    </div>
                                </li>
                                
                            </ul>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="rentas">
                        <div class="col s12 m8 l8">
                            <div style="background-color: #00E676; color:white; text-align:center;">
                               <i class="material-icons">attach_money</i> <b>Rentas</b>
                            </div>
                            <div class="slider">
                                <ul class="slides">
                                    <c:forEach items="${infoRentas}" var="ir">                                
                                        <li>
                                            <img class="responsive-img" src="${ir[21]}">
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <ul class="collapsible" data-collapsible="accordion">
                                <c:forEach items="${infoRentas}" var="ir">
                                     
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">
                                                add_shopping_cart
                                            </i>
                                            ${ir[16]} 

                                        </div>
                                        <div class="collapsible-body">
                                            <span>
                                                <b style="color:#ff0;">Descripción: </b>${ir[3]}<br>
                                                <b style="color:#ff0;">Fecha Inicio: </b>${ir[4]}<br>
                                                <b style="color:#ff0;">Fecha Fin: </b>${ir[5]}<br>
                                                <b style="color:#ff0;">Unidades: </b>${ir[7]}<br>
                                                <c:if test="${ir[8] eq 1}">
                                                    <b style="color:#ff0;">Pago: </b>Efectivo<br>
                                                </c:if>
                                                <c:if test="${ir[8] eq 2}">
                                                    <b style="color:#ff0;">Pago: </b>Tarjeta<br>
                                                </c:if>
                                                <b style="color:#ff0;">Sucursal: </b>${ir[10]}<br>
                                                <b style="color:#ff0;">Automovil: </b>${ir[16]}<br>
                                                <b style="color:#ff0;">Color: </b>${ir[17]}<br>
                                                <b style="color:#ff0;">Modelo: </b>${ir[18]}<br>
                                                <b style="color:#ff0;">Tipo: </b>${ir[22]}<br>
                                                <b style="color:#ff0;">Marca: </b>${ir[23]}<br>
                                                <b style="color:#ff0;">Precio: </b>${ir[20]}<br>
                                                <b style="color:#ff0;">Kilometraje: </b>${ir[19]}<br><br>
                                                <a href="ControlEmpleado.do?btnControlador=borraRenta&idRenta=${ir[0]}" style="color: red;">Borrar renta</a>
                                            </span>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${infoCliente}" var="c">
                    <div class="col s12 m6 l3">
                        <a class="waves-effect btn modal-trigger" style="background-color: #64dd17;" href="#modalEditaClientePorEmpleado">
                            Editar Datos
                        </a><br><br>
                    </div>
                    <div class="col s12 m6 l3">
                        <a class="waves-effect btn modal-trigger" style="background-color: #FF1744;" href="ControlEmpleado.do?btnControlador=borrarCRUDClientePorEmpleado&idCliente=${c[0]}">
                            Borrar Cliente
                        </a><br><br>
                    </div>
                    <div class="col s12 m6 l3">
                        <a class="waves-effect btn modal-trigger" style="background-color: #18ffff;" href="#modalCreaRentaDeCliente">
                            Nueva Renta
                        </a><br><br>
                    </div>
                    <div class="col s12 m6 l3">
                        <a class="waves-effect btn modal-trigger" style="background-color: #ff0;" href="#modalCreaCuentaDeCliente">
                            Nueva Cuenta
                        </a><br><br>
                    </div>                            
                    </c:forEach>
                </div>
            </div>
        </section>
        
        </c:if>
        <c:if test="${empty cliente}">
            Error, No existe Sesion
            <meta http-equiv ="refresh" content="3;URL=empleado.jsp">
        </c:if>
                                
    </body>
</html>
