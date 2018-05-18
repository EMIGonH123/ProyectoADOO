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
@Table(name = "renta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Renta.findAll", query = "SELECT r FROM Renta r")
    , @NamedQuery(name = "Renta.findByIdRenta", query = "SELECT r FROM Renta r WHERE r.idRenta = :idRenta")
    , @NamedQuery(name = "Renta.findByIdCliente", query = "SELECT r FROM Renta r WHERE r.idCliente = :idCliente")
    , @NamedQuery(name = "Renta.findByMatricula", query = "SELECT r FROM Renta r WHERE r.matricula = :matricula")
    , @NamedQuery(name = "Renta.findByDescripcionRenta", query = "SELECT r FROM Renta r WHERE r.descripcionRenta = :descripcionRenta")
    , @NamedQuery(name = "Renta.findByFechaInicioRenta", query = "SELECT r FROM Renta r WHERE r.fechaInicioRenta = :fechaInicioRenta")
    , @NamedQuery(name = "Renta.findByFechaFinRenta", query = "SELECT r FROM Renta r WHERE r.fechaFinRenta = :fechaFinRenta")
    , @NamedQuery(name = "Renta.findByTotalRenta", query = "SELECT r FROM Renta r WHERE r.totalRenta = :totalRenta")
    , @NamedQuery(name = "Renta.findByUnidadesRenta", query = "SELECT r FROM Renta r WHERE r.unidadesRenta = :unidadesRenta")
    , @NamedQuery(name = "Renta.findByTipoPago", query = "SELECT r FROM Renta r WHERE r.tipoPago = :tipoPago")})
public class Renta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idRenta")
    private Integer idRenta;
    @Basic(optional = false)
    @Column(name = "idCliente")
    private int idCliente;
    @Basic(optional = false)
    @Column(name = "matricula")
    private String matricula;
    @Column(name = "descripcionRenta")
    private String descripcionRenta;
    @Column(name = "fechaInicioRenta")
    private String fechaInicioRenta;
    @Column(name = "fechaFinRenta")
    private String fechaFinRenta;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "totalRenta")
    private Double totalRenta;
    @Column(name = "unidadesRenta")
    private Integer unidadesRenta;
    @Basic(optional = false)
    @Column(name = "tipoPago")
    private int tipoPago;

    public Renta() {
    }

    public Renta(Integer idRenta) {
        this.idRenta = idRenta;
    }

    public Renta(Integer idRenta, int idCliente, String matricula, int tipoPago) {
        this.idRenta = idRenta;
        this.idCliente = idCliente;
        this.matricula = matricula;
        this.tipoPago = tipoPago;
    }

    public Integer getIdRenta() {
        return idRenta;
    }

    public void setIdRenta(Integer idRenta) {
        this.idRenta = idRenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getDescripcionRenta() {
        return descripcionRenta;
    }

    public void setDescripcionRenta(String descripcionRenta) {
        this.descripcionRenta = descripcionRenta;
    }

    public String getFechaInicioRenta() {
        return fechaInicioRenta;
    }

    public void setFechaInicioRenta(String fechaInicioRenta) {
        this.fechaInicioRenta = fechaInicioRenta;
    }

    public String getFechaFinRenta() {
        return fechaFinRenta;
    }

    public void setFechaFinRenta(String fechaFinRenta) {
        this.fechaFinRenta = fechaFinRenta;
    }

    public Double getTotalRenta() {
        return totalRenta;
    }

    public void setTotalRenta(Double totalRenta) {
        this.totalRenta = totalRenta;
    }

    public Integer getUnidadesRenta() {
        return unidadesRenta;
    }

    public void setUnidadesRenta(Integer unidadesRenta) {
        this.unidadesRenta = unidadesRenta;
    }

    public int getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(int tipoPago) {
        this.tipoPago = tipoPago;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRenta != null ? idRenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Renta)) {
            return false;
        }
        Renta other = (Renta) object;
        if ((this.idRenta == null && other.idRenta != null) || (this.idRenta != null && !this.idRenta.equals(other.idRenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Renta[ idRenta=" + idRenta + " ]";
    }
    
}
