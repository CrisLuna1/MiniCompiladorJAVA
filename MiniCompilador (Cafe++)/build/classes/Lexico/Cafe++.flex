package Lexico;

import java_cup.runtime.*;
import java.io.Reader;
import Sintactico.sym;
%%
%public
%class AnalizadorLexico
%cup



%line
%column
%char

Letras=[a-zA-Z_]
Digitos=[0-9]
Operador=[*+/-]
Agrupacion=[( ) { } ,]
Simbolo=[ ? # $ % & ´ \[ \] \~ : = \( \) \{ \} \< \> \. \\ \/ \! ' \| - _]
ESPACIO=[ \t\r\n]

%{


public Pintar estilo = new Pintar();

public String nameToken = null;
public int numLinea(){
    return yyline;
}

public String getCodigo(){
    return this.zzReader.toString();
}

%}
%%

{ESPACIO} {/* ignore */}
"//".* {/* ignore */}

"INICIO" 
{
    nameToken = "Super_Inicio";
    estilo.pintaAzulBold(yychar,yylength());
    return new Symbol(sym.Super_Inicio, yychar, yyline,new String(yytext()));
}


"var"
{
    nameToken = "Situacion";
    estilo.pintaRojo(yychar,yylength());
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"leer"
{       
    nameToken = "Situacion"; 
    estilo.pintaRojo(yychar,yylength());
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"imprimir"
{
    nameToken = "Situacion"; 
    estilo.pintaVerde(yychar,yylength());
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"repetir"
{   
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion"; 
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"hasta"
{   
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion"; 
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"hacer"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion"; 
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"fin_repetir"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion"; 
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}


"mientras"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion";
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));  
}

"fin_mientras"
{
   estilo.pintaRojo(yychar,yylength());
   nameToken = "Situacion";
   return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));   
}

"Y"|"O"|"diferente"|"igual"|"no"|"mayor"|"menor"|"menorigual"|"mayorigual"|"diferente" 
{
 
    nameToken = "Alternativa";
    estilo.pintaAzulFuerte(yychar,yylength());
    return new Symbol(sym.Alternativa, yychar, yyline,new String(yytext()));
}

"si"
{
    nameToken = "Situacion";
    estilo.pintaRojo(yychar,yylength());
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"entonces"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion";
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"sino"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion";
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}

"fin_si"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Situacion";
    return new Symbol(sym.Situacion, yychar, yyline,new String(yytext()));
}


"+"
 {
    estilo.pintaRojoBajo(yychar,yylength());
    nameToken = "Operdor";    
    return new Symbol(sym.Operdor, yychar, yyline,new String(yytext()));
}

"-"
 {
    estilo.pintaRojoBajo(yychar,yylength());
    nameToken = "Operdor";    
    return new Symbol(sym.Operdor, yychar, yyline,new String(yytext()));
}


"*"
 {
    estilo.pintaRojoBajo(yychar,yylength());
    nameToken = "Operdor";    
    return new Symbol(sym.Operdor, yychar, yyline,new String(yytext()));
}


"/"
 {
    estilo.pintaRojoBajo(yychar,yylength());
    nameToken = "Operdor";    
    return new Symbol(sym.Operdor, yychar, yyline,new String(yytext()));
}

"="
{
    estilo.pintaRojoBajo(yychar,yylength());
    nameToken = "Operdor";
    return new Symbol(sym.Operdor, yychar, yyline,new String(yytext()));
}

"Verdadero"|"Falso"
{
    estilo.pintaRojo(yychar,yylength());
    nameToken = "Desicion";
    return new Symbol(sym.Desicion, yychar, yyline,new String(yytext()));
}

"inc"|"dec"
{
    
    nameToken = "Operdor";
    estilo.pintaRojo(yychar,yylength());
    return new Symbol(sym.Operdor, yychar, yyline,new String(yytext()));
}

"(" 
{    
    nameToken = "Agrupacion";
    estilo.pintaAzul(yychar,yylength());
    return new Symbol(sym.Agrupacion, yychar, yyline,new String(yytext()));
}

")" 
{
    nameToken = "Agrupacion";
    estilo.pintaAzul(yychar,yylength());
    return new Symbol(sym.Agrupacion, yychar, yyline,new String(yytext()));
}


"{" 
{   
    estilo.pintaAzul(yychar,yylength());
    nameToken = "Agrupacion";
    return new Symbol(sym.Agrupacion, yychar, yyline,new String(yytext()));
}

"}" 
{
    nameToken = "Agrupacion";
    return new Symbol(sym.Agrupacion, yychar, yyline,new String(yytext()));
}


"," 
{
    nameToken = "Puntuacion";
    estilo.pintaAzul(yychar,yylength());
    return new Symbol(sym.Puntuacion, yychar, yyline,new String(yytext()));
}



{Digitos}{Digitos}* {
    nameToken = "Cifra";
    estilo.pintaMorado(yychar,yylength());
    return new Symbol(sym.Cifra, yychar,yyline,new String(yytext()));
}


{Digitos}{Digitos}*"."{Digitos}{Digitos}* 
{
    nameToken = "Cifra";
    estilo.pintaMorado(yychar,yylength());
    return new Symbol(sym.Cifra, yychar,yyline,new String(yytext()));
}


"\"" ({Letras}|{Digitos}|{Operador}|{Agrupacion}|{Simbolo})* "\"" 
{
    nameToken = "Palabras";
    estilo.pintaRojo(yychar,yylength());
    return new Symbol(sym.Palabras, yychar,yyline,new String(yytext()));
}


{Letras}({Letras}|{Digitos})*
{
    nameToken = "Palabras";
    estilo.pintaAzul(yychar,yylength());
    return new Symbol(sym.Palabras, yychar,yyline,new String(yytext()));
}

";"
{
    nameToken = "Puntuacion";
    estilo.pintaAzul(yychar,yylength());
    return new Symbol(sym.Puntuacion, yychar, yyline,new String(yytext()));
}

. {
    nameToken = "ERROR";
    estilo.pintaRojoError(yychar,yylength());
    return new Symbol(sym.ERROR, yychar, yyline,new String(yytext()));
}