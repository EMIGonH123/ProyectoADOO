/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author metal
 */
@Entity
@Table(name = "sucursalpersona")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sucursalpersona.findAll", query = "SELECT s FROM Sucursalpersona s")
    , @NamedQuery(name = "Sucursalpersona.findByIdSucursal", query = "SELECT s FROM Sucursalpersona s WHERE s.sucursalpersonaPK.idSucursal = :idSucursal")
    , @NamedQuery(name = "Sucursalpersona.findByIdEmpleado", query = "SELECT s FROM Sucursalpersona s WHERE s.sucursalpersonaPK.idEmpleado = :idEmpleado")})
public class Sucursalpersona implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sucursalpersonaPK != null ? sucursalpersonaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sucursalpersona)) {
            return false;
        }
        Sucursalpersona other = (Sucursalpersona) object;
        if ((this.sucursalpersonaPK == null && other.sucursalpersonaPK != null) || (this.sucursalpersonaPK != null && !this.sucursalpersonaPK.equals(other.sucursalpersonaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Sucursalpersona[ sucursalpersonaPK=" + sucursalpersonaPK + " ]";
    }
    
}
