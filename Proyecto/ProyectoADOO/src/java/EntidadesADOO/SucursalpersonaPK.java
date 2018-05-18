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
public class SucursalpersonaPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "idSucursal")
    private int idSucursal;
    @Basic(optional = false)
    @Column(name = "idEmpleado")
    private int idEmpleado;

    public SucursalpersonaPK() {
    }

    public SucursalpersonaPK(int idSucursal, int idEmpleado) {
        this.idSucursal = idSucursal;
        this.idEmpleado = idEmpleado;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idSucursal;
        hash += (int) idEmpleado;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SucursalpersonaPK)) {
            return false;
        }
        SucursalpersonaPK other = (SucursalpersonaPK) object;
        if (this.idSucursal != other.idSucursal) {
            return false;
        }
        if (this.idEmpleado != other.idEmpleado) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.SucursalpersonaPK[ idSucursal=" + idSucursal + ", idEmpleado=" + idEmpleado + " ]";
    }
    
}
