package jBean;

import java.io.Serializable;

/**
 * @author MANUEL MORENO DELGADO 2ºDAM
 */
public class LoginBean implements Serializable{

    public String email, pass;
    private int cont=1;
    
    public LoginBean( ) {  }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public void sumCont(){
        this.cont++;
    }
    
    public int getCont(){
        return this.cont;
    }
}
