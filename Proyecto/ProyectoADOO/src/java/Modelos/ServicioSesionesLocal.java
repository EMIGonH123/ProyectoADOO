
package Modelos;

import EntidadesADOO.*;
import javax.ejb.Local;

@Local
public interface ServicioSesionesLocal {
    public Clienterenta iniciaSesionCliente(int idCliente, String pass);
    public Clienterenta buscarCliente(int idCliente);
    public Empleadorenta buscarEmpleado(int idEmpleado);
    public Empleadorenta iniciaSesionEmpleado(int idEmpleado, String pass);
    public Sucursal buscarSucursal(int idSucursal);
}
