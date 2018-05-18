/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author metal
 */
@Entity
@Table(name = "tipoempleado")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipoempleado.findAll", query = "SELECT t FROM Tipoempleado t")
    , @NamedQuery(name = "Tipoempleado.findByIdTipoEmpleado", query = "SELECT t FROM Tipoempleado t WHERE t.idTipoEmpleado = :idTipoEmpleado")
    , @NamedQuery(name = "Tipoempleado.findByDescEmpleado", query = "SELECT t FROM Tipoempleado t WHERE t.descEmpleado = :descEmpleado")})
public class Tipoempleado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTipoEmpleado")
    private Integer idTipoEmpleado;
    @Column(name = "descEmpleado")
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoEmpleado != null ? idTipoEmpleado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoempleado)) {
            return false;
        }
        Tipoempleado other = (Tipoempleado) object;
        if ((this.idTipoEmpleado == null && other.idTipoEmpleado != null) || (this.idTipoEmpleado != null && !this.idTipoEmpleado.equals(other.idTipoEmpleado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Tipoempleado[ idTipoEmpleado=" + idTipoEmpleado + " ]";
    }
    
}
