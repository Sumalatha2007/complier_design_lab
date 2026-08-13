%{
#include <stdio.h>
%}

%%
"//".* {
    printf("It is a single-line comment\n");
}

"/*"([^*]|\*+[^*/])*\*+"/" {
    printf("It is a multi-line comment\n");
}

[ \t\n]+ ;

. {
    printf("It is NOT a comment\n");
}
%%

int main()
{
    printf("Enter a comment:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}