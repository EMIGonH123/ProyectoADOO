package Control;

import EntidadesADOO.*;
import Modelos.ServicioCrudClienteLocal;
import Modelos.ServicioEmpleadoLocal;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
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
    
    @EJB
    private ServicioCrudClienteLocal servicioCrud;

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
            case "borraRenta":
                borraRenta(request, response);
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
        Hashtable<String,Boolean> arreglo = new Hashtable<String,Boolean>();
        
        arreglo.put(request.getParameter("numCuenta"),true);
        arreglo.put(request.getParameter("diasLimitePago"),true);
        arreglo.put(request.getParameter("monto"),true);
        arreglo.put(request.getParameter("descripcionCuenta"),true);
        if(servicio.validaCampos(arreglo)){
            int cont =0;
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            String numCuenta = request.getParameter("numCuenta");
            String descripcionCuenta = request.getParameter("descripcionCuenta");
            int diasLimitePago = 0;
            double monto = 0.0;
            
            if(servicio.validarDigitos(request.getParameter("diasLimitePago"))){
                diasLimitePago = Integer.parseInt(request.getParameter("diasLimitePago"));
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("monto"))){
                monto = Double.parseDouble(request.getParameter("monto"));
                cont ++;
            }
            Date fecha = servicio.getFechaActual();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String fechaActual = sdf.format(fecha);
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
            String fechaLimite = sdf2.format(servicio.sumarFechasDias(fecha, diasLimitePago));

            if(cont  == 2){
                servicio.crearCuentaCRUDCliente(numCuenta, idCliente, descripcionCuenta, monto, fechaActual, fechaLimite, monto, numCuenta);
                response.sendRedirect("crudCliente.jsp");
                String respuesta = "Creación de la cuenta exitosa";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
            }else{
                String respuesta = "Algunos campos son incorrectos para la creación de la cuenta";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
            }
        }else{
            String respuesta = "Campos incompletos para la creación de la cuenta";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
        }
    }
    
    protected void nuevaRentaCliente(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        Hashtable<String,Boolean> arreglo = new Hashtable<String,Boolean>();
        
        arreglo.put(request.getParameter("fechaInicio"),true);
        arreglo.put(request.getParameter("fechaFin"),true);
        arreglo.put(request.getParameter("descripcionRenta"),true);
        if(servicio.validaCampos(arreglo)){
        
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            String fechaInicio = request.getParameter("fechaInicio");
            String fechaFin = request.getParameter("fechaFin");
            String matricula = request.getParameter("matricula");
            int idTipoPago = Integer.parseInt(request.getParameter("idTipoPago"));
            String descripcionRenta = request.getParameter("descripcionRenta");
            Automovil auto = servicioCrud.buscarAuto(matricula);
            if(auto != null){
                if(auto.getIdEstado() == 2){
                    double total = auto.getPrecioAuto();
                    servicioCrud.crearRenta(idCliente, matricula, descripcionRenta, fechaInicio, fechaFin, total, 1, idTipoPago);
                    
                    String respuesta = "creación de renta exitosa";
                    request.setAttribute("msgRespuesta",respuesta);
                    request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
                }else{
                    request.setAttribute("msgRespuesta","El auto esta rentado actualmente");
                    request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
                }
            }
        }else{
            String respuesta = "Campos incompletos para la creación de la renta";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
        }
        
    }
    
    protected void borrarEmpleadoPorEmpleado(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException{
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        List<Object> clientesAsociados = servicio.getIDSDeClientesAsociadosAlEmpleado(idEmpleado);
        servicio.borrarEmpleadoPorEmpleado(idEmpleado, clientesAsociados);
        response.sendRedirect("index.jsp");
    }
    protected void borraRenta(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, EJBException{
        int idRenta = Integer.parseInt(request.getParameter("idRenta"));
        servicioCrud.borrarRenta(idRenta);
        response.sendRedirect("crudCliente.jsp");
    } 
    
    protected void editarEmpleadoPorEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, EJBException{
        Hashtable<String,Boolean> arreglo = new Hashtable<String,Boolean>();
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
        arreglo.put(request.getParameter("idEmpleado"),true);
        arreglo.put(request.getParameter("genero"),true);
        if(servicio.validaCampos(arreglo)){
            int cont = 0;
            String nombre= "";
            String apPaterno = "";
            String apMaterno = "";
            String entidad = request.getParameter("estado");
            String municipio = request.getParameter("municipio");
            String colonia = request.getParameter("colonia");
            String calle = request.getParameter("calle");
            int cp =0;
            String pass = request.getParameter("pass");
            String tel = "";
            String email = "";
            int noExterior = 0;
            int noInterior = 0;
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            String genero = request.getParameter("genero");
            
            if(servicio.validarCadenas(request.getParameter("nombreEmpleado"))){
                nombre = request.getParameter("nombreEmpleado");
                cont ++;
            }
            if(servicio.validarCadenas(request.getParameter("apPaterno"))){
                apPaterno = request.getParameter("apPaterno");
                cont ++;
            }
            if(servicio.validarCadenas(request.getParameter("apMaterno"))){
                apMaterno = request.getParameter("apMaterno");
                cont ++;
            }
            
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
            if(cont == 8){
                servicio.editarEmpleadoPorEmpleado(idEmpleado, nombre, apPaterno, apMaterno, entidad,
                        municipio, colonia, calle, noExterior, noInterior, cp, tel, email, pass, genero);
                
                request.setAttribute("msgRespuesta","Actualización del empleado exitosa");
                request.getRequestDispatcher("empleado.jsp").forward(request, response);
            }else{
                request.setAttribute("msgRespuesta","Algunos valores no son validos para actualizar");
                request.getRequestDispatcher("empleado.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("msgRespuesta","Campos incompletos para la actualización del empleado");
            request.getRequestDispatcher("empleado.jsp").forward(request, response);
        }
     
    }
    
    protected void editarCRUDClientePorEmpleado(HttpServletRequest request, HttpServletResponse response)
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
        arreglo.put(request.getParameter("rfc"),true);
        arreglo.put(request.getParameter("idEmpleado"),true);
        arreglo.put(request.getParameter("idCliente"),true);
        arreglo.put(request.getParameter("genero"),true);
        if(servicio.validaCampos(arreglo)){
            int cont = 0;
            String nombre = "";
            String apPaterno = "";
            String apMaterno = "";
            String entidad = request.getParameter("estado");
            String municipio = request.getParameter("municipio");
            String colonia = request.getParameter("colonia");
            String calle = request.getParameter("calle");
            int cp = 0;
            String pass = request.getParameter("pass");
            String rfc = request.getParameter("rfc");
            String tel = "";
            String email = "";
            int noExterior = 0;
            int noInterior = 0;
            int idEmpleado = 0;
            int idCliente = 0;
            String genero = request.getParameter("genero");
            if(servicio.validarCadenas(request.getParameter("nombre"))){
                nombre = request.getParameter("nombre");
                cont ++;
            }
            if(servicio.validarCadenas(request.getParameter("apPaterno"))){
                apPaterno = request.getParameter("apPaterno");
                cont ++;
            }
            if(servicio.validarCadenas(request.getParameter("apMaterno"))){
                apMaterno = request.getParameter("apMaterno");
                cont ++;
            }
            
            if(servicio.validarDigitos(request.getParameter("cp"))){
                cp = Integer.parseInt(request.getParameter("cp"));
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("numExterior"))){
                 noExterior = Integer.parseInt(request.getParameter("numExterior"));
                cont ++;
            }
            
            if(servicio.validarDigitos(request.getParameter("idEmpleado"))){
                 idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("idCliente"))){
                 idCliente = Integer.parseInt(request.getParameter("idCliente"));
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
            if(cont == 10){
                servicio.editarClientePorEmpleado(idCliente, idEmpleado, nombre, apPaterno, apMaterno, rfc, entidad, municipio,
                                                    colonia, calle, noExterior, noInterior, cp, tel, email, pass, genero);
                String respuesta = "Actualización del crudCliente exitosa";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
            }else{
                String respuesta = "Algunos valores no son validos para actualizar";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
            }
        }else{
            String respuesta = "Campos incompletos para la actualización del CrudCliente";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("crudCliente.jsp").forward(request, response);
        }
     
    }
    protected void crearClientePorEmpleado(HttpServletRequest request, HttpServletResponse response)
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
        arreglo.put(request.getParameter("rfc"),true);
        arreglo.put(request.getParameter("idEmpleado"),true);
        arreglo.put(request.getParameter("genero"),true);
        if(servicio.validaCampos(arreglo)){
            int cont = 0;
            String nombre = "";
            String apPaterno = "";
            String apMaterno = "";
            String entidad = request.getParameter("estado");
            String municipio = request.getParameter("municipio");
            String colonia = request.getParameter("colonia");
            String calle = request.getParameter("calle");
            int cp = 0;
            String pass = request.getParameter("pass");
            String rfc = request.getParameter("rfc");
            String tel = "";
            String email = "";
            int noExterior = 0;
            int noInterior = 0;
            int idEmpleado = 0;
            String genero = request.getParameter("genero");
            if(servicio.validarCadenas(request.getParameter("nombre"))){
                nombre = request.getParameter("nombre");
                cont ++;
            }
            if(servicio.validarCadenas(request.getParameter("apPaterno"))){
                apPaterno = request.getParameter("apPaterno");
                cont ++;
            }
            if(servicio.validarCadenas(request.getParameter("apMaterno"))){
                apMaterno = request.getParameter("apMaterno");
                cont ++;
            }
            
            if(servicio.validarDigitos(request.getParameter("cp"))){
                cp = Integer.parseInt(request.getParameter("cp"));
                cont ++;
            }
            if(servicio.validarDigitos(request.getParameter("numExterior"))){
                 noExterior = Integer.parseInt(request.getParameter("numExterior"));
                cont ++;
            }
            
            if(servicio.validarDigitos(request.getParameter("idEmpleado"))){
                 idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
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
            if(cont == 9){
                servicio.crearClienteRentaPorEmpleadoRenta(idEmpleado, nombre, apPaterno, apMaterno, email, municipio, colonia,
                                                        calle, cp, rfc, tel, email, pass, noExterior, noInterior, genero);
                request.setAttribute("msgRespuesta","Registro exitoso por empleado");
                request.getRequestDispatcher("empleado.jsp").forward(request, response);
                
            }else{
                String respuesta = "Algunos valores no son validos";
                request.setAttribute("msgRespuesta",respuesta);
                request.getRequestDispatcher("empleado.jsp").forward(request, response);
            }
        }else{
            String respuesta = "Campos incompletos para el registro del cliente";
            request.setAttribute("msgRespuesta",respuesta);
            request.getRequestDispatcher("empleado.jsp").forward(request, response);
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
}
