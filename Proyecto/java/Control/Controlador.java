package Control;

import EntidadesADOO.*;
import java.io.IOException;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelos.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Iterator;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Controlador extends HttpServlet {

    private ServiciosLocal servicio;

    //Funcion general
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , EJBException{
        String val = request.getParameter("btnControlador");
        switch(val){
            //
            case "verEmpleadoPorAdministrador":
                verEmpleadoPorAdministrador(request, response);
            break;
            case "verClientePorEmpleado":
                verClientePorEmpleado(request, response);
            break;
            
            case "borrarAdministradorPorAdministrador":
                borrarAdministradorPorAdministrador(request, response);
            break;
            //
            case "borrarEmpleadoPorEmpleado":
                borrarEmpleadoPorEmpleado(request, response);
            break;            
        }        
    }
    
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
                
                case "editarAdministradorPorAdministrador":
                    editarAdministradorPorAdministrador(request, response);
                break;
                    //
                case "crearEmpleadoPorAdministrador":
                    crearEmpleadoPorAdministrador(request, response);
                break;
                    
                case "crearAdquisicionPorAdministrador":
                    crearAdquisicionPorAdministrador(request,response);
                break;
                //
                case "crearClientePorEmpleado":
                    crearClientePorEmpleado(request, response);
                break;
                //
                case "editarEmpleadoPorEmpleado":
                    editarEmpleadoPorEmpleado(request, response);
                break;
                //
                case "editarCRUDClientePorEmpleado":
                    editarCRUDClientePorEmpleado(request, response);
                break;
                //
                case "nuevaRentaCliente":
                    nuevaRentaCliente(request, response);
                break;
                //
                case "nuevaCuentaCRUDCliente":
                    nuevaCuentaCRUDCliente(request, response);
                break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //FUNCIONES DEL SWITCH
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
        String genero = request.getParameter("genero");
        servicio.crearClienteRentaPorEmpleadoRenta(idEmpleado, nombre, apPaterno, apMaterno, email, municipio, colonia,
                                                    calle, cp, rfc, tel, email, pass, noExterior, noInterior, genero);
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
        
        List<Object> lista = servicio.obtenerAtributosDeTabla(nombre);
        Iterator<Object> i = lista.iterator();
        while(i.hasNext()){
            out.println("<tr>");
            out.println("<td>");
            //String aux = new String((String)i.next());
            /*Object o = (Object)i.next();
            if(o instanceof String){
                out.println("String");
            }*/
            //out.println((String)i.next());
            out.println("</td>");
            out.println("</tr>");
        }
        
        out.println("</tbody>");
        out.println("</table>");
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
    
    protected void borrarEmpleadoPorEmpleado(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException{
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        List<Object> clientesAsociados = servicio.getIDSDeClientesAsociadosAlEmpleado(idEmpleado);
        servicio.borrarEmpleadoPorEmpleado(idEmpleado, clientesAsociados);
        response.sendRedirect("index.jsp");
    }    
    
    protected void borrarAdministradorPorAdministrador(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException{
        int idEmpleado = Integer.parseInt(request.getParameter("idAdministrador"));
        List<Object> clientesAsociados = servicio.getIDSDeClientesAsociadosAlEmpleado(idEmpleado);
        servicio.borrarEmpleadoPorEmpleado(idEmpleado, clientesAsociados);
        response.sendRedirect("index.jsp");
    }
    
    protected void crearAdquisicionPorAdministrador(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException, ParseException{
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
        int idEmpleado = Integer.parseInt(request.getParameter("idAdministrador"));
        int kilometraje  = Integer.parseInt(request.getParameter("kilometraje"));
        String colorAuto = request.getParameter("colorAuto");
        int idMarca  = Integer.parseInt(request.getParameter("idMarca"));
        int idSucursal  = Integer.parseInt(request.getParameter("idSucursal"));
        int idTipo  = Integer.parseInt(request.getParameter("idTipo"));
        String matricula = request.getParameter("matricula");
        int capacidad  = Integer.parseInt(request.getParameter("capacidad"));
        
        int idEstado = 2;
        response.sendRedirect("administrador.jsp");        
    }

    protected void crearEmpleadoPorAdministrador(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
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
        response.sendRedirect("administrador.jsp");
        
    }   

    protected void editarAdministradorPorAdministrador(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
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
        servicio.editarEmpleadoPorEmpleado(idEmpleado, nombre, apPaterno, apMaterno, entidad, municipio,
                colonia, calle, noExterior, noInterior, cp, tel, email, pass, genero);
        response.sendRedirect("administrador.jsp");
        
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