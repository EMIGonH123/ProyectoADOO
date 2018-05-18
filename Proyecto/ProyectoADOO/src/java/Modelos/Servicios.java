package Modelos;
import EntidadesADOO.*;
import java.util.Iterator;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
@Stateless
public class Servicios implements ServiciosLocal {

    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public Empleadorenta buscarEmpleado(int idEmpleado){
        return em.find(Empleadorenta.class, idEmpleado);
    }
    
    @Override
    public Clienterenta buscarCliente(int idCliente){
        return em.find(Clienterenta.class, idCliente);
    }
    
    @Override
    public Empleadorenta iniciaSesionEmpleado(int idEmpleado, String pass){
        Empleadorenta empleado = this.buscarEmpleado(idEmpleado);
        if(empleado != null && empleado.getPassEmpleado().equals(pass)){
            return empleado;
        }else{
            return null;
        }
    }
    
    @Override
    public List<Empleadorenta> getInfoAdministrador(int idAdmin){
        String sql = "SELECT * FROM Empleadorenta WHERE idEmpleado ="+idAdmin;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Empleadorenta> getEmpleadosAsociadosAlAdministrador(){
        String sql = "SELECT * FROM Empleadorenta WHERE idTipoEmpleado = 2";
        return em.createNativeQuery(sql).getResultList();    
    }
    
    @Override
    public Clienterenta iniciaSesionCliente(int idCliente, String pass){
        Clienterenta cliente = this.buscarCliente(idCliente);
        if(cliente != null && cliente.getPassCliente().equals(pass)){
            return cliente;
        }else{
            return null;
        }
    }
    
    @Override
    public void editarClientePorEmpleado(int idCliente,int idEmpleado, String nombre, String apPatereno, String apMaterno,
            String rfc, String entidad, String municipio, String colonia, String calle,
            int noExterior, int noInterior, int cp, String tel, String email, String pass,String genero) {
        
        Clienterenta cliente = buscarCliente(idCliente);
        cliente.setIdCliente(idCliente);
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
    public List<Object> getInfoSucursales(){
        String sql = "SELECT * FROM Sucursal";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Object> getInfoProveedores(){
        String sql = "SELECT * FROM Proveedor";
        return em.createNativeQuery(sql).getResultList();
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
    public void borrarCRUDClientePorEmpleado(int idCliente){
        Clienterenta cliente = this.buscarCliente(idCliente);
        if(cliente != null){
            em.remove(cliente);
            em.flush();
        }
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
    public void crearEmpleadoPorAdministrador(String nombre,String apPaterno, String apMaterno,
        String entidad, String municipio, String colonia, String calle,int idTipo,
        int noExterior, int noInterior, int cp, String tel, String email, String pass, int idSucursal,String genero) {
        
        
        Empleadorenta empleado = new Empleadorenta();
        SucursalpersonaPK sp = new SucursalpersonaPK();
        Sucursalpersona sp2 = new Sucursalpersona();
        
        empleado.setNombreEmpleado(nombre);
        empleado.setApPaternoEmpleado(apPaterno);
        empleado.setApMaternoEmpleado(apMaterno);
        empleado.setEntidadEmpleado(entidad);
        empleado.setMunicipioEmpleado(municipio);
        empleado.setColoniaEmpleado(colonia);
        empleado.setCalleEmpleado(calle);
        empleado.setNoExterior(noExterior);
        empleado.setNoInterior(noInterior);
        empleado.setCpEmpleado(cp);
        empleado.setGeneroEmpleado(genero);
        empleado.setTelEmpleado(tel);
        empleado.setEmailEmpleado(email);
        empleado.setPassEmpleado(pass);
        empleado.setIdTipoEmpleado(idTipo);
        this.insertar(empleado);
        
        sp.setIdEmpleado(empleado.getIdEmpleado());
        sp.setIdSucursal(idSucursal);
        sp2.setSucursalpersonaPK(sp);
        this.insertar(sp2);
    }
    
    @Override
    public List<Automovilmarca> getMarcaDeAutos(){
        String sql = "SELECT * FROM AutomovilMarca";
        return (List<Automovilmarca>)em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Tipoauto> getTipoDeAutos(){
        String sql = "SELECT * FROM TipoAuto";
        return (List<Tipoauto>)em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Object> getInfoDeSucursalPorAdministrador(int idAdmistrador) {
        String sql = "SELECT s.* FROM EmpleadoRenta er , SucursalPersona sp, Sucursal s"
                    + " WHERE er.idEmpleado = sp.idEmpleado AND  sp.idSucursal = s.idSucursal"
                    + " AND er.idEmpleado = "+idAdmistrador;
        return em.createNativeQuery(sql).getResultList();
    }
    @Override
    public List<Clienterenta> getClientesAsociadosAlAdministrador(int idAdministrador) {
        String sql ="SELECT c.* FROM ClienteRenta c, EmpleadoRenta e WHERE "
                + " e.idEmpleado = c.idEmpleado AND e.idEmpleado = "+idAdministrador;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Object> getIdsDeAdministradores() {
        String sql = "SELECT e.idEmpleado FROM EmpleadoRenta e WHERE e.idTipoEmpleado = 2";
        return em.createNativeQuery(sql).getResultList();
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
    public List<Clienterenta> getInfoCliente(int idCliente){
        String sql = "SELECT * FROM Clienterenta  WHERE idCliente = "+idCliente;
        return (List<Clienterenta>)em.createNativeQuery(sql).getResultList();
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
    public Cuenta buscarCuenta(String numCuenta){
        return em.find(Cuenta.class, numCuenta);
    }
    
    @Override
    public Detallecuenta buscarDetalleCuenta(int idDetalleCuenta){
        return em.find(Detallecuenta.class, idDetalleCuenta);
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
    public List<Object> getTablasDeLaBD(){
        String sql = "SHOW Tables";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Object> obtenerAtributosDeTabla(String nombre){
        String sql = "DESCRIBE "+ nombre;
        return em.createNativeQuery(sql).getResultList();
    }
}
