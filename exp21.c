#include <stdio.h>
#include <ctype.h>

int main()
{
    char sentence[200];
    int vowels = 0;
    int i;

    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    for (i = 0; sentence[i] != '\0'; i++)
    {
        char ch = tolower(sentence[i]);

        if (ch == 'a' || ch == 'e' || ch == 'i' ||
            ch == 'o' || ch == 'u')
        {
            vowels++;
        }
    }

    printf("Number of vowels = %d\n", vowels);

    return 0;
}