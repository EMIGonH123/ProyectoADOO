
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

public class Detalleadquisicion implements Serializable {

    private Integer idDetalleAdquisicion;
    private int idAdquisicion;
    private String nombreAuto;
    private Integer modeloAuto;
    private Integer unidadesAuto;
    private Double precioTotal;
    private Double precioUnitario;

    public Detalleadquisicion() {
    }

    public Detalleadquisicion(Integer idDetalleAdquisicion) {
        this.idDetalleAdquisicion = idDetalleAdquisicion;
    }

    public Detalleadquisicion(Integer idDetalleAdquisicion, int idAdquisicion) {
        this.idDetalleAdquisicion = idDetalleAdquisicion;
        this.idAdquisicion = idAdquisicion;
    }

    public Integer getIdDetalleAdquisicion() {
        return idDetalleAdquisicion;
    }

    public void setIdDetalleAdquisicion(Integer idDetalleAdquisicion) {
        this.idDetalleAdquisicion = idDetalleAdquisicion;
    }

    public int getIdAdquisicion() {
        return idAdquisicion;
    }

    public void setIdAdquisicion(int idAdquisicion) {
        this.idAdquisicion = idAdquisicion;
    }

    public String getNombreAuto() {
        return nombreAuto;
    }

    public void setNombreAuto(String nombreAuto) {
        this.nombreAuto = nombreAuto;
    }

    public Integer getModeloAuto() {
        return modeloAuto;
    }

    public void setModeloAuto(Integer modeloAuto) {
        this.modeloAuto = modeloAuto;
    }

    public Integer getUnidadesAuto() {
        return unidadesAuto;
    }

    public void setUnidadesAuto(Integer unidadesAuto) {
        this.unidadesAuto = unidadesAuto;
    }

    public Double getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(Double precioTotal) {
        this.precioTotal = precioTotal;
    }

    public Double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(Double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }
    
}
