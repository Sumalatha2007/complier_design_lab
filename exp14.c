#include <stdio.h>
#include <string.h>
#include <ctype.h>

char expr[100];
char stack[100];
int top = -1;

int tempCount = 1;

void push(char c)
{
    stack[++top] = c;
}

char pop()
{
    return stack[top--];
}

int precedence(char c)
{
    if (c == '+' || c == '-')
        return 1;

    if (c == '*' || c == '/')
        return 2;

    return 0;
}

int main()
{
    int i;
    char postfix[100];
    int p = 0;

    printf("Enter expression: ");
    scanf("%s", expr);

    /* Convert infix to postfix */
    for (i = 0; expr[i] != '\0'; i++)
    {
        char c = expr[i];

        if (isalnum(c))
        {
            postfix[p++] = c;
        }
        else if (c == '(')
        {
            push(c);
        }
        else if (c == ')')
        {
            while (top != -1 && stack[top] != '(')
                postfix[p++] = pop();

            if (top != -1)
                pop();
        }
        else
        {
            while (top != -1 &&
                   precedence(stack[top]) >= precedence(c))
            {
                postfix[p++] = pop();
            }

            push(c);
        }
    }

    while (top != -1)
        postfix[p++] = pop();

    postfix[p] = '\0';

    printf("\nThree Address Code:\n");

    char operandStack[100][20];
    int opTop = -1;

    for (i = 0; postfix[i] != '\0'; i++)
    {
        char c = postfix[i];

        if (isalnum(c))
        {
            operandStack[++opTop][0] = c;
            operandStack[opTop][1] = '\0';
        }
        else
        {
            char op1[20], op2[20], temp[20];

            strcpy(op2, operandStack[opTop--]);
            strcpy(op1, operandStack[opTop--]);

            sprintf(temp, "t%d", tempCount++);

            printf("%s = %s %c %s\n",
                   temp, op1, c, op2);

            strcpy(operandStack[++opTop], temp);
        }
    }

    return 0;
}