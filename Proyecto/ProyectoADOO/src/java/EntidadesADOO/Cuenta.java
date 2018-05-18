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
@Table(name = "cuenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cuenta.findAll", query = "SELECT c FROM Cuenta c")
    , @NamedQuery(name = "Cuenta.findByNumeroDeCuenta", query = "SELECT c FROM Cuenta c WHERE c.numeroDeCuenta = :numeroDeCuenta")
    , @NamedQuery(name = "Cuenta.findByIdCliente", query = "SELECT c FROM Cuenta c WHERE c.idCliente = :idCliente")
    , @NamedQuery(name = "Cuenta.findByIdDetalleCuenta", query = "SELECT c FROM Cuenta c WHERE c.idDetalleCuenta = :idDetalleCuenta")
    , @NamedQuery(name = "Cuenta.findBySaldo", query = "SELECT c FROM Cuenta c WHERE c.saldo = :saldo")})
public class Cuenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "numeroDeCuenta")
    private String numeroDeCuenta;
    @Basic(optional = false)
    @Column(name = "idCliente")
    private int idCliente;
    @Basic(optional = false)
    @Column(name = "idDetalleCuenta")
    private int idDetalleCuenta;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "saldo")
    private Double saldo;

    public Cuenta() {
    }

    public Cuenta(String numeroDeCuenta) {
        this.numeroDeCuenta = numeroDeCuenta;
    }

    public Cuenta(String numeroDeCuenta, int idCliente, int idDetalleCuenta) {
        this.numeroDeCuenta = numeroDeCuenta;
        this.idCliente = idCliente;
        this.idDetalleCuenta = idDetalleCuenta;
    }

    public String getNumeroDeCuenta() {
        return numeroDeCuenta;
    }

    public void setNumeroDeCuenta(String numeroDeCuenta) {
        this.numeroDeCuenta = numeroDeCuenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdDetalleCuenta() {
        return idDetalleCuenta;
    }

    public void setIdDetalleCuenta(int idDetalleCuenta) {
        this.idDetalleCuenta = idDetalleCuenta;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numeroDeCuenta != null ? numeroDeCuenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cuenta)) {
            return false;
        }
        Cuenta other = (Cuenta) object;
        if ((this.numeroDeCuenta == null && other.numeroDeCuenta != null) || (this.numeroDeCuenta != null && !this.numeroDeCuenta.equals(other.numeroDeCuenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Cuenta[ numeroDeCuenta=" + numeroDeCuenta + " ]";
    }
    
}
