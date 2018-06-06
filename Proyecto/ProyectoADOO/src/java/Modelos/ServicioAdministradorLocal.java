
package Modelos;

import EntidadesADOO.*;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioAdministradorLocal {
    public List<Empleadorenta> getEmpleadosAsociadosAlAdministrador();
    public List<Empleadorenta> getInfoAdministrador(int idAdmin);
    public Empleadorenta buscarEmpleado(int idEmpleado);
    public Empleadorenta iniciaSesionEmpleado(int idEmpleado, String pass);
    public void crearEmpleadoPorAdministrador(String nombre,String apPaterno, String apMaterno,
        String entidad, String municipio, String colonia, String calle,int idTipo,
        int noExterior, int noInterior, int cp, String tel, String email, String pass, int idSucursal,String genero);

    public List<Clienterenta> getClientesAsociadosAlAdministrador(int idAdministrador);
    
    public List<Object> getIDSDeClientesAsociadosAlEmpleado(int idEmpleado);
    public void editarAdministradorPorAdministrador(int idEmpleado, String nombre,String apPaterno, String apMaterno,
        String entidad, String municipio, String colonia, String calle,
        int noExterior, int noInterior, int cp, String tel, String email, String pass,String genero);
    public void borrarAdministradorPorAdministrador(int idEmpleado, List<Object> clientesAsociados);
    public List<Object> getInfoSucursales();
    public List<Object> getInfoProveedores();
    public List<Automovilmarca> getMarcaDeAutos();
    public List<Tipoauto> getTipoDeAutos();
    public boolean validaCampos(Hashtable<String,Boolean> a);
    public boolean validarCadenas(String cadena);
    public boolean validarDigitos(String digitos);
    public boolean validarEmail(String email);

}
