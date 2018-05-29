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
}
