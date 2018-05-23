package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <!--Let browser know website is optimized for mobile-->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("        <title>IndexRentaAutos</title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!--JavaScript at end of body for optimized loading-->\n");
      out.write("        <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/ScriptsMaterialize.js\"></script>\n");
      out.write("        \n");
      out.write("        <!--Aqui empieza el encabezado de la pagina principal-->\n");
      out.write("        <section id=\"encabezado\">\n");
      out.write("\n");
      out.write("            <div class=\"row col s12 m12 l12\" style=\"background-color: #022f42;\">\n");
      out.write("                <ul id=\"sucursales\" class=\"dropdown-content\">\n");
      out.write("                   \n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"control.do?btnControlador=verSucursal&idSucursal=1\">Azcapotzalco</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"control.do?btnControlador=verSucursal&idSucursal=2\">Centro</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"control.do?btnControlador=verSucursal&idSucursal=3\">SantaMaria</a></li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("                <div class=\"navbar-fixed\">\n");
      out.write("                    <nav>\n");
      out.write("                        <div class=\"nav-wrapper\" style=\"background-color: #022f42; color:white;\">\n");
      out.write("                            <a class=\"brand-logo\" style=\"margin-left: 20px;\"><b>PrestAutos</b></a>\n");
      out.write("                            <ul class=\"right hide-on-med-and-down\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-button\" data-activates=\"sucursales\">\n");
      out.write("                                        Sucursales\n");
      out.write("                                        <i class=\"material-icons right\">arrow_drop_down</i>\n");
      out.write("                                    </a>\n");
      out.write("                                </li>\n");
      out.write("                                <li><a href=\"automoviles.jsp\">Automoviles</a></li>\n");
      out.write("                                <li><a href=\"bancos.jsp\">Transacciones</a></li>\n");
      out.write("                                <li><a href=\"fragmentaciones.jsp\">Fragmentacion</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("        <!--Aqui empieza el cuerpo de la pagina principal-->\n");
      out.write("        <section id=\"contenidos\">\n");
      out.write("            <div class=\"container\">                    \n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col s0 m3 l2\"></div>\n");
      out.write("                    <div class=\"col s12 m6 l8\">\n");
      out.write("                        <img style=\"margin:auto;\" class=\"responsive-img\" src=\"Images/MV/logo.png\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col s0 m3 l2\"></div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row col s12 m12 l12\">\n");
      out.write("                <div class=\"slider\">\n");
      out.write("                    <ul class=\"slides\">\n");
      out.write("                        <li>\n");
      out.write("                            <img class=\"responsive-img\" src=\"Images/Carros/lamborguini.png\"> <!-- random image -->\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <img class=\"responsive-img\" src=\"Images/Carros/jeep.png\"> <!-- random image -->\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <img class=\"responsive-img\" src=\"Images/Carros/lamborguini01.png\"> <!-- random image -->\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <img class=\"responsive-img\" src=\"Images/Carros/rangerovert.png\"> <!-- random image -->\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <img class=\"responsive-img\" src=\"Images/Carros/raptor.png\"> <!-- random image -->\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <br><br><br>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    <!-- ALUMNO GENERAL -->\n");
      out.write("                    <div class=\"col l6 s12 m6\">\n");
      out.write("                        <!-- Modal Trigger -->\n");
      out.write("                        <a class=\"waves-effect waves-light btn modal-trigger\" style=\"background-color:#022f42;\" href=\"#btnInicioEmpleado\">Empleado</a>\n");
      out.write("                        <!-- Modal Structure -->\n");
      out.write("                        <div id=\"btnInicioEmpleado\" class=\"modal\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("                            <h3 style=\"color:greenyellow; text-align: center;\">Sesión Empleado</h3>\n");
      out.write("                            <form action=\"ControlSesiones.do\"  method=\"POST\" class=\"col s12 m12 l12\">\n");
      out.write("                                <div class=\"input-field col s4\">\n");
      out.write("                                  <i class=\"material-icons prefix\">account_circle</i>\n");
      out.write("                                  <input id=\"idEmpleado\" name=\"idEmpleado\" type=\"text\" class=\"validate\">\n");
      out.write("                                  <label for=\"idEmpleado\">Identificador</label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"input-field col s4\">\n");
      out.write("                                  <i class=\"material-icons prefix\">hdr_strong</i>\n");
      out.write("                                  <input id=\"pass\" name=\"pass\" type=\"password\" class=\"validate\">\n");
      out.write("                                  <label for=\"pass\">Contraseña</label>\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"submit\" name=\"btnControlador\" value=\"inicioSesionEmpleado\" class=\"btn\">\n");
      out.write("                                Ingresar\n");
      out.write("                                </button>\n");
      out.write("                            </form>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <!-- ALUMNO GENERAL -->\n");
      out.write("                    <div class=\"col l6 s12 m6\">\n");
      out.write("                        <!-- Modal Trigger -->\n");
      out.write("                        <a class=\"waves-effect waves-light btn modal-trigger\" style=\"background-color:#022f42;\" href=\"#btnInicioCliente\">Cliente</a>\n");
      out.write("                        <!-- Modal Structure -->\n");
      out.write("                        <div id=\"btnInicioCliente\" class=\"modal\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("                            <h3 style=\"color:greenyellow; text-align: center;\">Sesión Cliente</h3>\n");
      out.write("                            <form action=\"ControlSesiones.do\"  method=\"POST\" class=\"col s12 m12 l12\">\n");
      out.write("                                <div class=\"input-field col s4\">\n");
      out.write("                                  <i class=\"material-icons prefix\">account_circle</i>\n");
      out.write("                                  <input id=\"idCliente\" name=\"idCliente\" type=\"text\" class=\"validate\">\n");
      out.write("                                  <label for=\"idCliente\">Identificador</label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"input-field col s4\">\n");
      out.write("                                  <i class=\"material-icons prefix\">hdr_strong</i>\n");
      out.write("                                  <input  id=\"pass\" name=\"pass\" type=\"password\" class=\"validate\">\n");
      out.write("                                  <label for=\"pass\">Contraseña</label>\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"submit\" name=\"btnControlador\" value=\"inicioSesionCliente\" class=\"btn\">\n");
      out.write("                                Ingresar\n");
      out.write("                                </button>\n");
      out.write("                            </form>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("        <!--Aqui empieza el pie de la pagina principal-->\n");
      out.write("        <section id=\"pie\">\n");
      out.write("            <footer class=\"page-footer\" style=\"background-color: #022f42; color:white;\">\n");
      out.write("                <div class=\"container row\" style=\"background-image:url(Images/General/pie.jpg); \" >\n");
      out.write("                    <div class=\"col l4 m6 s12\" id=\"contorno\" >\n");
      out.write("                        <p>\t\n");
      out.write("                            <h5><b>Enlaces</b></h5>\n");
      out.write("                            Declaración de Accesibilidad<br>\n");
      out.write("                            Política de privacidad<br>\n");
      out.write("                            Términos y Condiciones<br>\n");
      out.write("                            Marco Jurídico<br>\n");
      out.write("                            Portal de Obligaciones de Transparencia <br>\n");
      out.write("                            Sistema Infomex <br>\n");
      out.write("                            INAI<br>\n");
      out.write("                            Mapa de sitio<br>\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col l4 m6 s12\" id=\"contorno\">\n");
      out.write("                        <p>\n");
      out.write("                            <h5>¿QUÉ ES GOB.MX? </h5>\n");
      out.write("                            Es el portal único de trámites, \n");
      out.write("                            información y participación ciudadana. \n");
      out.write("                            Leer más <br><br>\n");
      out.write("                            <b><span id=\"hoverable\" >English</span> </b><br>\n");
      out.write("                            <b><span> Temas </span></b><br>\n");
      out.write("                            <b><span>Reformas </span></b><br>\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col l4 m12 s12\"  id=\"contorno\">\n");
      out.write("                        <p>\n");
      out.write("                            <h5>CONTACTO</h5>\n");
      out.write("                            Mesa de ayuda: dudas e información <br><br>\n");
      out.write("                            <em>gobmx@funcionpublica.gob.mx</em><br><br>\n");
      out.write("                            <i>Denuncia contra servidores públicos</i> <br>\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"footer-copyright\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <p style=\"text-align: center;\"> © 2017 Copyright <b>PRESTAUTOS</b> </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </footer>\n");
      out.write("\t</section>       \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
