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
@Table(name = "detallecuenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Detallecuenta.findAll", query = "SELECT d FROM Detallecuenta d")
    , @NamedQuery(name = "Detallecuenta.findByIdDetalleCuenta", query = "SELECT d FROM Detallecuenta d WHERE d.idDetalleCuenta = :idDetalleCuenta")
    , @NamedQuery(name = "Detallecuenta.findByDetalleCuenta", query = "SELECT d FROM Detallecuenta d WHERE d.detalleCuenta = :detalleCuenta")
    , @NamedQuery(name = "Detallecuenta.findByFechaAdquisicionSaldo", query = "SELECT d FROM Detallecuenta d WHERE d.fechaAdquisicionSaldo = :fechaAdquisicionSaldo")
    , @NamedQuery(name = "Detallecuenta.findByFechaLimitePago", query = "SELECT d FROM Detallecuenta d WHERE d.fechaLimitePago = :fechaLimitePago")
    , @NamedQuery(name = "Detallecuenta.findByPagoMinimo", query = "SELECT d FROM Detallecuenta d WHERE d.pagoMinimo = :pagoMinimo")
    , @NamedQuery(name = "Detallecuenta.findByIntereses", query = "SELECT d FROM Detallecuenta d WHERE d.intereses = :intereses")})
public class Detallecuenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDetalleCuenta")
    private Integer idDetalleCuenta;
    @Column(name = "detalleCuenta")
    private String detalleCuenta;
    @Column(name = "fechaAdquisicionSaldo")
    private String fechaAdquisicionSaldo;
    @Column(name = "fechaLimitePago")
    private String fechaLimitePago;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "pagoMinimo")
    private Double pagoMinimo;
    @Column(name = "intereses")
    private String intereses;

    public Detallecuenta() {
    }

    public Detallecuenta(Integer idDetalleCuenta) {
        this.idDetalleCuenta = idDetalleCuenta;
    }

    public Integer getIdDetalleCuenta() {
        return idDetalleCuenta;
    }

    public void setIdDetalleCuenta(Integer idDetalleCuenta) {
        this.idDetalleCuenta = idDetalleCuenta;
    }

    public String getDetalleCuenta() {
        return detalleCuenta;
    }

    public void setDetalleCuenta(String detalleCuenta) {
        this.detalleCuenta = detalleCuenta;
    }

    public String getFechaAdquisicionSaldo() {
        return fechaAdquisicionSaldo;
    }

    public void setFechaAdquisicionSaldo(String fechaAdquisicionSaldo) {
        this.fechaAdquisicionSaldo = fechaAdquisicionSaldo;
    }

    public String getFechaLimitePago() {
        return fechaLimitePago;
    }

    public void setFechaLimitePago(String fechaLimitePago) {
        this.fechaLimitePago = fechaLimitePago;
    }

    public Double getPagoMinimo() {
        return pagoMinimo;
    }

    public void setPagoMinimo(Double pagoMinimo) {
        this.pagoMinimo = pagoMinimo;
    }

    public String getIntereses() {
        return intereses;
    }

    public void setIntereses(String intereses) {
        this.intereses = intereses;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetalleCuenta != null ? idDetalleCuenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Detallecuenta)) {
            return false;
        }
        Detallecuenta other = (Detallecuenta) object;
        if ((this.idDetalleCuenta == null && other.idDetalleCuenta != null) || (this.idDetalleCuenta != null && !this.idDetalleCuenta.equals(other.idDetalleCuenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Detallecuenta[ idDetalleCuenta=" + idDetalleCuenta + " ]";
    }
    
}
