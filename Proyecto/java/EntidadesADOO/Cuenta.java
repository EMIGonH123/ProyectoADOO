
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

public class Cuenta implements Serializable {

    private String numeroDeCuenta;
    private int idCliente;
    private int idDetalleCuenta;
    private Double saldo;

    public Cuenta() {
    }

    public Cuenta(String numeroDeCuenta) {
        this.numeroDeCuenta = numeroDeCuenta;
    }

    public Cuenta(String numeroDeCuenta, int idCliente, int idDetalleCuenta) {
        this.numeroDeCuenta = numeroDeCuenta;
        this.idCliente = idCliente;
        this.idDetalleCuenta = idDetalleCuenta;
    }

    public String getNumeroDeCuenta() {
        return numeroDeCuenta;
    }

    public void setNumeroDeCuenta(String numeroDeCuenta) {
        this.numeroDeCuenta = numeroDeCuenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdDetalleCuenta() {
        return idDetalleCuenta;
    }

    public void setIdDetalleCuenta(int idDetalleCuenta) {
        this.idDetalleCuenta = idDetalleCuenta;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }
    
}
