%pointer
%option noyywrap

%%

 /* ── Reglas ya implementadas ────────────────────────── */

 /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]*         { printf("constante octal: %s\n", yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]         { }

 /* ── Reglas completadas ─────────────────────────────── */

([1-9][0-9]*)   { printf("constante decimal: %s\n", yytext); }

0[xX][0-9a-fA-F]+ { printf("constante hexadecimal: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("identificador: %s\n", yytext); }

.               { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
