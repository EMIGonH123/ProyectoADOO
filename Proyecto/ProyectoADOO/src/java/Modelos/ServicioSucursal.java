
package Modelos;

import EntidadesADOO.Sucursal;
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

    
}
