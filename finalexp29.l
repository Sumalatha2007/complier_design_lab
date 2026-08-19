%{
#include <stdio.h>
%}

%%

"#include" {
    printf("PREPROCESSOR : %s\n", yytext);
}

"int"|"void"|"char"|"float"|"double"|"return"|"if"|"else"|"for"|"while" {
    printf("KEYWORD      : %s\n", yytext);
}

[0-9]+ {
    printf("CONSTANT     : %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("IDENTIFIER   : %s\n", yytext);
}

\"([^\\\"]|\\.)*\" {
    printf("STRING       : %s\n", yytext);
}

"==" {
    printf("OPERATOR     : %s\n", yytext);
}

"!=" {
    printf("OPERATOR     : %s\n", yytext);
}

"<=" {
    printf("OPERATOR     : %s\n", yytext);
}

">=" {
    printf("OPERATOR     : %s\n", yytext);
}

"=" {
    printf("OPERATOR     : %s\n", yytext);
}

"+" {
    printf("OPERATOR     : %s\n", yytext);
}

"-" {
    printf("OPERATOR     : %s\n", yytext);
}

"*" {
    printf("OPERATOR     : %s\n", yytext);
}

"/" {
    printf("OPERATOR     : %s\n", yytext);
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

[ \t]+ {
}

\n {
}

. {
    printf("UNKNOWN      : %s\n", yytext);
}

%%

int main()
{
    printf("Enter the C program:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}