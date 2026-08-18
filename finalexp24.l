%{
#include <stdio.h>

int comments = 0;
FILE *out;
%}

%x COMMENT

%%

"//".* {
          comments++;
        }

"/*" {
       comments++;
       BEGIN(COMMENT);
     }

<COMMENT>"*/" {
                 BEGIN(INITIAL);
               }

<COMMENT>\n {
              fputc('\n', out);
            }

<COMMENT>. {
             ;
           }

\n {
     fputc('\n', out);
   }

. {
    fputc(yytext[0], out);
  }

%%

int main()
{
    out = fopen("finaloutput24.c", "w");

    if (out == NULL)
    {
        printf("Cannot create output file\n");
        return 1;
    }

    yylex();

    fclose(out);

    printf("Number of comments = %d\n", comments);
    printf("Comments removed successfully.\n");
    printf("Output written to finaloutput24.c\n");

    return 0;
}

int yywrap()
{
    return 1;
}