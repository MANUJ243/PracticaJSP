package jBean;

/**
 * @author MANUEL MORENO DELGADO 2ºDAM
 */
import java.util.*;

public class numeroGenerado {

    int answer;
    boolean success;
    String hint;
    int numGuesses;

    public numeroGenerado() {
        reset();
    }

    public void setGuess(String guess) {
        numGuesses++;
        int g;
        
        try {
            g = Integer.parseInt(guess);
        } catch (NumberFormatException e) {
            g = -1;
        }
        if (g == answer) {
            success = true;
        } else if (g == -1) {
            hint = "Introduce un numero la proxima vez";
        } else if (g < answer) {
            hint = "Más alto";
        } else if (g > answer) {
            hint = "Mas bajo";
        }
    }

    public boolean getSuccess() {
        return success;
    }

    public String getHint() {
        return "" + hint;
    }

    public int getNumGuesses() {
        return numGuesses;
    }

    public void reset() {
        answer = Math.abs(new Random().nextInt() % 100) + 1;
        success = false;
        numGuesses = 0;
    }
}
