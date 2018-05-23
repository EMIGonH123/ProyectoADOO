
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

public class Detallecuenta implements Serializable {

    private Integer idDetalleCuenta;
    private String detalleCuenta;
    private String fechaAdquisicionSaldo;
    private String fechaLimitePago;
    private Double pagoMinimo;
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
    
}
