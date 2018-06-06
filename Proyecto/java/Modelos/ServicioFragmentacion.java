package Modelos;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioFragmentacion implements ServicioFragmentacionLocal {
    public static String nombreS ;
    public static List<String> lista;
    public ServicioFragmentacion(){nombreS=null;lista = null;}
    
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
        nombreS = nombre;
        String sql = "SELECT column_name FROM information_schema.columns WHERE"
                + " table_name = '"+nombre+"' AND table_schema =  'renta'";
        return em.createNativeQuery(sql).getResultList();
    }
    @Override
    public void setNombreTabla(String nombreTabla){
        nombreS = nombreTabla;
    }
    
    @Override
    public String getNombreTabla(){
        return nombreS;
    }
    
    
    @Override
    public List<String> getAtributosDeTabla(){
        String sql = "SELECT column_name FROM information_schema.columns WHERE"
                + " table_name = '"+nombreS+"' AND table_schema =  'renta'";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public void setListaDePredicados(List<String> lista){
        lista = lista;
    }
    
    @Override
    public void setPredicado(String predicado){
        lista.add(predicado);
    }
    
    @Override
    public List<String> getListaDePredicados(){
        em.createNativeQuery("");
        return lista;
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
    public void generarPredicadosMiniterminos(Hashtable<String,String> ht){
        
    }
    
    @Override
    public void analiarPredicados(Hashtable<String,String> ht){
        
        Enumeration<String> clave = ht.keys();
        Enumeration<String> valor = ht.elements();
        ht.size();
        while(clave.hasMoreElements()){
            String c = clave.nextElement();
            String[] valores = c.split(" ");
            System.out.println(valores[0]+"\n"+valores[1]+"\n"+valores[2]+"\n");
            String v = valor.nextElement();
            String sql = " ";
            switch(v){
                case "int":
                    sql = "SELECT * FROM "+ nombreS +" WHERE "+valores[0]+" "+valores[1]+" "+valores[2];
                    break;
                case "double":
                    sql = "SELECT * FROM "+ nombreS +" WHERE "+valores[0]+" "+valores[1]+" "+valores[2];
                    break;
                case "varchar":
                    sql = "SELECT * FROM "+ nombreS +" WHERE "+valores[0]+" "+valores[1]+" '"+valores[2]+"'";
                    break;
                case "date":
                    sql = "SELECT * FROM "+ nombreS +" WHERE "+valores[0]+" "+valores[1]+" '"+valores[2]+"'";
                    break;
            }
            List<Object> lista = em.createNativeQuery(sql).getResultList();
            if(lista.isEmpty()){
                ht.remove(c);
            }
        }
        
        //return pa;
    }
    @Override
    public List<String> getTipoDatoDeAtributo(String atributo){
        String sql ="SELECT Data_type FROM Information_schema.columns "
                + " WHERE Table_name = '"+nombreS+"' AND Column_name = '"+atributo+"' "
                + " AND Table_schema= 'renta'";
        return em.createNativeQuery(sql).getResultList();
        
    }

    @Override
    public void crearBDFragmentacionH(String nombreBD) {
        em.createNativeQuery("Create database fragmentoHRenta");
    }

    @Override
    public void getDetalleDeTabla() {
        String sql1 = "select column_name as nombre from information_schema.columns "
                + " where table_name ='"+nombreS+"' and table_schema= 'renta'";
 
        String sql2 = "select data_type as tipo from information_schema.columns "
                + " where table_name ='"+nombreS+"' and table_schema= 'renta'";
        
        String sql3 = "select is_nullable as esNull from information_schema.columns "
                + " where table_name ='"+nombreS+"' and table_schema= 'renta'";
        
        List<String> nombreColumna = em.createNativeQuery(sql1).getResultList();
        List<String> tipoDeDatos = em.createNativeQuery(sql2).getResultList();
        //List<String> isnull = em.createNamedQuery(sql3).getResultList();
        String detalleTabla="";
        
        Iterator<String> n = nombreColumna.iterator();
        Iterator<String> td = tipoDeDatos.iterator();
        //Iterator<String> in = isnull.iterator();
        int i=0;
        while(i < nombreColumna.size()){
            String aux = td.next();
            
            if(aux.equalsIgnoreCase("varchar")){
                if(i==nombreColumna.size()-1){
                    detalleTabla += n.next()+" "+aux+"(100) not null";
                }else{
                    detalleTabla += n.next()+" "+aux+"(100) not null,";
                }
                
            }else{
                if(i==nombreColumna.size()-1){
                    detalleTabla += n.next()+" "+aux+" not null";
                }else{
                    detalleTabla += n.next()+" "+aux+" not null,";
                }
            }
            i++;
            
        }
        String tabla = "CREATE TABLE "+nombreS+"FH("+detalleTabla+")";
        //this.crearBDFragmentacionH(nombreS);
        //em.createNativeQuery("use fragmentoHRenta");
        System.out.println("\nINSTRUCCION: "+tabla+"\n");
        //em.createNativeQuery("Create database EMILIANO");
        em.createNativeQuery(tabla);
        
        
        
    }

    @Override
    public void crearTablaEnLaBD(String nombreBD, Hashtable<String, String> detalleTabla) {

    }
}
