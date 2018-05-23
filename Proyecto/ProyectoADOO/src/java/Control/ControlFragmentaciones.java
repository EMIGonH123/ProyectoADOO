package Control;

import Modelos.ServicioFragmentacionLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlFragmentaciones", urlPatterns = {"/ControlFragmentaciones.do"})
public class ControlFragmentaciones extends HttpServlet {

    @EJB
    private ServicioFragmentacionLocal servicio;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        try {
            String val = request.getParameter("btnControlador");
            switch(val){
                case "verAtributos":
                    verAtributosDeTabla(request, response);
                break;   
            }
        } catch (ParseException ex) {
            Logger.getLogger(ControlFragmentaciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    protected void verAtributosDeTabla(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String nombre = request.getParameter("nombreTabla");
        out.println("<table  class='highlight responsive-table centered'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Atributos</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");
        
        ArrayList<String> lista = servicio.getAtrigutosDeTabla(nombre);
        Iterator<String> i = lista.iterator();
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

}
