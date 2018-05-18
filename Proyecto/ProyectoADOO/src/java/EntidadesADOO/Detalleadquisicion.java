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
@Table(name = "detalleadquisicion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Detalleadquisicion.findAll", query = "SELECT d FROM Detalleadquisicion d")
    , @NamedQuery(name = "Detalleadquisicion.findByIdDetalleAdquisicion", query = "SELECT d FROM Detalleadquisicion d WHERE d.idDetalleAdquisicion = :idDetalleAdquisicion")
    , @NamedQuery(name = "Detalleadquisicion.findByIdAdquisicion", query = "SELECT d FROM Detalleadquisicion d WHERE d.idAdquisicion = :idAdquisicion")
    , @NamedQuery(name = "Detalleadquisicion.findByNombreAuto", query = "SELECT d FROM Detalleadquisicion d WHERE d.nombreAuto = :nombreAuto")
    , @NamedQuery(name = "Detalleadquisicion.findByModeloAuto", query = "SELECT d FROM Detalleadquisicion d WHERE d.modeloAuto = :modeloAuto")
    , @NamedQuery(name = "Detalleadquisicion.findByUnidadesAuto", query = "SELECT d FROM Detalleadquisicion d WHERE d.unidadesAuto = :unidadesAuto")
    , @NamedQuery(name = "Detalleadquisicion.findByPrecioTotal", query = "SELECT d FROM Detalleadquisicion d WHERE d.precioTotal = :precioTotal")
    , @NamedQuery(name = "Detalleadquisicion.findByPrecioUnitario", query = "SELECT d FROM Detalleadquisicion d WHERE d.precioUnitario = :precioUnitario")})
public class Detalleadquisicion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDetalleAdquisicion")
    private Integer idDetalleAdquisicion;
    @Basic(optional = false)
    @Column(name = "idAdquisicion")
    private int idAdquisicion;
    @Column(name = "nombreAuto")
    private String nombreAuto;
    @Column(name = "modeloAuto")
    private Integer modeloAuto;
    @Column(name = "unidadesAuto")
    private Integer unidadesAuto;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "precioTotal")
    private Double precioTotal;
    @Column(name = "precioUnitario")
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetalleAdquisicion != null ? idDetalleAdquisicion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Detalleadquisicion)) {
            return false;
        }
        Detalleadquisicion other = (Detalleadquisicion) object;
        if ((this.idDetalleAdquisicion == null && other.idDetalleAdquisicion != null) || (this.idDetalleAdquisicion != null && !this.idDetalleAdquisicion.equals(other.idDetalleAdquisicion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Detalleadquisicion[ idDetalleAdquisicion=" + idDetalleAdquisicion + " ]";
    }
    
}
