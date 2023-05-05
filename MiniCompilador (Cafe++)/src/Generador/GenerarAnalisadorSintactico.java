package Generador;

/**
 *
 * @author Cluna
 */
public class GenerarAnalisadorSintactico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        System.out.println("\n*** Generando ***\n");
        String archLexico = "";
        String archSintactico = "";

        archLexico = "C:\\Users\\Cluna\\Desktop\\Proyecto Compiladores\\MiniCompilador\\src\\Lexico\\Cafe++.flex";;
        archSintactico = "C:\\Users\\Cluna\\Desktop\\Proyecto Compiladores\\MiniCompilador\\src\\Sintactico\\Gramatica.cup";;
        String[] alexico = {archLexico};
        String[] asintactico = {"-parser", "AnalizadorSintactico", archSintactico};
        jflex.Main.main(alexico);
        

    }

   

    
}
