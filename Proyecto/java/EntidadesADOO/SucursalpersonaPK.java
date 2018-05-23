
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

public class SucursalpersonaPK implements Serializable {


    private int idSucursal;
    private int idEmpleado;

    public SucursalpersonaPK() {
    }

    public SucursalpersonaPK(int idSucursal, int idEmpleado) {
        this.idSucursal = idSucursal;
        this.idEmpleado = idEmpleado;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
    
}
