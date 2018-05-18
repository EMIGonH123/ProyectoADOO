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
@Table(name = "sucursal")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sucursal.findAll", query = "SELECT s FROM Sucursal s")
    , @NamedQuery(name = "Sucursal.findByIdSucursal", query = "SELECT s FROM Sucursal s WHERE s.idSucursal = :idSucursal")
    , @NamedQuery(name = "Sucursal.findByNombreSucursal", query = "SELECT s FROM Sucursal s WHERE s.nombreSucursal = :nombreSucursal")
    , @NamedQuery(name = "Sucursal.findByEstadoSucursal", query = "SELECT s FROM Sucursal s WHERE s.estadoSucursal = :estadoSucursal")
    , @NamedQuery(name = "Sucursal.findByColoniaSucursal", query = "SELECT s FROM Sucursal s WHERE s.coloniaSucursal = :coloniaSucursal")
    , @NamedQuery(name = "Sucursal.findByCalleSucursal", query = "SELECT s FROM Sucursal s WHERE s.calleSucursal = :calleSucursal")
    , @NamedQuery(name = "Sucursal.findByCpSucursal", query = "SELECT s FROM Sucursal s WHERE s.cpSucursal = :cpSucursal")
    , @NamedQuery(name = "Sucursal.findByTelSucursal", query = "SELECT s FROM Sucursal s WHERE s.telSucursal = :telSucursal")})
public class Sucursal implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idSucursal")
    private Integer idSucursal;
    @Column(name = "nombreSucursal")
    private String nombreSucursal;
    @Column(name = "estadoSucursal")
    private String estadoSucursal;
    @Column(name = "coloniaSucursal")
    private String coloniaSucursal;
    @Column(name = "calleSucursal")
    private String calleSucursal;
    @Column(name = "cpSucursal")
    private Integer cpSucursal;
    @Column(name = "telSucursal")
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSucursal != null ? idSucursal.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sucursal)) {
            return false;
        }
        Sucursal other = (Sucursal) object;
        if ((this.idSucursal == null && other.idSucursal != null) || (this.idSucursal != null && !this.idSucursal.equals(other.idSucursal))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Sucursal[ idSucursal=" + idSucursal + " ]";
    }
    
}
