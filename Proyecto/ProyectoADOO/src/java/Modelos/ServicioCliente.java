
package Modelos;

import EntidadesADOO.*;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioCliente implements ServicioClienteLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public Clienterenta buscarCliente(int idCliente){
        return em.find(Clienterenta.class, idCliente);
    }
    
    @Override
    public void editarClientePorCliente(int idCliente, String entidad, String municipio, String colonia, String calle,
                                        int noExterior, int noInterior, int cp, String tel, String email, String pass){
        Clienterenta cliente = buscarCliente(idCliente);
        cliente.setIdCliente(idCliente);
        cliente.setEntidadCliente(entidad);
        cliente.setMunicipioCliente(municipio);
        cliente.setColoniaCliente(colonia);
        cliente.setCalleCliente(calle);
        cliente.setNoExterior(noExterior);
        cliente.setNoInterior(noInterior);
        cliente.setCpCliente(cp);
        cliente.setTelCliente(tel);
        cliente.setEmailCliente(email);
        cliente.setPassCliente(pass);
        em.merge(cliente);
        em.flush();
        em.refresh(cliente);
    
    }
    @Override
    public List<Clienterenta> getInfoCliente(int idCliente){
        String sql = "SELECT * FROM Clienterenta  WHERE idCliente = "+idCliente;
        return (List<Clienterenta>)em.createNativeQuery(sql).getResultList();
    }
}
