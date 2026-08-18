%{
#include <stdio.h>

int characters = 0;
int words = 0;
int lines = 0;
%}

%x COMMENT

%%

"/*"                    { BEGIN(COMMENT); }

<COMMENT>"*/"           { BEGIN(INITIAL); }

<COMMENT>\n             { lines++; }

<COMMENT>.              { }

"//".*                  { }

\n                      { lines++; }

[ \t]+                  { }

[a-zA-Z_][a-zA-Z0-9_]*  {
                            characters += yyleng;
                            words++;
                        }

[0-9]+                  {
                            characters += yyleng;
                            words++;
                        }

.                       {
                            characters++;
                        }

%%

int main()
{
    yylex();

    printf("\nNumber of characters = %d", characters);
    printf("\nNumber of lines = %d", lines);
    printf("\nNumber of words = %d\n", words);

    return 0;
}

int yywrap()
{
    return 1;
}