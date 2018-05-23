
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

public class ProveedorsucursalPK implements Serializable {


    private int idProveedor;
    private int idSucursal;

    public ProveedorsucursalPK() {
    }

    public ProveedorsucursalPK(int idProveedor, int idSucursal) {
        this.idProveedor = idProveedor;
        this.idSucursal = idSucursal;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }
    
}
