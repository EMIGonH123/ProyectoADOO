
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

public class Sucursalpersona implements Serializable {

    protected SucursalpersonaPK sucursalpersonaPK;

    public Sucursalpersona() {
    }

    public Sucursalpersona(SucursalpersonaPK sucursalpersonaPK) {
        this.sucursalpersonaPK = sucursalpersonaPK;
    }

    public Sucursalpersona(int idSucursal, int idEmpleado) {
        this.sucursalpersonaPK = new SucursalpersonaPK(idSucursal, idEmpleado);
    }

    public SucursalpersonaPK getSucursalpersonaPK() {
        return sucursalpersonaPK;
    }

    public void setSucursalpersonaPK(SucursalpersonaPK sucursalpersonaPK) {
        this.sucursalpersonaPK = sucursalpersonaPK;
    }
    
}
