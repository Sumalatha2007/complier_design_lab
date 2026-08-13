%{
#include <stdio.h>
%}

%%
"//".* ;

"/*"([^*]|\*+[^*/])*\*+"/" ;

[ \t\n]+ ;

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Token: %s\n", yytext);
}

[0-9]+ {
    printf("Token: %s\n", yytext);
}

"+"|"-"|"*"|"/"|"=" {
    printf("Token: %s\n", yytext);
}

. ;
%%

int main()
{
    printf("Tokens after ignoring spaces and comments:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}