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
@Table(name = "automovil")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Automovil.findAll", query = "SELECT a FROM Automovil a")
    , @NamedQuery(name = "Automovil.findByMatriculaAuto", query = "SELECT a FROM Automovil a WHERE a.matriculaAuto = :matriculaAuto")
    , @NamedQuery(name = "Automovil.findByNombreAuto", query = "SELECT a FROM Automovil a WHERE a.nombreAuto = :nombreAuto")
    , @NamedQuery(name = "Automovil.findByColorAuto", query = "SELECT a FROM Automovil a WHERE a.colorAuto = :colorAuto")
    , @NamedQuery(name = "Automovil.findByModeloAuto", query = "SELECT a FROM Automovil a WHERE a.modeloAuto = :modeloAuto")
    , @NamedQuery(name = "Automovil.findByCapacidadAuto", query = "SELECT a FROM Automovil a WHERE a.capacidadAuto = :capacidadAuto")
    , @NamedQuery(name = "Automovil.findByKilometrajeAuto", query = "SELECT a FROM Automovil a WHERE a.kilometrajeAuto = :kilometrajeAuto")
    , @NamedQuery(name = "Automovil.findByPrecioAuto", query = "SELECT a FROM Automovil a WHERE a.precioAuto = :precioAuto")
    , @NamedQuery(name = "Automovil.findByIdSucursal", query = "SELECT a FROM Automovil a WHERE a.idSucursal = :idSucursal")
    , @NamedQuery(name = "Automovil.findByIdMarca", query = "SELECT a FROM Automovil a WHERE a.idMarca = :idMarca")
    , @NamedQuery(name = "Automovil.findByIdTipo", query = "SELECT a FROM Automovil a WHERE a.idTipo = :idTipo")
    , @NamedQuery(name = "Automovil.findByIdEstado", query = "SELECT a FROM Automovil a WHERE a.idEstado = :idEstado")})
public class Automovil implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "matriculaAuto")
    private String matriculaAuto;
    @Column(name = "nombreAuto")
    private String nombreAuto;
    @Column(name = "colorAuto")
    private String colorAuto;
    @Column(name = "modeloAuto")
    private Integer modeloAuto;
    @Column(name = "capacidadAuto")
    private Integer capacidadAuto;
    @Column(name = "kilometrajeAuto")
    private Integer kilometrajeAuto;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "precioAuto")
    private Double precioAuto;
    @Basic(optional = false)
    @Column(name = "idSucursal")
    private int idSucursal;
    @Basic(optional = false)
    @Column(name = "idMarca")
    private int idMarca;
    @Basic(optional = false)
    @Column(name = "idTipo")
    private int idTipo;
    @Basic(optional = false)
    @Column(name = "idEstado")
    private int idEstado;

    public Automovil() {
    }

    public Automovil(String matriculaAuto) {
        this.matriculaAuto = matriculaAuto;
    }

    public Automovil(String matriculaAuto, int idSucursal, int idMarca, int idTipo, int idEstado) {
        this.matriculaAuto = matriculaAuto;
        this.idSucursal = idSucursal;
        this.idMarca = idMarca;
        this.idTipo = idTipo;
        this.idEstado = idEstado;
    }

    public String getMatriculaAuto() {
        return matriculaAuto;
    }

    public void setMatriculaAuto(String matriculaAuto) {
        this.matriculaAuto = matriculaAuto;
    }

    public String getNombreAuto() {
        return nombreAuto;
    }

    public void setNombreAuto(String nombreAuto) {
        this.nombreAuto = nombreAuto;
    }

    public String getColorAuto() {
        return colorAuto;
    }

    public void setColorAuto(String colorAuto) {
        this.colorAuto = colorAuto;
    }

    public Integer getModeloAuto() {
        return modeloAuto;
    }

    public void setModeloAuto(Integer modeloAuto) {
        this.modeloAuto = modeloAuto;
    }

    public Integer getCapacidadAuto() {
        return capacidadAuto;
    }

    public void setCapacidadAuto(Integer capacidadAuto) {
        this.capacidadAuto = capacidadAuto;
    }

    public Integer getKilometrajeAuto() {
        return kilometrajeAuto;
    }

    public void setKilometrajeAuto(Integer kilometrajeAuto) {
        this.kilometrajeAuto = kilometrajeAuto;
    }

    public Double getPrecioAuto() {
        return precioAuto;
    }

    public void setPrecioAuto(Double precioAuto) {
        this.precioAuto = precioAuto;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (matriculaAuto != null ? matriculaAuto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Automovil)) {
            return false;
        }
        Automovil other = (Automovil) object;
        if ((this.matriculaAuto == null && other.matriculaAuto != null) || (this.matriculaAuto != null && !this.matriculaAuto.equals(other.matriculaAuto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Automovil[ matriculaAuto=" + matriculaAuto + " ]";
    }
    
}
