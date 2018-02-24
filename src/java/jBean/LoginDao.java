package jBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author MANUEL MORENO DELGADO 2ºDAM
 */
public class LoginDao {

    public static boolean validate(LoginBean bean) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement(
            "select * from usuarios where usuario=? and ppaso=?");
          
            ps.setString(1, bean.getEmail());
            ps.setString(2, bean.getPass());

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
        }

        return status;
    }
}
