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
@Table(name = "automovilmarca")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Automovilmarca.findAll", query = "SELECT a FROM Automovilmarca a")
    , @NamedQuery(name = "Automovilmarca.findByIdMarca", query = "SELECT a FROM Automovilmarca a WHERE a.idMarca = :idMarca")
    , @NamedQuery(name = "Automovilmarca.findByNomMarca", query = "SELECT a FROM Automovilmarca a WHERE a.nomMarca = :nomMarca")})
public class Automovilmarca implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idMarca")
    private Integer idMarca;
    @Column(name = "nomMarca")
    private String nomMarca;

    public Automovilmarca() {
    }

    public Automovilmarca(Integer idMarca) {
        this.idMarca = idMarca;
    }

    public Integer getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(Integer idMarca) {
        this.idMarca = idMarca;
    }

    public String getNomMarca() {
        return nomMarca;
    }

    public void setNomMarca(String nomMarca) {
        this.nomMarca = nomMarca;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMarca != null ? idMarca.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Automovilmarca)) {
            return false;
        }
        Automovilmarca other = (Automovilmarca) object;
        if ((this.idMarca == null && other.idMarca != null) || (this.idMarca != null && !this.idMarca.equals(other.idMarca))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntidadesADOO.Automovilmarca[ idMarca=" + idMarca + " ]";
    }
    
}
