%{
#include <stdio.h>
%}

%%

[0-9]+ {
    printf("Number: %s\n", yytext);
}

"+" {
    printf("Addition Operator\n");
}

"-" {
    printf("Subtraction Operator\n");
}

"*" {
    printf("Multiplication Operator\n");
}

"/" {
    printf("Division Operator\n");
}

"=" {
    printf("Assignment Operator\n");
}

[ \t\n]+ {
}

. {
    printf("Unknown Symbol: %s\n", yytext);
}

%%

int main()
{
    printf("Enter mathematical expression:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}