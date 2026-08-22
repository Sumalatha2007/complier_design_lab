%{
#include <stdio.h>
%}

%%

"http://www.google.com" {
    printf("Valid URL\n");
}

"https://www.google.com" {
    printf("Valid URL\n");
}

"www.google.com" {
    printf("Valid URL\n");
}

.* {
    printf("Invalid URL\n");
}

\n {
}

%%

int main()
{
    printf("Enter URL: ");
    fflush(stdout);
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}