package Modelos;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioFragmentacionLocal {
    public List<Object> getTablasDeLaBD();
    public List<String> getAtributosDeTabla(String nombre);
    public void getIdDeTabla(String tabla);
    public List<Object> getTablasDePredicado(String atributo, int selector, String valor, String tabla);
    public String analiarPredicados(Hashtable<String,String> ht);
}
