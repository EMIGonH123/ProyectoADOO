
package Modelos;

import EntidadesADOO.*;
import java.util.List;
import javax.ejb.Local;


@Local
public interface ServicioSucursalLocal {
    public Sucursal buscarSucursal(int idSucursal);
    public List<Sucursal> getInfoDeSucursal(int idSucursal);
    public List<Proveedor> getInfoProveedor(int idProveedor);
}
