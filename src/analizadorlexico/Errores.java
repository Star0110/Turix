package analizadorlexico;

public class Errores {
    private static String esperado;

    public static void add(String esperado_) {
        esperado = esperado_;
    }

    public static String getErrores() {
        return esperado;
    }

    public static boolean hayErrores() {
        return esperado != null && !esperado.isEmpty();
    }

    public static void limpiar() {
        esperado = null;
    }
}

