
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


public class Adquisicion implements Serializable {

 
    private Integer idAdquisicion;
    private int idProveedor;
    private int idEmpleado;
    private String fechaAdquisicion;
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


    
}
