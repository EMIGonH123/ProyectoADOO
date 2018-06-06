<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
        <script src="js/validetta101/localization/validettaLang-es-ES.js"></script>
        <link rel="stylesheet" type="text/css" href="js/validetta101/validetta.min.css">
        <script src="js/validetta101/validetta.min.js"></script>
        <title>IndexRentaAutos</title>
    </head>

    <body>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/ScriptsMaterialize.js"></script>
        
        <!--Aqui empieza el encabezado de la pagina principal-->
        <section id="encabezado">

            <div class="row col s12 m12 l12" style="background-color: #0059bc;">
                <ul id="sucursales" class="dropdown-content">
                   
                    <li class="divider"></li>
                    <li><a href="ControlSesiones.do?btnControlador=inicioSesionSucursal&idSucursal=1">Azcapotzalco</a></li>
                    <li class="divider"></li>
                    <li><a href="ControlSesiones.do?btnControlador=inicioSesionSucursal&idSucursal=2">Centro</a></li>
                    <li class="divider"></li>
                    <li><a href="ControlSesiones.do?btnControlador=inicioSesionSucursal&idSucursal=3">Santa Mónica</a></li>
                </ul>

                <div class="navbar-fixed">
                    <nav class="nav-extended">
                        <div class="nav-wrapper" style="background-color: #0059bc; color:white;">
                            <a class="brand-logo" style="margin-left: 20px;"><b>PrestAutos</b></a>
                            <ul class="right hide-on-med-and-down">
                                <li>
                                    <a class="dropdown-button" data-activates="sucursales">
                                        Sucursales
                                        <i class="material-icons right">arrow_drop_down</i>
                                    </a>
                                </li>
                                <%--<li><a href="bancos.jsp">Transacciones</a></li>
                                <li><a class="modal-trigger" href="#btnFragmentacion">Fragmentacion</a></li>--%>
                            </ul>
                        </div>
                        <div class="nav-content" style="background-color:#0059bc; color:white;">
                            <ul class="tabs tabs-transparent">
                                <li class="tab"><a class="waves-effect waves-light modal-trigger" href="#btnInicioCliente">Inicia Sesion Cliente</a></li>
                                <li class="tab"><a class="waves-effect waves-light modal-trigger" href="#btnInicioEmpleado">Inicia Sesion Empleado</a></li>
                                <li class="tab"><a onclick="Materialize.toast('<%=request.getAttribute("msgRespuesta")%>', 4000,'rounded')">Respuesta</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
                
            </div>

        </section>
        
        <!--Aqui empieza el cuerpo de la pagina principal-->
        <section id="contenidos" style="margin-top:50px;">
            <div class="container">                    
                <div class="row">
                    <div class="col s0 m3 l3"></div>
                    <div class="col s12 m6 l6">
                        <img style="margin:auto;" class="responsive-img" src="Images/MV/logo.png">
                    </div>
                    <div class="col s0 m3 l3"></div>
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
                <div class="row">
                    <div class="col l12 m12 s12">
                        <div style="background-color: #0059bc; color:white; text-align:center;">
                          <i class="icon fa fa-bookmark"></i> <b><h5>Marcas de automoviles</h5></b>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col l4 m4 s12">
                          <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Ford/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.ford.mx/?searchid=Ford:BrandExact|google|Ford|20170724" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>La Ford Motor Company, o conocido como Ford, es una Empresa Multinacional Estadounidense fabricante 
                                  de automóviles con sede en Dearborn, fue fundada por Henry Ford y se incorporó el 16 de junio de 1903.</p>
                            </div>
                          </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Hyundai/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.hyundai.com.mx" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Hyundai es un conglomerado de empresas y negocios de Corea del Sur, fundado en 1947 por Chung Ju-yung. Dentro de las múltiples firmas que posee, se encuentra la marca de 
                                  automóviles Hyundai Motor Company, el cuarto mayor fabricante de coches (si se tiene en cuenta las cifras de Kia Motors, su subsidiaria)</p>
                            </div>
                          </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/KIA/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.kia.com/mx/main.html" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Kia Motors es un fabricante surcoreano de automóviles. Su sede central está ubicada 
                                  en Yangjae-dong, Seocho-gu, Seúl, Corea del Sur. La compañía, perteneciente ahora al conglomerado de Hyundai,
                                  en la fase Ford fabricó, como parte del conglomerado ante-crisis de la Ford, exitosos modelos bajo licencia para Ford y Mazda.</p>
                            </div>
                          </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Nissan/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.nissan.com.mx/" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Nissan Motor Company, Limited es un fabricante japonés de automóviles, con base en Yokohama.
                                  Su nombre común, Nissan, es un acrónimo de "Nippon Sangyo" (en japonés significa "industria japonesa"). </p>
                            </div>
                          </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Seat/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="http://www.seat.mx/" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>SEAT, S.A. es una empresa española de automóviles fundada por el extinto Instituto Nacional de Industria el 9 de mayo de 1950.
                                  Las siglas S.E.A.T provienen del acrónimo de "Sociedad Española de Automóviles de Turismo", denominación con que fue bautizada originalmente.</p>
                            </div>
                          </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Renault/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.renault.com.mx/" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Renault es un fabricante francés de automóviles, vehículos comerciales y automóviles de carreras. 
                                  No se debe confundir con Renault Trucks, una empresa dedicada a la fabricación de camiones.</p>
                            </div>
                          </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Toyota/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.toyota.mx" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Toyota Motor Corporation, simplemente llamado Toyota,es un fabricante de automóviles japonés con sede en Toyota (Aichi), 
                                  Japón. Toyota fue el mayor fabricante de automóviles en 2012 (por producción) por delante del Grupo Volkswagen y 
                                  General Motors,y tuvo ventas mundiales aproximadas de 9,98 millones de vehículos en 2013.</p>
                            </div>
                          </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Volkswagen/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.vw.com.mx" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Volkswagen es un fabricante de automóviles alemán con sede en Wolfsburgo, Baja Sajonia (Alemania). 
                                  Volkswagen es la marca original y más vendida del Grupo Volkswagen, el mayor fabricante de automóviles alemán 
                                  y el segundo mayor fabricante de automóviles del mundo.</p>
                            </div>
                          </div>
                    </div>
                    <div class="col l4 m4 s12">
                        <div class="card">
                            <div class="card-image waves-effect waves-block waves-light">
                              <img class="activator" src="Images/Sucursal/Marcas/Volvo/logo.png">
                            </div>
                            <div class="card-content">
                              <span class="card-title activator grey-text text-darken-4">Más información<i class="material-icons right">more_vert</i></span>
                              <p><a style="color:yellow;" href="https://www.volvocars.com/mx" target="_blank"><b>Visitanos</b></a></p>
                            </div>
                            <div class="card-reveal">
                              <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i>Información</span>
                              <p>Volvo Car Corporation o Volvo Cars (formalmente, Volvo Personvagnar AB) es un fabricante de automóviles con sede en Gotemburgo, Suecia.
                                  Fue originalmente fundada en 1927 por el ingeniero Gustav Larson y el economista Assar Gabrielsson, como una empresa subsidiaria de 
                                  la fabricante de rodamientos SKF. </p>
                            </div>
                          </div>
                    </div>
                </div>
                
                <br><br><br>

                <div class="row">
                    
                    
                    <!-- ALUMNO GENERAL -->
                    <div class="col l6 s12 m6">
                        <!-- Modal Structure -->
                        <div id="btnInicioEmpleado" class="modal">
                            <div class="modal-content">
                            <h3 style="color:greenyellow; text-align: center;">Sesión Empleado</h3>
                            <form action="ControlSesiones.do"  method="POST" class="col s12 m12 l12">
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">account_circle</i>
                                  <input id="idEmpleado" name="idEmpleado" type="text" data-validetta="required">
                                  <label for="idEmpleado">Identificador</label>
                                </div>
                                <div class="input-field col s4">
                                  <i class="material-icons prefix">hdr_strong</i>
                                  <input id="pass" name="pass" type="password" data-validetta="required">
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
            <footer class="page-footer" style="background-color: #0059bc; color:white;">
                <div class="container row">
                    <div class="col l4 m6 s12" id="contorno" >
                        <p>	
                            <h5><b>Conocenos</b></h5><br>
                                <i class="icon fa fa-briefcase"></i>  Trabajar en <b>PrestAutos</b> <br><br>
                                <i class="icon fa fa-info-circle"></i>  Información corporativa<br><br>
                                <i class="icon fa fa-building  "></i> Departamento de prensa<br><br>

	
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
                            <h5>Metodos de pago</h5><br>
                            <i class="icon fa fa-credit-card "></i>  Tarjetas de crédito y débito<br><br>
                            <i class="icon fa fa-gift"></i>  Tarjetas de regalo<br><br>
                            <i class="icon fa fa-money-check-alt  "></i>  Meses sin intereses<br> <br>
                            <i class="icon fa fa-amazon-pay  "></i>  Amazon Cash<br><br>
                            
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
