package analizadorlexico;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\f]+
SaltoLinea= \r|\n|\r\n
OPERADORES = ">"|"<"|"=="|"!="|">="|"<="|"and"|"or"|"not"|"++"|"--"|"true"|"false"| "+" | "-" |"@" |"=" |"*"

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* ========== IGNORAR ================*/
/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/*==========Separadores ===========*/

/* Salto de linea */
{SaltoLinea} {return new Symbol(sym.Linea, yychar, yyline, yytext());}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Coma, separador de elementos */
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/*============Palabras reservadas============*/

/* Tipos de datos numerico */
( Num ) {return new Symbol(sym.Num, yychar, yyline, yytext());}

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Tipo de dato Booleano */
( Bool ) {return new Symbol(sym.Bool, yychar, yyline, yytext());}

/* Palabra reservada Ecuacion */
( Ecuacion ) {return new Symbol(sym.Ecuacion, yychar, yyline, yytext());}

/* Palabra reservada Mostrar */
( Mostrar ) {return new Symbol(sym.Mostrar, yychar, yyline, yytext());}

/* Palabra reservada ResolverSistema */
( ResolverSistema ) {return new Symbol(sym.ResolverSistema, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "Inicio" ) {return new Symbol(sym.Inicio, yychar, yyline, yytext());}

/* Marcador de final de algoritmo */
( "Fin" ) {return new Symbol(sym.Fin, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}


/*============Operadores============*/

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operadores logicos */
( "and" | "or" | "not"  ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
("true" | "false")     {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/*=========Concatenador=======*/
/* Operador Concatenador */
( "@" ) {return new Symbol(sym.Concatenacion, yychar, yyline, yytext());}

/*=====Identificadores y numeros====*/

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ | {D}+(\.{D}+) {return new Symbol(sym.Numero, yychar, yyline, yytext());}


/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

{D}+(\.{D}+)+\.{D}+ {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
("=!" | "=>" | "=<") {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
({OPERADORES}+)   {return new Symbol(sym.ERROR, yychar, yyline, yytext());}




