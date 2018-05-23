package Control;

import EntidadesADOO.Clienterenta;
import EntidadesADOO.Empleadorenta;
import Modelos.ServiciosLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlSesiones", urlPatterns = {"/ControlSesiones.do"})
public class ControlSesiones extends HttpServlet {
    @EJB
    private ServiciosLocal servicio;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{

        try {
            String val = request.getParameter("btnControlador");
            switch(val){
                case "inicioSesionEmpleado":
                    inicioSesionEmpleado(request, response);
                    break;
                case "verAtributos":
                    verAtributos(request, response);
                    break;
                case "inicioSesionCliente":
                    inicioSesionCliente(request, response);
                    break;
                    
            }
        } catch (ParseException ex) {
            Logger.getLogger(ControlSesiones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void verAtributos(HttpServletRequest request, HttpServletResponse response)
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
        
        List<String> lista = servicio.obtenerAtributosDeTabla(nombre);
        Iterator<String> i = lista.iterator();
        while(i.hasNext()){
            out.println("<tr>");
            out.println("<td>");
            //String aux = new String((String)i.next());
            /*Object o = (Object)i.next();
            if(o instanceof String){
                out.println("String");
            }*/
            out.println(String.valueOf(i.next()));
            out.println("</td>");
            out.println("</tr>");
        }
        
        out.println("</tbody>");
        out.println("</table>");
    }

    /****************************/
    /* INICIO DE SESIONES INDEX */
    /****************************/
    protected void inicioSesionEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,EJBException,PersistenceException {
        int id = (int)Integer.parseInt(request.getParameter("idEmpleado"));
        String pass = (String)request.getParameter("pass");
        Empleadorenta empleado = servicio.iniciaSesionEmpleado(id, pass);
        if(empleado != null){
            if(empleado.getIdTipoEmpleado()==1){
                request.getSession().setAttribute("empleado",empleado);
                response.sendRedirect("administrador.jsp");
            }else{
                request.getSession().setAttribute("empleado",empleado);
                response.sendRedirect("empleado.jsp");
            }
            
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }
    
    protected void inicioSesionCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,EJBException,PersistenceException {
        int id = Integer.parseInt(request.getParameter("idCliente"));
        String pass = request.getParameter("pass");
        Clienterenta cliente = servicio.iniciaSesionCliente(id, pass);
        if(cliente != null){
            request.getSession().setAttribute("cliente",cliente);
            response.sendRedirect("cliente.jsp");
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
