#include <stdio.h>
#include <string.h>

char input[100];
int pos = 0;

int E();
int Eprime();
int T();
int Tprime();
int F();

int E()
{
    if (!T())
        return 0;

    if (!Eprime())
        return 0;

    return 1;
}

int Eprime()
{
    if (input[pos] == '+')
    {
        pos++;

        if (!T())
            return 0;

        if (!Eprime())
            return 0;
    }

    return 1;
}

int T()
{
    if (!F())
        return 0;

    if (!Tprime())
        return 0;

    return 1;
}

int Tprime()
{
    if (input[pos] == '*')
    {
        pos++;

        if (!F())
            return 0;

        if (!Tprime())
            return 0;
    }

    return 1;
}

int F()
{
    if (input[pos] == 'i' && input[pos + 1] == 'd')
    {
        pos += 2;
        return 1;
    }

    if (input[pos] == '(')
    {
        pos++;

        if (!E())
            return 0;

        if (input[pos] == ')')
        {
            pos++;
            return 1;
        }

        return 0;
    }

    return 0;
}

int main()
{
    printf("Enter input string: ");
    scanf("%s", input);

    if (E() && input[pos] == '\0')
        printf("String is accepted.\n");
    else
        printf("String is rejected.\n");

    return 0;
}