package Modelos;

import EntidadesADOO.*;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioAdministrador implements ServicioAdministradorLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
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
    public List<Object> getIDSDeClientesAsociadosAlEmpleado(int idEmpleado) {
        String sql ="SELECT c.idCliente FROM ClienteRenta c, EmpleadoRenta e WHERE "
                + " e.idEmpleado = c.idEmpleado AND e.idEmpleado = "+idEmpleado;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public Empleadorenta buscarEmpleado(int idEmpleado){
        return em.find(Empleadorenta.class, idEmpleado);
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
    public Empleadorenta iniciaSesionEmpleado(int idEmpleado, String pass){
        Empleadorenta empleado = this.buscarEmpleado(idEmpleado);
        if(empleado != null && empleado.getPassEmpleado().equals(pass)){
            return empleado;
        }else{
            return null;
        }
    }
    
    @Override
    public void editarAdministradorPorAdministrador(int idEmpleado, String nombre, String apPaterno,
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
    public void borrarAdministradorPorAdministrador(int idEmpleado, List<Object> clientesAsociados) throws EJBException{
        Empleadorenta empleado = this.buscarEmpleado(idEmpleado);
        if(!clientesAsociados.isEmpty()){
            Iterator<Object> i = clientesAsociados.iterator();
            while(i.hasNext()){
                int idCliente = (int)i.next();
                /*Clienterenta aux = this.buscarCliente(idCliente);
                if(aux != null){
                    em.remove(aux);
                    em.flush();
                    i.remove();
                }*/
            }
        }
        if(empleado != null){
            em.remove(empleado);
            em.flush();
        }

    }
    
    
    @Override
    public List<Clienterenta> getClientesAsociadosAlAdministrador(int idAdministrador) {
        String sql ="SELECT c.* FROM ClienteRenta c, EmpleadoRenta e WHERE "
                + " e.idEmpleado = c.idEmpleado AND e.idEmpleado = "+idAdministrador;
        return em.createNativeQuery(sql).getResultList();
    }
    
    
    
    
}
