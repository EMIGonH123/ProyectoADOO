package Modelos;
import EntidadesADOO.*;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
@Stateless
public class ServicioCrudCliente implements ServicioCrudClienteLocal {

    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public List<Automovil> getInfoDeAutosParaRentarAsociadosAlEmpleado(int idEmpleado){
        String sql = "SELECT a.* FROM Automovil a, Empleadorenta e, SucursalPersona sp,"
                + " Sucursal s"
                + " WHERE e.idEmpleado = sp.idEmpleado AND sp.idSucursal = s.idSucursal "
                + " AND s.idSucursal = a.idSucursal AND e.idEmpleado = "+idEmpleado;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Clienterenta> getInfoCliente(int idCliente){
        String sql = "SELECT * FROM Clienterenta  WHERE idCliente = "+idCliente;
        return (List<Clienterenta>)em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Object> getInfoCuentasDeCliente(int idCliente){
        String sql = "SELECT c.numeroDeCuenta, c.saldo, dc.* "
                + " FROM Cuenta c, DetalleCuenta dc, Clienterenta cr "
                + " WHERE cr.idCliente = c.idCliente AND c.idDetalleCuenta = dc.idDetalleCuenta "
                + " AND c.idCliente = "+idCliente;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Detallecuenta> getDetalleCuentasDeCliente(int idCliente){
        String sql = "SELECT dc.* "
                + " FROM DetalleCuenta dc, Clienterenta cr, Cuenta c"
                + " WHERE cr.idCliente = c.idCliente AND c.idDetalleCuenta = dc.idDetalleCuenta "
                + " AND c.idCliente = "+idCliente;
        return em.createNativeQuery(sql).getResultList();
    }
}
