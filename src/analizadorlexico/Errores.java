package analizadorlexico;

import java.util.ArrayList;

public class Errores {

    private static ArrayList<String> lista = new ArrayList<>();

    public static void add(String mensaje) {
        lista.add(mensaje);
    }

    public static ArrayList<String> getErrores() {
        return lista;
    }

    public static void limpiar() {
        lista.clear();
    }

    public static boolean hayErrores() {
        return !lista.isEmpty();
    }
}




