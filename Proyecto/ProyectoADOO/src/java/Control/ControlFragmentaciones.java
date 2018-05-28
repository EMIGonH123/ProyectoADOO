package Control;

import Modelos.ServicioFragmentacionLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.json.stream.JsonGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlFragmentaciones", urlPatterns = {"/ControlFragmentaciones.do"})
public class ControlFragmentaciones extends HttpServlet {


    @EJB
    private ServicioFragmentacionLocal servicio;
    
    public static Hashtable<String,String> o;
    public static Hashtable<String,String> ht;
    public static Hashtable<String,String> conector;
    public static List<String> predicados;
    public ControlFragmentaciones(){
        o = new Hashtable<String, String>();
        ht = new Hashtable<String, String>();
        conector = new Hashtable<String, String>();
        predicados = new  ArrayList<String>();
    }
    
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        try {
            String val = request.getParameter("btnControlador");
            switch(val){
                case "verAtributos":
                    verAtributosDeTabla(request, response);
                break;
                case "generarPredicados":
                    generarPredicados(request, response);
                break;
                case "eliminarPredicados":
                    eliminarPredicados(request, response);
                break;
                case "analizarPredicados":
                    analizarPredicados(request, response);
                break;
                case "generarMiniterminos":
                    generarMiniterminos(request, response);
                break;
                case "fragmentar":
                    fragmentar(request, response);
                break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(ControlFragmentaciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    protected void fragmentar(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        servicio.getDetalleDeTabla();
        out.println("<h5 style='color:green'>");
        out.println("Se fragmento");
        out.println("</h5>");
    }
    
    protected void generarMiniterminos(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        if(!o.isEmpty()){        
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            servicio.generarPredicadosMiniterminos(o);
            out.println("<table  class='highlight responsive-table centered'>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Predicados Miniterminos</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            Enumeration<String> k = o.keys();
            while(k.hasMoreElements()){
                out.println("<tr>");
                out.println("<td>");
                out.println(k.nextElement());
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        }
    }
    
    protected void analizarPredicados(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        if(!o.isEmpty()){        
            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();
            servicio.analiarPredicados(o);
            out.println("<table  class='highlight responsive-table centered'>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Predicados</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            Enumeration<String> k = o.keys();
            while(k.hasMoreElements()){
                out.println("<tr>");
                out.println("<td>");
                out.println(k.nextElement());
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        }
    }
    
    protected void eliminarPredicados(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        o.clear();
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.println("<table  class='highlight responsive-table centered'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Predicados</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        out.println("</tbody>");
        out.println("</table>");
    }
    
    
    
    protected void verAtributosDeTabla(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        String nombre = request.getParameter("nombreTabla");
        servicio.setNombreTabla(nombre);
        o.clear();
        response.sendRedirect("fragmentaciones.jsp");
        
    }
    
    protected void generarPredicados(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String operador = request.getParameter("operador");
        String valor = request.getParameter("valor");
        String atributo = request.getParameter("atributo");
        String cadena = atributo+" "+operador+" "+valor;
        List<String> tipoDato = servicio.getTipoDatoDeAtributo(atributo);
        String td = tipoDato.get(0);
        o.put(cadena, td);
        out.println("<table  class='highlight responsive-table centered'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Predicados</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        Enumeration<String> k = o.keys();
        while(k.hasMoreElements()){
            out.println("<tr>");
            out.println("<td>");
            out.println(k.nextElement());
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</tbody>");
        out.println("</table>");
        
    } 
}
