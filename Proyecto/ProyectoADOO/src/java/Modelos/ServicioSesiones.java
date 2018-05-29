package Modelos;

import EntidadesADOO.*;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioSesiones implements ServicioSesionesLocal {
    
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;
    
    @Override
    public Clienterenta buscarCliente(int idCliente){
        return em.find(Clienterenta.class, idCliente);
    }
    
    @Override
    public Sucursal buscarSucursal(int idSucursal) {
        return em.find(Sucursal.class,idSucursal);
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
    public Empleadorenta buscarEmpleado(int idEmpleado){
        return em.find(Empleadorenta.class, idEmpleado);
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
    
}
