<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="fontAwesome/css/font-awesome.min.css">
        <title>IndexRentaAutos</title>
    </head>

    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>
        
        <!--Aqui empieza el encabezado de la pagina principal-->
        <section id="encabezado">

            <div class="row col s12 m12 l12" style="background-color: #022f42;">
                <ul id="sucursales" class="dropdown-content">
                   
                    <li class="divider"></li>
                    <li><a href="ControlSesiones.do?btnControlador=inicioSesionSucursal&idSucursal=1">Azcapotzalco</a></li>
                    <li class="divider"></li>
                    <li><a href="ControlSesiones.do?btnControlador=inicioSesionSucursal&idSucursal=2">Centro</a></li>
                    <li class="divider"></li>
                    <li><a href="ControlSesiones.do?btnControlador=inicioSesionSucursal&idSucursal=3">Santa Mónica</a></li>
                </ul>

                <div class="navbar-fixed">
                    <nav>
                        <div class="nav-wrapper" style="background-color: #022f42; color:white;">
                            <a class="brand-logo" style="margin-left: 20px;"><b>PrestAutos</b></a>
                            <ul class="right hide-on-med-and-down">
                                <li>
                                    <a class="dropdown-button" data-activates="sucursales">
                                        Sucursales
                                        <i class="material-icons right">arrow_drop_down</i>
                                    </a>
                                </li>
                                <li><a href="bancos.jsp">Transacciones</a></li>
                                <li><a class="modal-trigger" href="#btnFragmentacion">Fragmentacion</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
                
            </div>

        </section>
        
        <!--Aqui empieza el cuerpo de la pagina principal-->
        <section id="contenidos">
            <div class="container">                    
                <div class="row">
                    <div class="col s0 m3 l2"></div>
                    <div class="col s12 m6 l8">
                        <img style="margin:auto;" class="responsive-img" src="Images/MV/logo.png">
                    </div>
                    <div class="col s0 m3 l2"></div>
                </div>
                <div class="row col s12 m12 l12">
                <div class="slider">
                    <ul class="slides">
                        <li>
                            <img class="responsive-img" src="Images/Carros/lamborguini.png"> <!-- random image -->
                        </li>
                        <li>
                            <img class="responsive-img" src="Images/Carros/jeep.png"> <!-- random image -->
                        </li>
                        <li>
                            <img class="responsive-img" src="Images/Carros/lamborguini01.png"> <!-- random image -->
                        </li>
                        <li>
                            <img class="responsive-img" src="Images/Carros/rangerovert.png"> <!-- random image -->
                        </li>
                        <li>
                            <img class="responsive-img" src="Images/Carros/raptor.png"> <!-- random image -->
                        </li>
                    </ul>
                </div>
                </div>
                
                <br><br><br>

                <div class="row">
                    
                    
                    <!-- ALUMNO GENERAL -->
                    <div class="col l6 s12 m6">
                        <!-- Modal Trigger -->
                        <a class="waves-effect waves-light btn modal-trigger" style="background-color:#022f42;" href="#btnInicioEmpleado">Empleado</a>
                        <!-- Modal Structure -->
                        <div id="btnInicioEmpleado" class="modal">
                            <div class="modal-content">
                            <h3 style="color:greenyellow; text-align: center;">Sesión Empleado</h3>
                            <form action="ControlSesiones.do"  method="POST" class="col s12 m12 l12">
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">account_circle</i>
                                  <input id="idEmpleado" name="idEmpleado" type="text" class="validate">
                                  <label for="idEmpleado">Identificador</label>
                                </div>
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <input id="pass" name="pass" type="password" class="validate">
                                  <label for="pass">Contraseña</label>
                                </div>
                                <button type="submit" name="btnControlador" value="inicioSesionEmpleado" class="btn">
                                Ingresar
                                </button>
                            </form>
                            </div>
                            
                        </div>
                    </div>
                    
                    <!-- ALUMNO GENERAL -->
                    <div class="col l6 s12 m6">
                        <!-- Modal Trigger -->
                        <a class="waves-effect waves-light btn modal-trigger" style="background-color:#022f42;" href="#btnInicioCliente">Cliente</a>
                        <!-- Modal Structure -->
                        <div id="btnInicioCliente" class="modal">
                            <div class="modal-content">
                            <h3 style="color:greenyellow; text-align: center;">Sesión Cliente</h3>
                            <form action="ControlSesiones.do"  method="POST" class="col s12 m12 l12">
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">account_circle</i>
                                  <input id="idCliente" name="idCliente" type="text" class="validate">
                                  <label for="idCliente">Identificador</label>
                                </div>
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <input  id="pass" name="pass" type="password" class="validate">
                                  <label for="pass">Contraseña</label>
                                </div>
                                <button type="submit" name="btnControlador" value="inicioSesionCliente" class="btn">
                                Ingresar
                                </button>
                            </form>
                            </div>
                            
                        </div>
                    </div>
                    
                    <!-- FRAGMENTACION -->
                    <div class="col l6 s12 m6">
                        <div id="btnFragmentacion" class="modal">
                            <div class="modal-content">
                            <h3 style="color:#0059bc; text-align: center;">Sesión Administrador</h3>
                            <form action="ControlSesiones.do"  method="POST" class="col s12 m12 l12">
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">account_circle</i>
                                  <input id="idAdmin" name="idAdmin" type="text" class="validate">
                                  <label for="idAdmin">Identificador</label>
                                </div>
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <input  id="pass" name="pass" type="password" class="validate">
                                  <label for="pass">Contraseña</label>
                                </div>
                                <button type="submit" name="btnControlador" value="inicioSesionAdmin" class="btn blue">
                                Ingresar
                                </button>
                            </form>
                            </div>
                            
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </section>
        
        <!--Aqui empieza el pie de la pagina principal-->
        <section id="pie">
            <footer class="page-footer" style="background-color: #022f42; color:white;">
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
	</section>       
    </body>
</html>
