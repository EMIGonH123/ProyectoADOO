package Control;

import Modelos.ServicioClienteLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlCliente", urlPatterns = {"/ControlCliente.do"})
public class ControlCliente extends HttpServlet {
    @EJB
    private ServicioClienteLocal servicio;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException , EJBException{

        String val = request.getParameter("btnControlador");
        switch(val){
            case "editarClientePorCliente":
                editarClientePorCliente(request, response);
            break;

        }
    }
    
    protected void editarClientePorCliente(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        String entidad = request.getParameter("estado");
        String municipio = request.getParameter("municipio");
        String colonia = request.getParameter("colonia");
        String calle = request.getParameter("calle");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String pass = request.getParameter("pass");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        int noExterior = Integer.parseInt(request.getParameter("numExterior"));
        int noInterior = Integer.parseInt(request.getParameter("numInterior"));
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        servicio.editarClientePorCliente(idCliente, entidad, municipio,colonia, calle, 
                                        noExterior, noInterior, cp, tel, email, pass);
        response.sendRedirect("cliente.jsp");
    }
    
 

}
