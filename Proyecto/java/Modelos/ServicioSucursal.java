
package Modelos;

import EntidadesADOO.*;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioSucursal implements ServicioSucursalLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;
    
    @Override
    public Sucursal buscarSucursal(int idSucursal) {
        return em.find(Sucursal.class,idSucursal);
    }

    @Override
    public List<Sucursal> getInfoDeSucursal(int idSucursal) {
        String sql = "SELECT  * FROM Sucursal WHERE idSucursal = "+idSucursal;
        return em.createNativeQuery(sql).getResultList();
    }

    @Override
    public List<Proveedor> getInfoProveedor(int idProveedor) {
        String sql = "SELECT  * FROM Proveedor WHERE idProveedor = "+idProveedor;
        return em.createNativeQuery(sql).getResultList();
    }

    @Override
    public List<Automovil> getAutosAsociadosASucursal(int idSucursal, String marca) {
        String sql = "SELECT a.*, ea.estadoAuto, ta.tipoAuto "
                + " FROM Automovil a, Estadoauto ea, Tipoauto ta "
                + " WHERE ea.idEstado = a.idEstado  AND a.idTipo = ta.idTipo AND idSucursal = "+idSucursal+
                " AND idMarca = (SELECT idMarca FROM Automovilmarca WHERE nomMarca = '"+marca+"')";
        return em.createNativeQuery(sql).getResultList();
    }

    
}
