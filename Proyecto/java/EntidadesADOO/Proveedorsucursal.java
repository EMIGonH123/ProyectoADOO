
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

public class Proveedorsucursal implements Serializable {

    protected ProveedorsucursalPK proveedorsucursalPK;

    public Proveedorsucursal() {
    }

    public Proveedorsucursal(ProveedorsucursalPK proveedorsucursalPK) {
        this.proveedorsucursalPK = proveedorsucursalPK;
    }

    public Proveedorsucursal(int idProveedor, int idSucursal) {
        this.proveedorsucursalPK = new ProveedorsucursalPK(idProveedor, idSucursal);
    }

    public ProveedorsucursalPK getProveedorsucursalPK() {
        return proveedorsucursalPK;
    }

    public void setProveedorsucursalPK(ProveedorsucursalPK proveedorsucursalPK) {
        this.proveedorsucursalPK = proveedorsucursalPK;
    }
    
}
