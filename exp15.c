#include <stdio.h>
#include <ctype.h>

int main()
{
    FILE *fp;

    char filename[100];
    char ch;

    int characters = 0;
    int words = 0;
    int lines = 0;

    int inWord = 0;

    printf("Enter file name: ");
    scanf("%s", filename);

    fp = fopen(filename, "r");

    if (fp == NULL)
    {
        printf("Unable to open file.\n");
        return 1;
    }

    while ((ch = fgetc(fp)) != EOF)
    {
        characters++;

        if (ch == '\n')
            lines++;

        if (isspace(ch))
        {
            inWord = 0;
        }
        else if (inWord == 0)
        {
            words++;
            inWord = 1;
        }
    }

    fclose(fp);

    printf("\nNumber of Characters = %d\n", characters);
    printf("Number of Words      = %d\n", words);
    printf("Number of Lines      = %d\n", lines);

    return 0;
}