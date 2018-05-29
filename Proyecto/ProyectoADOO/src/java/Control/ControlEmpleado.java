package Control;

import EntidadesADOO.*;
import Modelos.ServicioEmpleadoLocal;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlEmpleado", urlPatterns = {"/ControlEmpleado.do"})
public class ControlEmpleado extends HttpServlet {

    @EJB
    private ServicioEmpleadoLocal servicio;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        String val = request.getParameter("btnControlador");
        switch(val){
            case "verClientePorEmpleado":
                verClientePorEmpleado(request, response);
            break;
            case "borrarEmpleadoPorEmpleado":
                borrarEmpleadoPorEmpleado(request, response);
            break;            
        }        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        String val = request.getParameter("btnControlador");
        switch(val){
            case "crearClientePorEmpleado":
                crearClientePorEmpleado(request, response);
            break;
            case "editarEmpleadoPorEmpleado":
                editarEmpleadoPorEmpleado(request, response);
            break;
            case "editarCRUDClientePorEmpleado":
                editarCRUDClientePorEmpleado(request, response);
            break;
            case "nuevaRentaCliente":
                nuevaRentaCliente(request, response);
            break;
            case "nuevaCuentaCRUDCliente":
                nuevaCuentaCRUDCliente(request, response);
            break;
        }
    }

    protected void nuevaCuentaCRUDCliente(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String numCuenta = request.getParameter("numCuenta");
        int diasLimitePago = Integer.parseInt(request.getParameter("diasLimitePago"));
        double monto = Double.parseDouble(request.getParameter("monto"));
        String descripcionCuenta = request.getParameter("descripcionCuenta");
        Date fecha = servicio.getFechaActual();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = sdf.format(fecha);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
        String fechaLimite = sdf2.format(servicio.sumarFechasDias(fecha, diasLimitePago));
        
        
        servicio.crearCuentaCRUDCliente(numCuenta, idCliente, descripcionCuenta, monto, fechaActual, fechaLimite, monto, numCuenta);
        response.sendRedirect("crudCliente.jsp");
    }
    
    protected void nuevaRentaCliente(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
    
    }
    
    protected void borrarEmpleadoPorEmpleado(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException{
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        List<Object> clientesAsociados = servicio.getIDSDeClientesAsociadosAlEmpleado(idEmpleado);
        servicio.borrarEmpleadoPorEmpleado(idEmpleado, clientesAsociados);
        response.sendRedirect("index.jsp");
    }   
    protected void editarEmpleadoPorEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        String nombre = request.getParameter("nombreEmpleado");
        String apPaterno = request.getParameter("apPaterno");
        String apMaterno = request.getParameter("apMaterno");
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
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        String genero = request.getParameter("genero");
        servicio.editarEmpleadoPorEmpleado(idEmpleado, nombre, apPaterno, apMaterno, entidad, municipio,
                                            colonia, calle, noExterior, noInterior, cp, tel, email, pass, genero);
        response.sendRedirect("empleado.jsp");
     
    }
    
    protected void editarCRUDClientePorEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        String nombre = request.getParameter("nombre");
        String apPaterno = request.getParameter("apPaterno");
        String apMaterno = request.getParameter("apMaterno");
        String entidad = request.getParameter("estado");
        String municipio = request.getParameter("municipio");
        String colonia = request.getParameter("colonia");
        String calle = request.getParameter("calle");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String pass = request.getParameter("pass");
        String rfc = request.getParameter("rfc");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        int noExterior = Integer.parseInt(request.getParameter("numExterior"));
        int noInterior = Integer.parseInt(request.getParameter("numInterior"));
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String genero = request.getParameter("genero");
        servicio.editarClientePorEmpleado(idCliente, idEmpleado, nombre, apPaterno, apMaterno, rfc, entidad, municipio,
                                                colonia, calle, noExterior, noInterior, cp, tel, email, pass, genero);
        response.sendRedirect("crudCliente.jsp");
     
    }
    protected void crearClientePorEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        String nombre = request.getParameter("nombre");
        String apPaterno = request.getParameter("apPaterno");
        String apMaterno = request.getParameter("apMaterno");
        String entidad = request.getParameter("estado");
        String municipio = request.getParameter("municipio");
        String colonia = request.getParameter("colonia");
        String calle = request.getParameter("calle");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String pass = request.getParameter("pass");
        String rfc = request.getParameter("rfc");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        int noExterior = Integer.parseInt(request.getParameter("numExterior"));
        int noInterior = Integer.parseInt(request.getParameter("numInterior"));
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        String genero = request.getParameter("genero");
        servicio.crearClienteRentaPorEmpleadoRenta(idEmpleado, nombre, apPaterno, apMaterno, email, municipio, colonia,
                                                    calle, cp, rfc, tel, email, pass, noExterior, noInterior, genero);
        response.sendRedirect("empleado.jsp");
     
    }
    
    protected void verClientePorEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        Clienterenta cliente = servicio.buscarCliente(idCliente);
        if(cliente != null){
            request.getSession().setAttribute("cliente",cliente);
            response.sendRedirect("crudCliente.jsp");
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("empleado.jsp").forward(request, response);
        }
    }
}
