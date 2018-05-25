package Modelos;

import java.util.Hashtable;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioFragmentacion implements ServicioFragmentacionLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public List<Object> getTablasDeLaBD(){
        String sql = "SHOW Tables";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<String> getAtributosDeTabla(String nombre){
        String sql = "SELECT column_name FROM information_schema.columns WHERE"
                + " table_name = '"+nombre+"' AND table_schema =  'renta'";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public void getIdDeTabla(String tabla){
        String sql = "SELECT FROM "+tabla;
        em.createNativeQuery(sql);
    }
    
    @Override
    public List<Object> getTablasDePredicado(String atributo, int selector, String valor, String tabla){
        char c = (char)selector;
        String sql = "SELECT * FROM "+tabla+" t "
                + " WHERE "+atributo+" "+c+" "+valor;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public String analiarPredicados(Hashtable<String,String> ht){
        return null;
    }
}
