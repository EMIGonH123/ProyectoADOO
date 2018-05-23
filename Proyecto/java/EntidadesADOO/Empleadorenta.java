
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

public class Empleadorenta implements Serializable {

    private Integer idEmpleado;
    private String nombreEmpleado;
    private String apPaternoEmpleado;
    private String apMaternoEmpleado;
    private String entidadEmpleado;
    private String municipioEmpleado;
    private String coloniaEmpleado;
    private String calleEmpleado;
    private Integer noExterior;
    private Integer noInterior;
    private Integer cpEmpleado;
    private String telEmpleado;
    private String emailEmpleado;
    private String passEmpleado;
    private int idTipoEmpleado;
    private String generoEmpleado;

    public Empleadorenta() {
    }

    public Empleadorenta(Integer idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public Empleadorenta(Integer idEmpleado, int idTipoEmpleado) {
        this.idEmpleado = idEmpleado;
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public Integer getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Integer idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getApPaternoEmpleado() {
        return apPaternoEmpleado;
    }

    public void setApPaternoEmpleado(String apPaternoEmpleado) {
        this.apPaternoEmpleado = apPaternoEmpleado;
    }

    public String getApMaternoEmpleado() {
        return apMaternoEmpleado;
    }

    public void setApMaternoEmpleado(String apMaternoEmpleado) {
        this.apMaternoEmpleado = apMaternoEmpleado;
    }

    public String getEntidadEmpleado() {
        return entidadEmpleado;
    }

    public void setEntidadEmpleado(String entidadEmpleado) {
        this.entidadEmpleado = entidadEmpleado;
    }

    public String getMunicipioEmpleado() {
        return municipioEmpleado;
    }

    public void setMunicipioEmpleado(String municipioEmpleado) {
        this.municipioEmpleado = municipioEmpleado;
    }

    public String getColoniaEmpleado() {
        return coloniaEmpleado;
    }

    public void setColoniaEmpleado(String coloniaEmpleado) {
        this.coloniaEmpleado = coloniaEmpleado;
    }

    public String getCalleEmpleado() {
        return calleEmpleado;
    }

    public void setCalleEmpleado(String calleEmpleado) {
        this.calleEmpleado = calleEmpleado;
    }

    public Integer getNoExterior() {
        return noExterior;
    }

    public void setNoExterior(Integer noExterior) {
        this.noExterior = noExterior;
    }

    public Integer getNoInterior() {
        return noInterior;
    }

    public void setNoInterior(Integer noInterior) {
        this.noInterior = noInterior;
    }

    public Integer getCpEmpleado() {
        return cpEmpleado;
    }

    public void setCpEmpleado(Integer cpEmpleado) {
        this.cpEmpleado = cpEmpleado;
    }

    public String getTelEmpleado() {
        return telEmpleado;
    }

    public void setTelEmpleado(String telEmpleado) {
        this.telEmpleado = telEmpleado;
    }

    public String getEmailEmpleado() {
        return emailEmpleado;
    }

    public void setEmailEmpleado(String emailEmpleado) {
        this.emailEmpleado = emailEmpleado;
    }

    public String getPassEmpleado() {
        return passEmpleado;
    }

    public void setPassEmpleado(String passEmpleado) {
        this.passEmpleado = passEmpleado;
    }

    public int getIdTipoEmpleado() {
        return idTipoEmpleado;
    }

    public void setIdTipoEmpleado(int idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public String getGeneroEmpleado() {
        return generoEmpleado;
    }

    public void setGeneroEmpleado(String generoEmpleado) {
        this.generoEmpleado = generoEmpleado;
    }
    
}
