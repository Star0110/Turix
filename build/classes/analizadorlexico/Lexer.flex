package analizadorlexico;
import static analizadorlexico.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\f]+
SaltoLinea= \r|\n|\r\n
OPERADORES = ">"|"<"|"=="|"!="|">="|"<="|"and"|"or"|"not"|"++"|"--"|"true"|"false"| "+" | "-" |"@" |"=" |"*"

%{
    public String lexeme;
%}
%%

/* ========== IGNORAR ================*/
/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/*==========Separadores ===========*/
/* Salto de linea */
{SaltoLinea} {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Coma, separador de elementos */
( "," ) {lexeme = yytext(); return Coma;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/*============Palabras reservadas============*/

/* Tipos de datos numerico */
( Num ) {lexeme=yytext(); return Num;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Tipo de dato Booleano */
( Bool ) {lexeme=yytext(); return Bool;}

/* Palabra reservada Ecuacion */
( Ecuacion ) {lexeme=yytext(); return Ecuacion;}

/* Palabra reservada Mostrar */
( Mostrar ) {lexeme=yytext(); return Mostrar;}

/* Palabra reservada ResolverSistema */
( ResolverSistema ) {lexeme=yytext(); return ResolverSistema;}

/* Marcador de inicio de algoritmo */
( "Inicio" ) {lexeme=yytext(); return Inicio;}

/* Marcador de final de algoritmo */
( "Fin" ) {lexeme=yytext(); return Fin;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}


/*============Operadores============*/

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operadores logicos */
( "and" | "or" | "not"  ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
("true" | "false")      {lexeme = yytext(); return Op_booleano;}

/*=========Concatenador=======*/
/* Operador Concatenador */
( "@" ) {lexeme=yytext(); return Concatenacion;}

/*=====Identificadores y numeros====*/

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}



/* Numero */
("(-"{D}+")")|{D}+ | {D}+(\.{D}+) {lexeme=yytext(); return Numero;}


/* Error de analisis */
 . {lexeme=yytext(); return ERROR;}

{D}+(\.{D}+)+\.{D}+ { lexeme = yytext(); return ERROR; }
("=!" | "=>" | "=<") { lexeme = yytext(); return ERROR; }
({OPERADORES}+)   { lexeme = yytext(); return ERROR; }



