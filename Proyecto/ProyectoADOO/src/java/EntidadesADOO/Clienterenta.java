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
@Table(name = "clienterenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Clienterenta.findAll", query = "SELECT c FROM Clienterenta c")
    , @NamedQuery(name = "Clienterenta.findByIdCliente", query = "SELECT c FROM Clienterenta c WHERE c.idCliente = :idCliente")
    , @NamedQuery(name = "Clienterenta.findByIdEmpleado", query = "SELECT c FROM Clienterenta c WHERE c.idEmpleado = :idEmpleado")
    , @NamedQuery(name = "Clienterenta.findByNombreCliente", query = "SELECT c FROM Clienterenta c WHERE c.nombreCliente = :nombreCliente")
    , @NamedQuery(name = "Clienterenta.findByApPaterno", query = "SELECT c FROM Clienterenta c WHERE c.apPaterno = :apPaterno")
    , @NamedQuery(name = "Clienterenta.findByApMaterno", query = "SELECT c FROM Clienterenta c WHERE c.apMaterno = :apMaterno")
    , @NamedQuery(name = "Clienterenta.findByRfcCliente", query = "SELECT c FROM Clienterenta c WHERE c.rfcCliente = :rfcCliente")
    , @NamedQuery(name = "Clienterenta.findByEntidadCliente", query = "SELECT c FROM Clienterenta c WHERE c.entidadCliente = :entidadCliente")
    , @NamedQuery(name = "Clienterenta.findByMunicipioCliente", query = "SELECT c FROM Clienterenta c WHERE c.municipioCliente = :municipioCliente")
    , @NamedQuery(name = "Clienterenta.findByColoniaCliente", query = "SELECT c FROM Clienterenta c WHERE c.coloniaCliente = :coloniaCliente")
    , @NamedQuery(name = "Clienterenta.findByCalleCliente", query = "SELECT c FROM Clienterenta c WHERE c.calleCliente = :calleCliente")
    , @NamedQuery(name = "Clienterenta.findByNoExterior", query = "SELECT c FROM Clienterenta c WHERE c.noExterior = :noExterior")
    , @NamedQuery(name = "Clienterenta.findByNoInterior", query = "SELECT c FROM Clienterenta c WHERE c.noInterior = :noInterior")
    , @NamedQuery(name = "Clienterenta.findByCpCliente", query = "SELECT c FROM Clienterenta c WHERE c.cpCliente = :cpCliente")
    , @NamedQuery(name = "Clienterenta.findByTelCliente", query = "SELECT c FROM Clienterenta c WHERE c.telCliente = :telCliente")
    , @NamedQuery(name = "Clienterenta.findByEmailCliente", query = "SELECT c FROM Clienterenta c WHERE c.emailCliente = :emailCliente")
    , @NamedQuery(name = "Clienterenta.findByPassCliente", query = "SELECT c FROM Clienterenta c WHERE c.passCliente = :passCliente")
    , @NamedQuery(name = "Clienterenta.findByGeneroCliente", query = "SELECT c FROM Clienterenta c WHERE c.generoCliente = :generoCliente")})
public class Clienterenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idCliente")
    private Integer idCliente;
    @Basic(optional = false)
    @Column(name = "idEmpleado")
    private int idEmpleado;
    @Column(name = "NombreCliente")
    private String nombreCliente;
    @Column(name = "apPaterno")
    private String apPaterno;
    @Column(name = "apMaterno")
    private String apMaterno;
    @Column(name = "rfcCliente")
    private String rfcCliente;
    @Column(name = "entidadCliente")
    private String entidadCliente;
    @Column(name = "municipioCliente")
    private String municipioCliente;
    @Column(name = "coloniaCliente")
    private String coloniaCliente;
    @Column(name = "calleCliente")
    private String calleCliente;
    @Column(name = "noExterior")
    private Integer noExterior;
    @Column(name = "noInterior")
    private Integer noInterior;
    @Column(name = "cpCliente")
    private Integer cpCliente;
    @Column(name = "telCliente")
    private String telCliente;
    @Column(name = "emailCliente")
    private String emailCliente;
    @Column(name = "passCliente")
    private String passCliente;
    @Column(name = "generoCliente")
    private String generoCliente;

    public Clienterenta() {
    }

    public Clienterenta(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public Clienterenta(Integer idCliente, int idEmpleado) {
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getRfcCliente() {
        return rfcCliente;
    }

    public void setRfcCliente(String rfcCliente) {
        this.rfcCliente = rfcCliente;
    }

    public String getEntidadCliente() {
        return entidadCliente;
    }

    public void setEntidadCliente(String entidadCliente) {
        this.entidadCliente = entidadCliente;
    }

    public String getMunicipioCliente() {
        return municipioCliente;
    }

    public void setMunicipioCliente(String municipioCliente) {
        this.municipioCliente = municipioCliente;
    }

    public String getColoniaCliente() {
        return coloniaCliente;
    }

    public void setColoniaCliente(String coloniaCliente) {
        this.coloniaCliente = coloniaCliente;
    }

    public String getCalleCliente() {
        return calleCliente;
    }

    public void setCalleCliente(String calleCliente) {
        this.calleCliente = calleCliente;
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

    public Integer getCpCliente() {
        return cpCliente;
    }

    public void setCpCliente(Integer cpCliente) {
        this.cpCliente = cpCliente;
    }

    public String getTelCliente() {
        return telCliente;
    }

    public void setTelCliente(String telCliente) {
        this.telCliente = telCliente;
    }

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public String getPassCliente() {
        return passCliente;
    }

    public void setPassCliente(String passCliente) {
        this.passCliente = passCliente;
    }

    public String getGeneroCliente() {
        return generoCliente;
    }

    public void setGeneroCliente(String generoCliente) {
        this.generoCliente = generoCliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCliente != null ? idCliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Clienterenta)) {
            return false;
        }
        Clienterenta other = (Clienterenta) object;
        if ((this.idCliente == null && other.idCliente != null) || (this.idCliente != null && !this.idCliente.equals(other.idCliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Clienterenta[ idCliente=" + idCliente + " ]";
    }
    
}
