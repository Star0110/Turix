/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package analizadorlexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;


/**
 *
 * @author stare
 */
public class Principal {
    
    
    public static void main(String[] args) throws Exception {
        
        String ruta1="C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/Lexer.flex";
        String ruta2="C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/LexerCup.flex";
        String[] rutaS={"-parser", "Sintax", "C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/Sintax.cup"};
        generar(ruta1,ruta2,rutaS);
        
        
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo=new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo=new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym=Paths.get("C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/sym.java");
        
       if(Files.exists(rutaSym)){
           Files.delete(rutaSym);
       }
        Files.move(Paths.get("C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/sym.java"),
                Paths.get("C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/sym.java"));
        
        Path rutaSin=Paths.get("C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/Sintax.java");
        if(Files.exists(rutaSin)){
           Files.delete(rutaSin);
       }
        
        Files.move(Paths.get("C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/Sintax.java"),
                Paths.get("C:/Users/stare/OneDrive/Documentos/NetBeansProjects/Turix/src/analizadorlexico/Sintax.java"));
    }
}
