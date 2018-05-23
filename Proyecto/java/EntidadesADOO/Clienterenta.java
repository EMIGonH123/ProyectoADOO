
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

public class Clienterenta implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer idCliente;
    private int idEmpleado;
    private String nombreCliente;
    private String apPaterno;
    private String apMaterno;
    private String rfcCliente;
    private String entidadCliente;
    private String municipioCliente;
    private String coloniaCliente;
    private String calleCliente;
    private Integer noExterior;
    private Integer noInterior;
    private Integer cpCliente;
    private String telCliente;
    private String emailCliente;
    private String passCliente;
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
}
