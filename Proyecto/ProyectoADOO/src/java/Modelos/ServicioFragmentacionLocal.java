package Modelos;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioFragmentacionLocal {
    public List<Object> getTablasDeLaBD();
    public List<String> obtenerAtributosDeTabla(String nombre);
    public ArrayList<String> getAtrigutosDeTabla(String nombre);
}
