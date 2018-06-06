package Control;

import Modelos.ServicioClienteLocal;
import java.io.IOException;
import java.util.Hashtable;
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
        Hashtable<String,Boolean> arreglo = new Hashtable<String,Boolean>();
        arreglo.put(request.getParameter("estado"),true);
        arreglo.put(request.getParameter("municipio"),true);
        arreglo.put(request.getParameter("colonia"),true);
        arreglo.put(request.getParameter("calle"),true);
        arreglo.put(request.getParameter("cp"),true);
        arreglo.put(request.getParameter("tel"),true);
        arreglo.put(request.getParameter("email"),true);
        arreglo.put(request.getParameter("pass"),true);
        arreglo.put(request.getParameter("numExterior"),true);
        arreglo.put(request.getParameter("numInterior"),true);
        arreglo.put(request.getParameter("idCliente"),true);
        if(servicio.validaCampos(arreglo)){
            int cont = 0;
            String entidad = request.getParameter("estado");
            String municipio = request.getParameter("municipio");
            String colonia = request.getParameter("colonia");
            String calle = request.getParameter("calle");
            String pass = request.getParameter("pass");
            String tel = "";
            String email = "";
            int cp =0;
            int noExterior = 0;
            int noInterior = 0;
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            
            if(servicio.validarDigitos(request.getParameter("cp"))){
                cp = Integer.parseInt(request.getParameter("cp"));
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("numExterior"))){
                 noExterior = Integer.parseInt(request.getParameter("numExterior"));
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("numInterior"))){
                 noInterior = Integer.parseInt(request.getParameter("numInterior"));
                cont ++;
            }
            if(servicio.validarEmail(request.getParameter("email"))){
                 email = request.getParameter("email");
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("tel"))){
                 tel = request.getParameter("tel");
                cont ++;
            }
            if(cont == 5){
                servicio.editarClientePorCliente(idCliente, entidad, municipio,colonia, calle, 
                                            noExterior, noInterior, cp, tel, email, pass);
                String respuesta = "Actualización del cliente exitosa";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
            }else{
                String respuesta = "Algunos valores no son validos";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
            }            
        }else{
            String respuesta = "Campos incompletos para la actualización del cliente";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("cliente.jsp").forward(request, response);
        }
    }
    
 

}
