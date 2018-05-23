package Modelos;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ServicioFragmentacion implements ServicioFragmentacionLocal {
    @PersistenceContext(unitName = "ProyectoADOOPU2")
    private EntityManager em;

    public void insertar(Object object) {
        em.persist(object);
        em.merge(object);
        em.flush();
        em.refresh(object);
    }
    
    @Override
    public List<Object> getTablasDeLaBD(){
        String sql = "SHOW Tables";
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public List<String> obtenerAtributosDeTabla(String nombre){
        String sql = "DESCRIBE "+ nombre;
        return em.createNativeQuery(sql).getResultList();
    }
    
    @Override
    public ArrayList<String> getAtrigutosDeTabla(String nombre){
        ArrayList<String> adquisicion = new ArrayList<String>();
        adquisicion.add("idAdquisicion");
        adquisicion.add("idProveedor");
        adquisicion.add("idEmpleado");
        adquisicion.add("fechaAdquisicion");
        adquisicion.add("totalAdquisicion");
        
        ArrayList<String> automovil = new ArrayList<String>();
        automovil.add("matriculaAuto");
        automovil.add("nombreAuto");
        automovil.add("colorAuto");
        automovil.add("modeloAuto");
        automovil.add("capacidadAuto");
        automovil.add("kilometrajeAuto");
        automovil.add("precioAuto");
        automovil.add("idSucursal");
        automovil.add("idMarca");
        automovil.add("idTipo");
        automovil.add("idEstado");
        
        ArrayList<String> automovilMarca = new ArrayList<String>();
        automovilMarca.add("idMarca");
        automovilMarca.add("nomMarca");
        
        ArrayList<String> clienteRenta = new ArrayList<String>();
        clienteRenta.add("idCliente");
        clienteRenta.add("idEmpleado");
        clienteRenta.add("NombreCliente");
        clienteRenta.add("apPaterno");
        clienteRenta.add("apMaterno");
        clienteRenta.add("rfcCliente");
        clienteRenta.add("entidadCliente");
        clienteRenta.add("municipioCliente");
        clienteRenta.add("coloniaCliente");
        clienteRenta.add("calleCliente");
        clienteRenta.add("noExterior");
        clienteRenta.add("noInterior");
        clienteRenta.add("telCliente");
        clienteRenta.add("emailCliente");
        clienteRenta.add("passCliente");
        clienteRenta.add("generoCliente");
        
        ArrayList<String> cuenta = new ArrayList<String>();
        cuenta.add("numeroDeCuenta");
        cuenta.add("idCliente");
        cuenta.add("idDetalleCuenta");
        cuenta.add("saldo");
        
        ArrayList<String> detalleAdquisicion = new ArrayList<String>();
        detalleAdquisicion.add("idDetalleAdquisicion");
        detalleAdquisicion.add("idAdquisicion");
        detalleAdquisicion.add("nombreAuto");
        detalleAdquisicion.add("modeloAuto");
        detalleAdquisicion.add("unidadesAuto");
        detalleAdquisicion.add("precioTotal");
        detalleAdquisicion.add("precioUnitario");
        
        ArrayList<String> detalleCuenta = new ArrayList<String>();
        detalleCuenta.add("idDetalleCuenta");
        detalleCuenta.add("detalleCuenta");
        detalleCuenta.add("fechaAdquisicionSaldo");
        detalleCuenta.add("fechaLimitePago");
        detalleCuenta.add("pagoMinimo");
        detalleCuenta.add("intereses");
        
        ArrayList<String> empleadoRenta = new ArrayList<String>();
        
        empleadoRenta.add("idEmpleado");
        empleadoRenta.add("NombreEmpleado");
        empleadoRenta.add("apPaternoEmpleado");
        empleadoRenta.add("apMaternoEmpleado");
        empleadoRenta.add("entidadEmpleado");
        empleadoRenta.add("municipioEmpleado");
        empleadoRenta.add("coloniaEmpleado");
        empleadoRenta.add("calleEmpleado");
        empleadoRenta.add("noExterior");
        empleadoRenta.add("noInterior");
        empleadoRenta.add("telEmpleado");
        empleadoRenta.add("emailEmpleado");
        empleadoRenta.add("passEmpleado");
        empleadoRenta.add("idTipoEmpleado");
        empleadoRenta.add("generoEmpleado");
        
        ArrayList<String> estadoAuto = new ArrayList<String>();
        estadoAuto.add("idEstado");
        estadoAuto.add("estadoAuto");
        
        ArrayList<String> proveedor = new ArrayList<String>();
        proveedor.add("idProveedor");
        proveedor.add("nombreProveedor");
        proveedor.add("emailProveedor");
        proveedor.add("telProveedor");
        
        ArrayList<String> proveedorSucursal = new ArrayList<String>();
        proveedorSucursal.add("idProveedor");
        proveedorSucursal.add("idSucursal");
        
        
        ArrayList<String> renta = new ArrayList<String>();
        renta.add("idRenta");
        renta.add("idCliente");
        renta.add("matricula");
        renta.add("descripcionRenta");
        renta.add("fechaInicioRenta");
        renta.add("fechaFinRenta");
        renta.add("totalRenta");
        renta.add("unidesRenta");
        renta.add("tipoPago");
        
        ArrayList<String> sucursal = new ArrayList<String>();
        sucursal.add("idSucursal");
        sucursal.add("nombreSucursal");
        sucursal.add("estadoSucursal");
        sucursal.add("coloniaSucursal");
        sucursal.add("calleSucursal");
        sucursal.add("cpSucursal");
        sucursal.add("telSucursal");
        
        ArrayList<String> sucursalPersona = new ArrayList<String>();
        sucursalPersona.add("idSucursal");
        sucursalPersona.add("idEmpleado");
        
        ArrayList<String> tipoAuto = new ArrayList<String>();
        tipoAuto.add("idTipo");
        tipoAuto.add("tipoAuto");
        
        ArrayList<String> tipoEmpleado = new ArrayList<String>();
        tipoEmpleado.add("idTipoEmpleado");
        tipoEmpleado.add("descEmpleado");
        
        ArrayList<String> tipoPago = new ArrayList<String>();
        tipoPago.add("idTipoPago");
        tipoPago.add("tipoPago");
        
        
        switch(nombre){
            case "adquisicion":
                return adquisicion;
            case "automovil":
                return automovil;
            case "automovilMarca":
                return automovilMarca;
            case "clienteRenta":
                return clienteRenta;
            case "cuenta":
                return cuenta;
            case "detalleAdquisicion":
                return detalleAdquisicion;
            case "detalleCuenta":
                return detalleCuenta;
            case "empleadoRenta":
                return empleadoRenta;
            case "estadoAuto":
                return estadoAuto;
            case "proveedor":
                return proveedor;
            case "proveedorSucursal":
                return proveedorSucursal;
            case "renta":
                return renta;
            case "sucursal":
                return sucursal;
            case "sucursalPersona":
                return sucursalPersona;
            case "tipoAuto":
                return tipoAuto;
            case "tipoEmpleado":
                return tipoEmpleado;
            case "tipoPago":
                return tipoPago;
                
        }
        return null;
    }
}
