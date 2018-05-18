package Modelos;
import EntidadesADOO.*;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.ejb.Local;

@Local
public interface ServiciosLocal {

    /************/
    /* SUCURSAL */
    /************/
    public Empleadorenta buscarEmpleado(int idEmpleado);
    public Clienterenta buscarCliente(int idCliente);
    public Cuenta buscarCuenta(String numCuenta);
    public Detallecuenta buscarDetalleCuenta(int idDetalleCuenta);
    public Empleadorenta iniciaSesionEmpleado(int idEmpleado, String pass);
    public Clienterenta iniciaSesionCliente(int idCliente, String pass);
    public List<Empleadorenta> getInfoAdministrador(int idAdmin);
    public List<Object> getInfoSucursales();
    public List<Object> getInfoProveedores();
    public List<Empleadorenta> getEmpleadosAsociadosAlAdministrador();
    public List<Automovilmarca> getMarcaDeAutos();
    public List<Tipoauto> getTipoDeAutos();
    public void editarClientePorEmpleado(int idCliente, int idEmpleado, String nombre,String apPaterno, String apMaterno,
                String rfc, String entidad, String municipio, String colonia, String calle, int noExterior,
                int noInterior, int cp, String tel, String email, String pass, String genero);

    public void editarEmpleadoPorEmpleado(int idEmpleado, String nombre,String apPaterno, String apMaterno,
            String entidad, String municipio, String colonia, String calle,
            int noExterior, int noInterior, int cp, String tel, String email, String pass,String genero);
    
    public void crearEmpleadoPorAdministrador(String nombre,String apPaterno, String apMaterno,
        String entidad, String municipio, String colonia, String calle,int idTipo,
        int noExterior, int noInterior, int cp, String tel, String email, String pass, int idSucursal,String genero);
    public List<Object> getInfoDeSucursalPorAdministrador(int idAdmistrador);
    public List<Clienterenta> getClientesAsociadosAlAdministrador(int idAdministrador);
    public List<Object> getIdsDeAdministradores();
    public void crearClienteRentaPorEmpleadoRenta(int idAdmin, String nombre, String apPaterno,String apMaterno,
                                                String estado, String municipio, String colonia, String calle,int cp,
                                                String rfc, String tel,String email, String pass, int noExterior, int noInterior,String genero);

    public void borrarEmpleadoPorEmpleado(int idEmpleado, List<Object> clientesAsociados);
    public List<Clienterenta> getClientesAsociadosAlEmpleado(int idEmpleado);
    public List<Object> getIDSDeClientesAsociadosAlEmpleado(int idEmpleado);
    public List<Clienterenta> getInfoCliente(int idCliente);
    public void borrarCRUDClientePorEmpleado(int idCliente);
    public List<Automovil> getInfoDeAutosParaRentarAsociadosAlEmpleado(int idEmpleado);
    public Date getFechaActual();
    public Date sumarFechasDias(Date fecha, int dias);
    public void crearCuentaCRUDCliente(String numCuenta, int idCliente,String descripcionCuenta, double monto,
                                        String fechaAdquisicion, String fechaLimitePago, double pagoMinimo, String intereses);
    public void crearNuevoPrestamoCRUDCliente(String numCuenta, double monto,
                                        String fechaAdquisicion, String fechaLimitePago, double pagoMinimo, String intereses);

    public List<Object> getInfoCuentasDeCliente(int idCliente);
    public List<Detallecuenta> getDetalleCuentasDeCliente(int idCliente);
    public List<Object> getTablasDeLaBD();
    public List<Object> obtenerAtributosDeTabla(String nombre);
    
}
