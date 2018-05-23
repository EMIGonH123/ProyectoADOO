
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

public class Estadoauto implements Serializable {

    private Integer idEstado;
    private String estadoAuto;

    public Estadoauto() {
    }

    public Estadoauto(Integer idEstado) {
        this.idEstado = idEstado;
    }

    public Integer getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }

    public String getEstadoAuto() {
        return estadoAuto;
    }

    public void setEstadoAuto(String estadoAuto) {
        this.estadoAuto = estadoAuto;
    }
    
}
