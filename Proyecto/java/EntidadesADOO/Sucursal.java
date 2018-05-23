
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

public class Sucursal implements Serializable {

    private Integer idSucursal;
    private String nombreSucursal;
    private String estadoSucursal;
    private String coloniaSucursal;
    private String calleSucursal;
    private Integer cpSucursal;
    private String telSucursal;

    public Sucursal() {
    }

    public Sucursal(Integer idSucursal) {
        this.idSucursal = idSucursal;
    }

    public Integer getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(Integer idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getNombreSucursal() {
        return nombreSucursal;
    }

    public void setNombreSucursal(String nombreSucursal) {
        this.nombreSucursal = nombreSucursal;
    }

    public String getEstadoSucursal() {
        return estadoSucursal;
    }

    public void setEstadoSucursal(String estadoSucursal) {
        this.estadoSucursal = estadoSucursal;
    }

    public String getColoniaSucursal() {
        return coloniaSucursal;
    }

    public void setColoniaSucursal(String coloniaSucursal) {
        this.coloniaSucursal = coloniaSucursal;
    }

    public String getCalleSucursal() {
        return calleSucursal;
    }

    public void setCalleSucursal(String calleSucursal) {
        this.calleSucursal = calleSucursal;
    }

    public Integer getCpSucursal() {
        return cpSucursal;
    }

    public void setCpSucursal(Integer cpSucursal) {
        this.cpSucursal = cpSucursal;
    }

    public String getTelSucursal() {
        return telSucursal;
    }

    public void setTelSucursal(String telSucursal) {
        this.telSucursal = telSucursal;
    }
    
}
