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
    public ControlFragmentaciones(){
        o = new Hashtable<String, String>();
    }
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        try {
            String val = request.getParameter("btnControlador");
            switch(val){
                case "eliminarPredicado":
                    eliminarPredicado(request, response);
                break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(ControlFragmentaciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
                    eliminarPredicado(request, response);
                break;
                case "analizarPredicados":
                    analizarPredicados(request, response);
                break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(ControlFragmentaciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    protected void analizarPredicados(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        o.clear();
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        
    }
    
    protected void eliminarPredicado(HttpServletRequest request, HttpServletResponse response)
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
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String nombre = request.getParameter("nombreTabla");
        List<String> lista = servicio.getAtributosDeTabla(nombre);
        Iterator<String> i = lista.iterator();
        /*while(i.hasNext()){
            out.println("<option>"+i.next()+"</option>\n");
        }*/
        
        out.println("<table  class='highlight responsive-table centered'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Atributos</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        while(i.hasNext()){
            out.println("<tr>");
            out.println("<td>");
            out.println(i.next());
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</tbody>");
        out.println("</table>");
    }
    
    protected void generarPredicados(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String operador = request.getParameter("operador");
        String valor = request.getParameter("valor");
        o.put(valor,operador);
        out.println("<table  class='highlight responsive-table centered'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Predicados</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        Enumeration<String> k = o.keys();
        Enumeration<String> v = o.elements();
        while(k.hasMoreElements()){
            out.println("<tr>");
            out.println("<td>");
            String clave = v.nextElement();
            String val = k.nextElement();
            out.println(clave+" "+val+" <i href='ControlFragmentaciones.do?btnControlador=eliminarPredicado&key='"+clave+"' class='material-icons'>delete</i>");
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</tbody>");
        out.println("</table>");
    } 
}
