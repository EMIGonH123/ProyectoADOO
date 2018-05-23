
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

public class Renta implements Serializable {

    private Integer idRenta;
    private int idCliente;
    private String matricula;
    private String descripcionRenta;
    private String fechaInicioRenta;
    private String fechaFinRenta;
    private Double totalRenta;
    private Integer unidadesRenta;
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
    
}
