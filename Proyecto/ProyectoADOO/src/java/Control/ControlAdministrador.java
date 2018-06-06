
package Control;

import EntidadesADOO.Empleadorenta;
import Modelos.ServicioAdministradorLocal;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlAdministrador", urlPatterns = {"/ControlAdministrador.do"})
public class ControlAdministrador extends HttpServlet {
    @EJB
    private ServicioAdministradorLocal servicio;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        String val = request.getParameter("btnControlador");
        switch(val){
            case "verEmpleadoPorAdministrador":
                verEmpleadoPorAdministrador(request, response);
            break;
            case "borrarAdministradorPorAdministrador":
                borrarAdministradorPorAdministrador(request, response);
            break;           
        }        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        
        try {
            String val = request.getParameter("btnControlador");
            switch(val){
                
                case "editarAdministradorPorAdministrador":
                    editarAdministradorPorAdministrador(request, response);
                    break;
                case "crearEmpleadoPorAdministrador":
                    crearEmpleadoPorAdministrador(request, response);
                    break;
                    
                case "crearAdquisicionPorAdministrador":
                    crearAdquisicionPorAdministrador(request,response);
                    break;
                    
            }
        } catch (ParseException ex) {
            Logger.getLogger(ControlAdministrador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    protected void borrarAdministradorPorAdministrador(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException{
        int idEmpleado = Integer.parseInt(request.getParameter("idAdministrador"));
        List<Object> clientesAsociados = servicio.getIDSDeClientesAsociadosAlEmpleado(idEmpleado);
        servicio.borrarAdministradorPorAdministrador(idEmpleado, clientesAsociados);
        response.sendRedirect("index.jsp");
    }
    
    protected void crearAdquisicionPorAdministrador(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
        Random ran = new Random();
        int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombreAuto");
        double precioUnitario =0.0;
        switch(nombre){
            case "Jetta":
                precioUnitario = 159230.65;
            break;
            case "Golf":
                precioUnitario = 259230.65;
            break;
            case "Passat":
                precioUnitario = 369230.71;
            break;
            case "Bora":
                precioUnitario = 219230.65;
            break;
            case "Bocho":
                precioUnitario = 72230.21;
            break;
        }
        int modelo = Integer.parseInt(request.getParameter("modeloAuto"));
        int unidades = Integer.parseInt(request.getParameter("unidadesAuto"));
        double  precioTotal = unidades * precioUnitario;
        int idAdmin = Integer.parseInt(request.getParameter("idAdministrador"));
        int aux  = Integer.parseInt(request.getParameter("kilometraje"));
        int kilometraje;
        switch(aux){
            case 1:
                
                kilometraje= 10000 +((ran.nextInt())*(100000-10000));
                break;
            case 2:
                kilometraje= 100000 +((ran.nextInt())*(200000-100000));
                break;
            case 3:
                kilometraje= 200000 +((ran.nextInt())*(250000-200000));
                break;
            case 4:
                kilometraje= 250000 +((ran.nextInt())*(500000-250000));
                break;
        }
        String colorAuto = request.getParameter("colorAuto");
        int idMarca  = Integer.parseInt(request.getParameter("idMarca"));
        int idSucursal  = Integer.parseInt(request.getParameter("idSucursal"));
        int idTipo  = Integer.parseInt(request.getParameter("idTipo"));
        //String matricula = request.getParameter("matricula");
        int capacidad  = Integer.parseInt(request.getParameter("capacidad"));
        
        int idEstado = 2;
        
        response.sendRedirect("administrador.jsp");        
    }

    protected void crearEmpleadoPorAdministrador(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        Hashtable<String,Boolean> arreglo = new Hashtable<String,Boolean>();
        
        arreglo.put(request.getParameter("nombre"),true);
        arreglo.put(request.getParameter("apPaterno"),true);
        arreglo.put(request.getParameter("apMaterno"),true);
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
        arreglo.put(request.getParameter("tipo"),true);
        arreglo.put(request.getParameter("idSucursal"),true);
        arreglo.put(request.getParameter("genero"),true);
        if(servicio.validaCampos(arreglo)){
            String nombre = request.getParameter("nombre");
            String apPaterno = request.getParameter("apPaterno");
            String apMaterno = request.getParameter("apMaterno");
            String entidad = request.getParameter("estado");
            String municipio = request.getParameter("municipio");
            String colonia = request.getParameter("colonia");
            String calle = request.getParameter("calle");
            int cp = Integer.parseInt(request.getParameter("cp"));
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            int noExterior = Integer.parseInt(request.getParameter("numExterior"));
            int noInterior = Integer.parseInt(request.getParameter("numInterior"));
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            int idSucursal = Integer.parseInt(request.getParameter("idSucursal"));
            String genero = request.getParameter("genero");
            servicio.crearEmpleadoPorAdministrador(nombre, apPaterno, apMaterno, entidad, municipio, colonia, calle,
                                            tipo, noExterior, noInterior, cp, tel, email, pass, idSucursal, genero);
            request.setAttribute("msgRespuesta","Registro exitoso");
            request.getRequestDispatcher("administrador.jsp").forward(request, response);
        }else{
            String respuesta = "Campos incompletos para el registro";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("administrador.jsp").forward(request, response);
        }
    }   

    protected void editarAdministradorPorAdministrador(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        Hashtable<String,Boolean> arreglo = new Hashtable<String,Boolean>();
        
        arreglo.put(request.getParameter("idEmpleado"),true);
        arreglo.put(request.getParameter("nombreEmpleado"),true);
        arreglo.put(request.getParameter("apPaterno"),true);
        arreglo.put(request.getParameter("apMaterno"),true);
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
        arreglo.put(request.getParameter("genero"),true);
        if(servicio.validaCampos(arreglo)){
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            String nombre = request.getParameter("nombreEmpleado");
            String apPaterno = request.getParameter("apPaterno");
            String apMaterno = request.getParameter("apMaterno");
            String entidad = request.getParameter("estado");
            String municipio = request.getParameter("municipio");
            String colonia = request.getParameter("colonia");
            String calle = request.getParameter("calle");
            int cp = Integer.parseInt(request.getParameter("cp"));
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            int noExterior = Integer.parseInt(request.getParameter("numExterior"));
            int noInterior = Integer.parseInt(request.getParameter("numInterior"));
            String genero = request.getParameter("genero");
            servicio.editarAdministradorPorAdministrador(idEmpleado, nombre, apPaterno, apMaterno, entidad, municipio,
                    colonia, calle, noExterior, noInterior, cp, tel, email, pass, genero);
            request.setAttribute("msgRespuesta","Actualización del administrador exitosa");
            request.getRequestDispatcher("administrador.jsp").forward(request, response);
        }else{
            String respuesta = "Campos incompletos para la actualización del administrador";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("administrador.jsp").forward(request, response);
        }
        
    }
    
    protected void verEmpleadoPorAdministrador(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        Empleadorenta empleado = servicio.buscarEmpleado(idEmpleado);
        if(empleado != null){
            request.getSession().setAttribute("empleado",empleado);
            response.sendRedirect("empleado.jsp");
        }else{
            request.setAttribute("msgRespuesta","No existe el usuario");
            request.getRequestDispatcher("administrador.jsp").forward(request, response);
        }
    }
}
