%{
#include <stdio.h>
#include <string.h>
%}

%%

^[a-zA-Z_][a-zA-Z0-9_]*$ {
    printf("Valid Identifier\n");
}

.* {
    printf("Invalid Identifier\n");
}

%%

int main()
{
    char input[100];

    printf("Enter an identifier: ");
    scanf("%99s", input);

    if ((input[0] >= 'a' && input[0] <= 'z') ||
        (input[0] >= 'A' && input[0] <= 'Z') ||
        input[0] == '_')
    {
        int valid = 1;

        for (int i = 1; input[i] != '\0'; i++)
        {
            if (!((input[i] >= 'a' && input[i] <= 'z') ||
                  (input[i] >= 'A' && input[i] <= 'Z') ||
                  (input[i] >= '0' && input[i] <= '9') ||
                  input[i] == '_'))
            {
                valid = 0;
                break;
            }
        }

        if (valid)
            printf("Valid Identifier\n");
        else
            printf("Invalid Identifier\n");
    }
    else
    {
        printf("Invalid Identifier\n");
    }

    return 0;
}

int yywrap()
{
    return 1;
}