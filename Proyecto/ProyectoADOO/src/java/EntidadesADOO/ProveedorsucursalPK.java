/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntidadesADOO;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author metal
 */
@Embeddable
public class ProveedorsucursalPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "idProveedor")
    private int idProveedor;
    @Basic(optional = false)
    @Column(name = "idSucursal")
    private int idSucursal;

    public ProveedorsucursalPK() {
    }

    public ProveedorsucursalPK(int idProveedor, int idSucursal) {
        this.idProveedor = idProveedor;
        this.idSucursal = idSucursal;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idProveedor;
        hash += (int) idSucursal;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProveedorsucursalPK)) {
            return false;
        }
        ProveedorsucursalPK other = (ProveedorsucursalPK) object;
        if (this.idProveedor != other.idProveedor) {
            return false;
        }
        if (this.idSucursal != other.idSucursal) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.ProveedorsucursalPK[ idProveedor=" + idProveedor + ", idSucursal=" + idSucursal + " ]";
    }
    
}
