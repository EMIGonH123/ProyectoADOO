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
    public Automovil buscarAuto(String matricula){
        return em.find(Automovil.class, matricula);
    }
    @Override
    public void borrarRenta(int idRenta){
        Renta renta = this.buscarRenta(idRenta);
         
        if(renta != null){
            Automovil auto = this.buscarAuto(renta.getMatricula());
            auto.setIdEstado(2);
            em.merge(auto);
            em.flush();
            em.refresh(auto);
            em.remove(renta);
        }
    }
    @Override
    public Renta buscarRenta(int idRenta){
        return em.find(Renta.class, idRenta);
    }
    
    @Override    
    public void crearRenta(int idCliente, String matricula, String descripcionRenta,
                            String fechaInicio,String fechaFin, double total,int unidades,int tipoPago){
        Renta renta = new Renta();
        renta.setIdCliente(idCliente);
        renta.setMatricula(matricula);
        renta.setDescripcionRenta(descripcionRenta);
        renta.setFechaInicioRenta(fechaInicio);
        renta.setFechaFinRenta(fechaFin);
        renta.setTotalRenta(total);
        renta.setUnidadesRenta(unidades);
        renta.setTipoPago(tipoPago);
        this.insertar(renta);
        Automovil auto = this.buscarAuto(matricula);
        auto.setIdEstado(1);
        em.merge(auto);
        em.flush();
        em.refresh(auto);
    }
    
    @Override
    public List<Automovil> getInfoDeAutosParaRentarAsociadosAlEmpleado(int idEmpleado){
        String sql = "SELECT a.* FROM Automovil a, Empleadorenta e, SucursalPersona sp,"
                + " Sucursal s"
                + " WHERE e.idEmpleado = sp.idEmpleado AND sp.idSucursal = s.idSucursal "
                + " AND s.idSucursal = a.idSucursal AND a.idEstado = 2 AND e.idEmpleado = "+idEmpleado;
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
    
    @Override
    public List<Object> getInfoRentasCliente(int idCliente){
        String sql = "SELECT r.*, s.*, a.nombreAuto, a.colorAuto, a.modeloAuto, a.kilometrajeAuto,"
                + " a.precioAuto, a.rutaAuto, ta.tipoAuto, am.nomMarca "
                + " FROM Renta r, Automovil a, Tipoauto ta, Automovilmarca am, Sucursal s"
                + " WHERE a.idSucursal = s.idSucursal AND "
                + " a.idMarca = am.idMarca AND "
                + " a.idTipo = ta.idTipo AND "
                + " r.matricula = a.matriculaAuto AND "
                + " r.idCliente = "+idCliente;
        return em.createNativeQuery(sql).getResultList();
    }
}
