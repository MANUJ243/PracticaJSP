package jBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author MANUEL MORENO DELGADO 2ºDAM
 */
public class baseMetodos {

    public static ArrayList<ArrayList<String>> divisas;

    public static boolean insertRow(String[] valores) {
        String insertSQL = "INSERT INTO CAMBIO_EURO (ORIGEN, DESTINO, FECHA, CAMBIO) VALUES (?,?,?,?)";
        PreparedStatement preparedStatement;
        try {
            preparedStatement = ConnectionProvider.getCon().prepareStatement(insertSQL);
            preparedStatement.setString(1, "EUR");

            for (int i = 0; i < valores.length; i++) {
                preparedStatement.setString(i + 2, valores[i]);
            }
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            return false;
        }
        return true;
    }

    public static ArrayList<ArrayList<String>> getDivisas() {
        divisas = new ArrayList<>();

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement(
                    "select * from divisas");
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int col = rsmd.getColumnCount();

            while (rs.next()) {
                ArrayList<String> fila = new ArrayList<>();
                for (int i = 1; i <= col; i++) {
                    fila.add(rs.getString(i));
                }
                divisas.add(fila);
            }
        } catch (SQLException ex) {
        }

        return divisas;
    }

    public static ResultSet getCambios(String divisa, String fecha) {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement ps = con.createStatement();
            rs = ps.executeQuery("select * from cambio_euro where destino = '" + divisa + "' and to_date(fecha,'DD/MM/YYYY') <= to_date('" + fecha + "','DD/MM/YYYY')");
        } catch (SQLException ex) {
        }

        return rs;
    }

    public static double getConversion(String importe, String origen, String destino, String fecha) {
        Double vOrigen, vDestino;
        Double importeV = Double.parseDouble(importe);

        if (origen.equals("EUR")) {
            vOrigen = 1.0;
        } else {
            vOrigen = getV(origen,fecha);
        }
        
        if (destino.equals("EUR")) {
            vDestino = 1.0;
        }else{
            vDestino = getV(destino, fecha);
        }

        return importeV / vOrigen * vDestino;
    }

    private static Double getV(String origen, String fecha) {
        String v = "2";
        try {
            Connection con = ConnectionProvider.getCon();
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(
                    "SELECT CAMBIO"
                    + " FROM CAMBIO_EURO"
                    + " WHERE DESTINO = '"+origen+"'"
                    + " AND FECHA = '"+fecha+"'");
            rs.next();
            v = rs.getString(1);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        System.out.println(v);
        return Double.parseDouble(v);
    }

    public static ResultSet getFechas() {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement ps = con.createStatement();
            rs = ps.executeQuery("SELECT DISTINCT FECHA FROM CAMBIO_EURO");
        } catch (SQLException ex) {
        }

        return rs;
    }
}
