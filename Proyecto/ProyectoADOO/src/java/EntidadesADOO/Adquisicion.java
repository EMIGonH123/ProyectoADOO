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
@Table(name = "adquisicion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Adquisicion.findAll", query = "SELECT a FROM Adquisicion a")
    , @NamedQuery(name = "Adquisicion.findByIdAdquisicion", query = "SELECT a FROM Adquisicion a WHERE a.idAdquisicion = :idAdquisicion")
    , @NamedQuery(name = "Adquisicion.findByIdProveedor", query = "SELECT a FROM Adquisicion a WHERE a.idProveedor = :idProveedor")
    , @NamedQuery(name = "Adquisicion.findByIdEmpleado", query = "SELECT a FROM Adquisicion a WHERE a.idEmpleado = :idEmpleado")
    , @NamedQuery(name = "Adquisicion.findByFechaAdquisicion", query = "SELECT a FROM Adquisicion a WHERE a.fechaAdquisicion = :fechaAdquisicion")
    , @NamedQuery(name = "Adquisicion.findByTotalAquisicion", query = "SELECT a FROM Adquisicion a WHERE a.totalAquisicion = :totalAquisicion")})
public class Adquisicion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idAdquisicion")
    private Integer idAdquisicion;
    @Basic(optional = false)
    @Column(name = "idProveedor")
    private int idProveedor;
    @Basic(optional = false)
    @Column(name = "idEmpleado")
    private int idEmpleado;
    @Column(name = "fechaAdquisicion")
    private String fechaAdquisicion;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "totalAquisicion")
    private Double totalAquisicion;

    public Adquisicion() {
    }

    public Adquisicion(Integer idAdquisicion) {
        this.idAdquisicion = idAdquisicion;
    }

    public Adquisicion(Integer idAdquisicion, int idProveedor, int idEmpleado) {
        this.idAdquisicion = idAdquisicion;
        this.idProveedor = idProveedor;
        this.idEmpleado = idEmpleado;
    }

    public Integer getIdAdquisicion() {
        return idAdquisicion;
    }

    public void setIdAdquisicion(Integer idAdquisicion) {
        this.idAdquisicion = idAdquisicion;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getFechaAdquisicion() {
        return fechaAdquisicion;
    }

    public void setFechaAdquisicion(String fechaAdquisicion) {
        this.fechaAdquisicion = fechaAdquisicion;
    }

    public Double getTotalAquisicion() {
        return totalAquisicion;
    }

    public void setTotalAquisicion(Double totalAquisicion) {
        this.totalAquisicion = totalAquisicion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAdquisicion != null ? idAdquisicion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Adquisicion)) {
            return false;
        }
        Adquisicion other = (Adquisicion) object;
        if ((this.idAdquisicion == null && other.idAdquisicion != null) || (this.idAdquisicion != null && !this.idAdquisicion.equals(other.idAdquisicion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Adquisicion[ idAdquisicion=" + idAdquisicion + " ]";
    }
    
}
