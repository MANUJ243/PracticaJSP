package jBean;

import java.io.Serializable;

/**
 * @author MANUEL MORENO DELGADO 2ºDAM
 */
public class convertirBean implements Serializable {

    public String importe, divisaOrigen, divisaDestino, fecha;

    public convertirBean() {
    }

    public String getImporte() {
        return importe;
    }

    public void setImporte(String importe) {
        this.importe = importe;
    }

    public String getDivisaOrigen() {
        return divisaOrigen;
    }

    public void setDivisaOrigen(String divisaOrigen) {
        this.divisaOrigen = divisaOrigen;
    }

    public String getDivisaDestino() {
        return divisaDestino;
    }

    public void setDivisaDestino(String divisaDestino) {
        this.divisaDestino = divisaDestino;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    public String formatearValor(){
        return this.importe.replaceAll(",", "\\.");
    }
}
