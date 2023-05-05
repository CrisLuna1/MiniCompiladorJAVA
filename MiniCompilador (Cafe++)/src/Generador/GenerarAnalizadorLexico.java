
package Generador;

import java.io.File;

/**
 *
 * @author Cluna
 */
public class GenerarAnalizadorLexico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String path = "C:\\Users\\Cluna\\Desktop\\Proyecto Compiladores\\MiniCompilador\\src\\Lexico\\Cafe++.flex";
        generarLexer(path);
    }

    public static void generarLexer(String path) {
        File file = new File(path);

        jflex.Main.generate(file);
    }

    
}
