
package Modelos;

import EntidadesADOO.*;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioEmpleadoLocal {
    public List<Object> getIdsDeAdministradores();
    public List<Empleadorenta> getInfoEmpleado(int idEmpleado);
    public Empleadorenta buscarEmpleado(int idEmpleado);
    public void editarClientePorEmpleado(int idCliente, int idEmpleado, String nombre,String apPaterno, String apMaterno,
            String rfc, String entidad, String municipio, String colonia, String calle, int noExterior,
            int noInterior, int cp, String tel, String email, String pass, String genero);
    public void editarEmpleadoPorEmpleado(int idEmpleado, String nombre,String apPaterno, String apMaterno,
        String entidad, String municipio, String colonia, String calle,
        int noExterior, int noInterior, int cp, String tel, String email, String pass,String genero);

    public void crearClienteRentaPorEmpleadoRenta(int idAdmin, String nombre, String apPaterno,String apMaterno,
                                            String estado, String municipio, String colonia, String calle,int cp,
                                            String rfc, String tel,String email, String pass, int noExterior, int noInterior,String genero);
    public void borrarEmpleadoPorEmpleado(int idEmpleado, List<Object> clientesAsociados);
    public List<Clienterenta> getClientesAsociadosAlEmpleado(int idEmpleado);
    public List<Object> getIDSDeClientesAsociadosAlEmpleado(int idEmpleado);
    public void borrarCRUDClientePorEmpleado(int idCliente);

    public void crearCuentaCRUDCliente(String numCuenta, int idCliente,String descripcionCuenta, double monto,
                                        String fechaAdquisicion, String fechaLimitePago, double pagoMinimo, String intereses);
    public void crearNuevoPrestamoCRUDCliente(String numCuenta, double monto,
                                        String fechaAdquisicion, String fechaLimitePago, double pagoMinimo, String intereses);
    public Clienterenta buscarCliente(int idCliente);
    public Cuenta buscarCuenta(String numCuenta);
    public Detallecuenta buscarDetalleCuenta(int idDetalleCuenta);
    public Date getFechaActual();
    public Date sumarFechasDias(Date fecha, int dias);
    public List<Object> getInfoDeSucursalPorAdministrador(int idAdmistrador);
    public boolean validaCampos(Hashtable<String,Boolean> a);
    public boolean validarCadenas(String cadena);
    public boolean validarDigitos(String digitos);
    public boolean validarEmail(String email);
}
