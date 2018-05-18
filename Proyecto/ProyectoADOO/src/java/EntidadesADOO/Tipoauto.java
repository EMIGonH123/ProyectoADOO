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
@Table(name = "tipoauto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tipoauto.findAll", query = "SELECT t FROM Tipoauto t")
    , @NamedQuery(name = "Tipoauto.findByIdTipo", query = "SELECT t FROM Tipoauto t WHERE t.idTipo = :idTipo")
    , @NamedQuery(name = "Tipoauto.findByTipoAuto", query = "SELECT t FROM Tipoauto t WHERE t.tipoAuto = :tipoAuto")})
public class Tipoauto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTipo")
    private Integer idTipo;
    @Column(name = "tipoAuto")
    private String tipoAuto;

    public Tipoauto() {
    }

    public Tipoauto(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public Integer getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public String getTipoAuto() {
        return tipoAuto;
    }

    public void setTipoAuto(String tipoAuto) {
        this.tipoAuto = tipoAuto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipo != null ? idTipo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoauto)) {
            return false;
        }
        Tipoauto other = (Tipoauto) object;
        if ((this.idTipo == null && other.idTipo != null) || (this.idTipo != null && !this.idTipo.equals(other.idTipo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Tipoauto[ idTipo=" + idTipo + " ]";
    }
    
}
