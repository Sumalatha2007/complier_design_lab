%{
#include <stdio.h>
#include <string.h>

int valid_dob(char *s)
{
    int i;

    if(strlen(s) != 10)
        return 0;

    if(s[2] != '/' || s[5] != '/')
        return 0;

    for(i = 0; i < 10; i++)
    {
        if(i == 2 || i == 5)
            continue;

        if(s[i] < '0' || s[i] > '9')
            return 0;
    }

    return 1;
}
%}

%%

[^\n]+ {
    if(valid_dob(yytext))
        printf("Valid DOB\n");
    else
        printf("Invalid DOB\n");
}

\n {
}

%%

int main()
{
    printf("Enter DOB (DD/MM/YYYY): ");
    fflush(stdout);
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}