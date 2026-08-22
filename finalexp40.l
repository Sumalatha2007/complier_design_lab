%{
#include <stdio.h>
%}

%%

"int" {
    printf("KEYWORD       : %s\n", yytext);
}

"char" {
    printf("KEYWORD       : %s\n", yytext);
}

"float" {
    printf("KEYWORD       : %s\n", yytext);
}

"double" {
    printf("KEYWORD       : %s\n", yytext);
}

"void" {
    printf("KEYWORD       : %s\n", yytext);
}

"return" {
    printf("KEYWORD       : %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("IDENTIFIER    : %s\n", yytext);
}

[0-9]+ {
    printf("CONSTANT      : %s\n", yytext);
}

"+" {
    printf("OPERATOR      : %s\n", yytext);
}

"-" {
    printf("OPERATOR      : %s\n", yytext);
}

"*" {
    printf("OPERATOR      : %s\n", yytext);
}

"/" {
    printf("OPERATOR      : %s\n", yytext);
}

"=" {
    printf("OPERATOR      : %s\n", yytext);
}

"(" {
    printf("SPECIAL SYMBOL: %s\n", yytext);
}

")" {
    printf("SPECIAL SYMBOL: %s\n", yytext);
}

"{" {
    printf("SPECIAL SYMBOL: %s\n", yytext);
}

"}" {
    printf("SPECIAL SYMBOL: %s\n", yytext);
}

";" {
    printf("SPECIAL SYMBOL: %s\n", yytext);
}

"," {
    printf("SPECIAL SYMBOL: %s\n", yytext);
}

\"[^\"]*\" {
    printf("STRING        : %s\n", yytext);
}

[ \t\n]+ {
}

. {
    printf("UNKNOWN       : %s\n", yytext);
}

%%

int main()
{
    printf("Enter C program:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}