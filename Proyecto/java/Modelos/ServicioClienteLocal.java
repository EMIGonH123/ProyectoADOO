
package Modelos;

import EntidadesADOO.*;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioClienteLocal {
    public void editarClientePorCliente(int idCliente, String entidad, String municipio, String colonia, String calle,
                                        int noExterior, int noInterior, int cp, String tel, String email, String pass);
    public List<Clienterenta> getInfoCliente(int idCliente);
    public Clienterenta buscarCliente(int idCliente);
    public List<Object> getInfoRentasCliente(int idCliente);
    public List<Empleadorenta> getInfoEmpleado(int idEmpleado);
}