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
@Table(name = "proveedorsucursal")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proveedorsucursal.findAll", query = "SELECT p FROM Proveedorsucursal p")
    , @NamedQuery(name = "Proveedorsucursal.findByIdProveedor", query = "SELECT p FROM Proveedorsucursal p WHERE p.proveedorsucursalPK.idProveedor = :idProveedor")
    , @NamedQuery(name = "Proveedorsucursal.findByIdSucursal", query = "SELECT p FROM Proveedorsucursal p WHERE p.proveedorsucursalPK.idSucursal = :idSucursal")})
public class Proveedorsucursal implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ProveedorsucursalPK proveedorsucursalPK;

    public Proveedorsucursal() {
    }

    public Proveedorsucursal(ProveedorsucursalPK proveedorsucursalPK) {
        this.proveedorsucursalPK = proveedorsucursalPK;
    }

    public Proveedorsucursal(int idProveedor, int idSucursal) {
        this.proveedorsucursalPK = new ProveedorsucursalPK(idProveedor, idSucursal);
    }

    public ProveedorsucursalPK getProveedorsucursalPK() {
        return proveedorsucursalPK;
    }

    public void setProveedorsucursalPK(ProveedorsucursalPK proveedorsucursalPK) {
        this.proveedorsucursalPK = proveedorsucursalPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (proveedorsucursalPK != null ? proveedorsucursalPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proveedorsucursal)) {
            return false;
        }
        Proveedorsucursal other = (Proveedorsucursal) object;
        if ((this.proveedorsucursalPK == null && other.proveedorsucursalPK != null) || (this.proveedorsucursalPK != null && !this.proveedorsucursalPK.equals(other.proveedorsucursalPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Proveedorsucursal[ proveedorsucursalPK=" + proveedorsucursalPK + " ]";
    }
    
}
