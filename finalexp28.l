%{
#include <stdio.h>
%}

%%

[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] {
    printf("Valid Mobile Number\n");
}

[0-9]+ {
    printf("Invalid Mobile Number\n");
}

\n {
}

. {
    printf("Invalid Mobile Number\n");
}

%%

int main()
{
    printf("Enter the mobile number: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}