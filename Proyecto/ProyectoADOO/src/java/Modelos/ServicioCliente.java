
package Modelos;

import EntidadesADOO.*;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioCliente implements ServicioClienteLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public Clienterenta buscarCliente(int idCliente){
        return em.find(Clienterenta.class, idCliente);
    }
    
    @Override
    public void editarClientePorCliente(int idCliente, String entidad, String municipio, String colonia, String calle,
                                        int noExterior, int noInterior, int cp, String tel, String email, String pass){
        Clienterenta cliente = buscarCliente(idCliente);
        cliente.setIdCliente(idCliente);
        cliente.setEntidadCliente(entidad);
        cliente.setMunicipioCliente(municipio);
        cliente.setColoniaCliente(colonia);
        cliente.setCalleCliente(calle);
        cliente.setNoExterior(noExterior);
        cliente.setNoInterior(noInterior);
        cliente.setCpCliente(cp);
        cliente.setTelCliente(tel);
        cliente.setEmailCliente(email);
        cliente.setPassCliente(pass);
        em.merge(cliente);
        em.flush();
        em.refresh(cliente);
    
    }
    @Override
    public List<Clienterenta> getInfoCliente(int idCliente){
        String sql = "SELECT * FROM Clienterenta  WHERE idCliente = "+idCliente;
        return (List<Clienterenta>)em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Empleadorenta> getInfoEmpleado(int idEmpleado){
        String sql = "SELECT * FROM Empleadorenta  WHERE idEmpleado = "+idEmpleado;
        return (List<Empleadorenta>)em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<Object> getInfoRentasCliente(int idCliente){
        String sql = "SELECT r.*, s.*, a.nombreAuto, a.colorAuto, a.modeloAuto, a.kilometrajeAuto,"
                + " a.precioAuto, a.rutaAuto, ta.tipoAuto, am.nomMarca "
                + " FROM Renta r, Automovil a, Tipoauto ta, Automovilmarca am, Sucursal s"
                + " WHERE a.idSucursal = s.idSucursal AND "
                + " a.idMarca = am.idMarca AND "
                + " a.idTipo = ta.idTipo AND "
                + " r.matricula = a.matriculaAuto AND "
                + " r.idCliente = "+idCliente;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public boolean validaCampos(Hashtable<String,Boolean> a) {
        boolean bandera = true;
        Enumeration<String> k = a.keys();
        Enumeration<Boolean> v = a.elements();
        while(k.hasMoreElements()){
            String aux = k.nextElement();
            if(aux.equals("")){
                bandera = false;
                a.put(aux, bandera);
            }
        }
        
        return bandera;
    }

    @Override
    public boolean validarCadenas(String cadena) {
        String expresion = "^[\\D]+";
        if(cadena.matches(expresion))
            return true;
        return false;
    }

    @Override
    public boolean validarDigitos(String digitos) {
        String expresion = "^[\\d]+";
        if(digitos.matches(expresion))
            return true;
        return false;
    }

    @Override
    public boolean validarEmail(String email) {
        String expresion = "^([a-zA-Z])(.)*@[a-zA-Z]+\\.com";
        if(email.matches(expresion))
            return true;
        return false;
    }
}
