package Modelos;

import EntidadesADOO.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioEmpleado implements ServicioEmpleadoLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public List<Object> getInfoDeSucursalPorAdministrador(int idAdmistrador) {
        String sql = "SELECT s.* FROM EmpleadoRenta er , SucursalPersona sp, Sucursal s"
                    + " WHERE er.idEmpleado = sp.idEmpleado AND  sp.idSucursal = s.idSucursal"
                    + " AND er.idEmpleado = "+idAdmistrador;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public void editarClientePorEmpleado(int idCliente,int idEmpleado, String nombre, String apPatereno, String apMaterno,
            String rfc, String entidad, String municipio, String colonia, String calle,
            int noExterior, int noInterior, int cp, String tel, String email, String pass,String genero) {
        
        Clienterenta cliente = buscarCliente(idCliente);
        cliente.setIdEmpleado(idEmpleado);
        cliente.setNombreCliente(nombre);
        cliente.setApPaterno(apPatereno);
        cliente.setApMaterno(apMaterno);
        cliente.setRfcCliente(rfc);
        cliente.setEntidadCliente(entidad);
        cliente.setMunicipioCliente(municipio);
        cliente.setColoniaCliente(colonia);
        cliente.setCalleCliente(calle);
        cliente.setNoExterior(noExterior);
        cliente.setNoInterior(noInterior);
        cliente.setGeneroCliente(genero);
        cliente.setCpCliente(cp);
        cliente.setTelCliente(tel);
        cliente.setEmailCliente(email);
        cliente.setPassCliente(pass);
        em.merge(cliente);
        em.flush();
        em.refresh(cliente);
    }

    
    @Override
    public Clienterenta buscarCliente(int idCliente){
        return em.find(Clienterenta.class, idCliente);
    }
    
    @Override
    public Date getFechaActual(){
        Date ahora = new Date();
        return ahora;
    }
    
    @Override
    public Date sumarFechasDias(Date fecha, int dias) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        cal.add(Calendar.DAY_OF_YEAR, dias);
        return cal.getTime();
    }
    
    @Override
    public void borrarCRUDClientePorEmpleado(int idCliente){
        Clienterenta cliente = this.buscarCliente(idCliente);
        if(cliente != null){
            em.remove(cliente);
            em.flush();
        }
    }
    
    @Override
    public Empleadorenta buscarEmpleado(int idEmpleado){
        return em.find(Empleadorenta.class, idEmpleado);
    }

    @Override
    public void editarEmpleadoPorEmpleado(int idEmpleado, String nombre, String apPaterno,
            String apMaterno, String entidad, String municipio, String colonia, String calle,
            int noExterior, int noInterior, int cp, String tel, String email, String pass,String genero) {
        
        Empleadorenta empleado = buscarEmpleado(idEmpleado);
        empleado.setIdEmpleado(idEmpleado);
        empleado.setNombreEmpleado(nombre);
        empleado.setApPaternoEmpleado(apPaterno);
        empleado.setApMaternoEmpleado(apMaterno);
        empleado.setEntidadEmpleado(entidad);
        empleado.setMunicipioEmpleado(municipio);
        empleado.setColoniaEmpleado(colonia);
        empleado.setCalleEmpleado(calle);
        empleado.setGeneroEmpleado(genero);
        empleado.setNoExterior(noExterior);
        empleado.setNoInterior(noInterior);
        empleado.setCpEmpleado(cp);
        empleado.setTelEmpleado(tel);
        empleado.setEmailEmpleado(email);
        empleado.setPassEmpleado(pass);
        em.merge(empleado);
        em.flush();
        em.refresh(empleado);
    }
 
    @Override
        public void crearClienteRentaPorEmpleadoRenta(int idAdmin, String nombre, String apPaterno,String apMaterno,
                                                String estado, String municipio, String colonia, String calle,int cp,
                                                String rfc, String tel,String email, String pass, int noExterior, int noInterior,String genero){
        
        Clienterenta cliente = new Clienterenta();
        cliente.setIdEmpleado(idAdmin);
        cliente.setNombreCliente(nombre);
        cliente.setApPaterno(apPaterno);
        cliente.setApMaterno(apMaterno);
        cliente.setEntidadCliente(estado);
        cliente.setGeneroCliente(genero);
        cliente.setMunicipioCliente(municipio);
        cliente.setColoniaCliente(colonia);
        cliente.setCalleCliente(calle);
        cliente.setCpCliente(cp);
        cliente.setRfcCliente(rfc);
        cliente.setTelCliente(tel);
        cliente.setEmailCliente(email);
        cliente.setPassCliente(pass);
        cliente.setNoExterior(noExterior);
        cliente.setNoInterior(noInterior);
        this.insertar(cliente);

    }
        
    @Override
    public List<Clienterenta> getClientesAsociadosAlEmpleado(int idEmpleado) {
        String sql ="SELECT c.* FROM ClienteRenta c, EmpleadoRenta e WHERE "
                + " e.idEmpleado = c.idEmpleado AND e.idEmpleado = "+idEmpleado;
        return em.createNativeQuery(sql).getResultList();
    }    
    
    @Override
    public List<Object> getIdsDeAdministradores() {
        String sql = "SELECT e.idEmpleado FROM EmpleadoRenta e WHERE e.idTipoEmpleado = 2";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Empleadorenta> getInfoEmpleado(int idEmpleado){
        String sql = "SELECT * FROM Empleadorenta WHERE idEmpleado ="+idEmpleado;
        return em.createNativeQuery(sql).getResultList();
    }
    @Override
    public void borrarEmpleadoPorEmpleado(int idEmpleado, List<Object> clientesAsociados) throws EJBException{
        Empleadorenta empleado = this.buscarEmpleado(idEmpleado);
        if(!clientesAsociados.isEmpty()){
            Iterator<Object> i = clientesAsociados.iterator();
            while(i.hasNext()){
                int idCliente = (int)i.next();
                Clienterenta aux = this.buscarCliente(idCliente);
                if(aux != null){
                    em.remove(aux);
                    em.flush();
                    i.remove();
                }
            }
        }
        if(empleado != null){
            em.remove(empleado);
            em.flush();
        }

    }

    @Override
    public List<Object> getIDSDeClientesAsociadosAlEmpleado(int idEmpleado) {
        String sql ="SELECT c.idCliente FROM ClienteRenta c, EmpleadoRenta e WHERE "
                + " e.idEmpleado = c.idEmpleado AND e.idEmpleado = "+idEmpleado;
        return em.createNativeQuery(sql).getResultList();
    }
   
    @Override
    public void crearCuentaCRUDCliente(String numCuenta, int idCliente,String descripcionCuenta, double monto,
                                    String fechaAdquisicion, String fechaLimitePago, double pagoMinimo, String intereses){
        if(this.buscarCuenta(numCuenta) == null){
            Detallecuenta dc = new Detallecuenta();
            Cuenta c = new Cuenta();
            
            dc.setDetalleCuenta(descripcionCuenta);
            dc.setFechaAdquisicionSaldo(fechaAdquisicion);
            dc.setFechaLimitePago(fechaLimitePago);
            dc.setIntereses(intereses);
            dc.setPagoMinimo(pagoMinimo);
            this.insertar(dc);
            
            c.setNumeroDeCuenta(numCuenta);
            c.setIdCliente(idCliente);
            c.setIdDetalleCuenta(dc.getIdDetalleCuenta());
            c.setSaldo(monto);
            this.insertar(c);
        }
    }
    
    @Override
    public void crearNuevoPrestamoCRUDCliente(String numCuenta, double monto,
                                        String fechaAdquisicion, String fechaLimitePago, double pagoMinimo, String intereses){
        Cuenta c = this.buscarCuenta(numCuenta);
        Detallecuenta dc = this.buscarDetalleCuenta(c.getIdDetalleCuenta());
        if(c != null && dc != null ){
            Detallecuenta dc2 = new Detallecuenta();
            dc2.setFechaAdquisicionSaldo(fechaAdquisicion);
            dc2.setFechaLimitePago(fechaLimitePago);
            dc2.setDetalleCuenta(dc.getDetalleCuenta());
            dc2.setIntereses(intereses);
            dc2.setPagoMinimo(pagoMinimo);
            this.insertar(dc2);
            
            double montoNuevo = c.getSaldo()+monto;
            c.setSaldo(montoNuevo);
            em.merge(c);
            em.flush();
            em.refresh(c);
        }
    }
    
    @Override
    public Detallecuenta buscarDetalleCuenta(int idDetalleCuenta){
        return em.find(Detallecuenta.class, idDetalleCuenta);
    }
    
    @Override
    public Cuenta buscarCuenta(String numCuenta){
        return em.find(Cuenta.class, numCuenta);
    }
  
}
