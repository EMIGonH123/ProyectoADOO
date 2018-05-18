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
@Table(name = "empleadorenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Empleadorenta.findAll", query = "SELECT e FROM Empleadorenta e")
    , @NamedQuery(name = "Empleadorenta.findByIdEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.idEmpleado = :idEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByNombreEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.nombreEmpleado = :nombreEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByApPaternoEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.apPaternoEmpleado = :apPaternoEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByApMaternoEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.apMaternoEmpleado = :apMaternoEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByEntidadEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.entidadEmpleado = :entidadEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByMunicipioEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.municipioEmpleado = :municipioEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByColoniaEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.coloniaEmpleado = :coloniaEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByCalleEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.calleEmpleado = :calleEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByNoExterior", query = "SELECT e FROM Empleadorenta e WHERE e.noExterior = :noExterior")
    , @NamedQuery(name = "Empleadorenta.findByNoInterior", query = "SELECT e FROM Empleadorenta e WHERE e.noInterior = :noInterior")
    , @NamedQuery(name = "Empleadorenta.findByCpEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.cpEmpleado = :cpEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByTelEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.telEmpleado = :telEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByEmailEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.emailEmpleado = :emailEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByPassEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.passEmpleado = :passEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByIdTipoEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.idTipoEmpleado = :idTipoEmpleado")
    , @NamedQuery(name = "Empleadorenta.findByGeneroEmpleado", query = "SELECT e FROM Empleadorenta e WHERE e.generoEmpleado = :generoEmpleado")})
public class Empleadorenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEmpleado")
    private Integer idEmpleado;
    @Column(name = "nombreEmpleado")
    private String nombreEmpleado;
    @Column(name = "apPaternoEmpleado")
    private String apPaternoEmpleado;
    @Column(name = "apMaternoEmpleado")
    private String apMaternoEmpleado;
    @Column(name = "entidadEmpleado")
    private String entidadEmpleado;
    @Column(name = "municipioEmpleado")
    private String municipioEmpleado;
    @Column(name = "coloniaEmpleado")
    private String coloniaEmpleado;
    @Column(name = "calleEmpleado")
    private String calleEmpleado;
    @Column(name = "noExterior")
    private Integer noExterior;
    @Column(name = "noInterior")
    private Integer noInterior;
    @Column(name = "cpEmpleado")
    private Integer cpEmpleado;
    @Column(name = "telEmpleado")
    private String telEmpleado;
    @Column(name = "emailEmpleado")
    private String emailEmpleado;
    @Column(name = "passEmpleado")
    private String passEmpleado;
    @Basic(optional = false)
    @Column(name = "idTipoEmpleado")
    private int idTipoEmpleado;
    @Column(name = "generoEmpleado")
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEmpleado != null ? idEmpleado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Empleadorenta)) {
            return false;
        }
        Empleadorenta other = (Empleadorenta) object;
        if ((this.idEmpleado == null && other.idEmpleado != null) || (this.idEmpleado != null && !this.idEmpleado.equals(other.idEmpleado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Empleadorenta[ idEmpleado=" + idEmpleado + " ]";
    }
    
}
