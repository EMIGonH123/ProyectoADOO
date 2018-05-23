
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

public class Automovil implements Serializable {

    private String matriculaAuto;
    private String nombreAuto;
    private String colorAuto;
    private Integer modeloAuto;
    private Integer capacidadAuto;
    private Integer kilometrajeAuto;
    private Double precioAuto;
    private int idSucursal;
    private int idMarca;
    private int idTipo;
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
    
}
