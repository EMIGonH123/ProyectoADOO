package Control;

import EntidadesADOO.*;
import Modelos.ServicioSesionesLocal;
import java.io.IOException;
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
    private ServicioSesionesLocal servicio;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        String val = request.getParameter("btnControlador");
        switch(val){
            case "inicioSesionSucursal":
                inicioSesionSucursal(request, response);
            break;
            case "inicioSesionProveedorAuto":
                inicioSesionProveedorAuto(request, response);
            break;
            //
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        String val = request.getParameter("btnControlador");
        switch(val){
            case "inicioSesionEmpleado":
                inicioSesionEmpleado(request, response);
            break;
            case "inicioSesionCliente":
                inicioSesionCliente(request, response);
            break;
            
            case "inicioSesionAdmin":
                inicioSesionAdmin(request, response);
            break;
            
        }
    }
    
    /****************************/
    /* INICIO DE SESIONES INDEX */
    /****************************/
    protected void inicioSesionProveedorAuto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,EJBException,PersistenceException {
        int idProveedor = (int)Integer.parseInt(request.getParameter("idProveedor"));
        int idSucursal = (int)Integer.parseInt(request.getParameter("idSucursal"));
        Sucursal sucursal = servicio.buscarSucursal(idSucursal);
        Proveedor proveedor = servicio.inicioSesionProveedor(idProveedor);
      
        if(proveedor != null && sucursal != null){
            request.getSession().setAttribute("proveedor",proveedor);
            request.getSession().setAttribute("sucursal", sucursal);
            
            switch(idProveedor){
                case 1:
                    response.sendRedirect("autosVolkswagen.jsp");
                    break;
                case 2:
                    response.sendRedirect("autosFord.jsp");
                    break;
                case 3:
                    response.sendRedirect("autosVolvo.jsp");
                    break;
                case 4:
                    response.sendRedirect("autosNissan.jsp");
                    break;
                case 5:
                    response.sendRedirect("autosToyota.jsp");
                    break;
                case 6:
                    response.sendRedirect("autosRenault.jsp");
                    break;
                case 7:
                    response.sendRedirect("autosHyundai.jsp");
                    break;
                case 8:
                    response.sendRedirect("autosKIA.jsp");
                    break;
                case 9:
                    response.sendRedirect("autosSeat.jsp");
                    break;
        
            }
            
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("sucursales.jsp").forward(request, response);
        }
        
    }
    
    protected void inicioSesionAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,EJBException,PersistenceException {
        int id = (int)Integer.parseInt(request.getParameter("idAdmin"));
        String pass = (String)request.getParameter("pass");
        Empleadorenta empleado = servicio.iniciaSesionEmpleado(id, pass);
        if(empleado != null){
            request.getSession().setAttribute("empleado",empleado);
            response.sendRedirect("fragmentaciones.jsp");
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }
    
    protected void inicioSesionSucursal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,EJBException,PersistenceException {
        int idSucursal = (int)Integer.parseInt(request.getParameter("idSucursal"));
        
        Sucursal sucursal = servicio.buscarSucursal(idSucursal);
        if(sucursal != null){
            request.getSession().setAttribute("sucursal",sucursal);
            response.sendRedirect("sucursales.jsp");
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }
    
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
