package Modelos;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioFragmentacionLocal {
    
    public List<Object> getTablasDeLaBD();
    public List<String> getAtributosDeTabla(String nombre);
    public List<String> getAtributosDeTabla();
    public void getIdDeTabla(String tabla);
    public void setNombreTabla(String nombreTabla);
    public String getNombreTabla();
    public List<String> getTipoDatoDeAtributo(String atributo);
    public void setListaDePredicados(List<String> lista);
    public void setPredicado(String predicado);
    public List<String> getListaDePredicados();
    public List<Object> getTablasDePredicado(String atributo, int selector, String valor, String tabla);
    public void analiarPredicados(Hashtable<String,String> ht);
}
