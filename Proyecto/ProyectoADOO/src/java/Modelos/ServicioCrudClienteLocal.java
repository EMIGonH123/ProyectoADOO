package Modelos;
import EntidadesADOO.*;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ServicioCrudClienteLocal {
    public List<Automovil> getInfoDeAutosParaRentarAsociadosAlEmpleado(int idEmpleado);    
    public List<Clienterenta> getInfoCliente(int idCliente);
    public List<Object> getInfoCuentasDeCliente(int idCliente);
    public List<Detallecuenta> getDetalleCuentasDeCliente(int idCliente);
    public List<Object> getInfoRentasCliente(int idCliente);
    public Automovil buscarAuto(String matricula);
    public Renta buscarRenta(int idRenta);
    public void borrarRenta(int idRenta);
    public void crearRenta(int idCliente, String matricula, String descripcionRenta,
                            String fechaInicio,String fechaFin, double total,int unidades,int tipoPago);
}
