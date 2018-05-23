
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

public class Tipoempleado implements Serializable {

    private Integer idTipoEmpleado;
    private String descEmpleado;

    public Tipoempleado() {
    }

    public Tipoempleado(Integer idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public Integer getIdTipoEmpleado() {
        return idTipoEmpleado;
    }

    public void setIdTipoEmpleado(Integer idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public String getDescEmpleado() {
        return descEmpleado;
    }

    public void setDescEmpleado(String descEmpleado) {
        this.descEmpleado = descEmpleado;
    }
    
}
