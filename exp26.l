%{
#include <stdio.h>
#include <string.h>

int check_email(char *s)
{
    int i;
    int at = 0;
    int dot = 0;

    for(i = 0; s[i] != '\0'; i++)
    {
        if(s[i] == '@')
            at++;

        if(s[i] == '.')
            dot++;
    }

    if(at == 1 && dot >= 1)
        return 1;

    return 0;
}
%}

%%

.+ {
    if(check_email(yytext))
        printf("Valid Email Address\n");
    else
        printf("Invalid Email Address\n");
}

\n {
}

%%

int main()
{
    printf("Enter Email Address: ");
    fflush(stdout);

    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}