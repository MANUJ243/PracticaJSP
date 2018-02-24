package jBean;

import java.io.Serializable;

/**
 * @author MANUEL MORENO DELGADO 2ºDAM
 */
public class insertarBean implements Serializable {

    public String valor, divisa, fecha;

    public insertarBean() {
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getDivisa() {
        return divisa;
    }

    public void setDivisa(String divisa) {
        this.divisa = divisa;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String formatearFecha() {
        String mes, dia, año;                                
        año = fecha.substring(0, 4);
        mes = fecha.substring(5, 7);
        dia = fecha.substring(8, 10);
        return dia + "/" + mes + "/" + año;
    }
    
    public String formatearValor(){
        return this.valor.replaceAll("\\.", ",");
    }
}
