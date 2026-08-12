#include <stdio.h>
#include <string.h>

#define MAX 100

struct Symbol {
    char name[50];
    char type[20];
    char value[20];
};

struct Symbol table[MAX];
int count = 0;

/* Insert a symbol */
void insert()
{
    char name[50], type[20], value[20];

    printf("Enter symbol name: ");
    scanf("%s", name);

    /* Check duplicate */
    for (int i = 0; i < count; i++)
    {
        if (strcmp(table[i].name, name) == 0)
        {
            printf("Symbol already exists!\n");
            return;
        }
    }

    printf("Enter type: ");
    scanf("%s", type);

    printf("Enter value: ");
    scanf("%s", value);

    strcpy(table[count].name, name);
    strcpy(table[count].type, type);
    strcpy(table[count].value, value);

    count++;

    printf("Symbol inserted successfully.\n");
}

/* Display symbol table */
void display()
{
    if (count == 0)
    {
        printf("Symbol table is empty.\n");
        return;
    }

    printf("\nSymbol Table\n");
    printf("---------------------------------\n");
    printf("Name\tType\tValue\n");
    printf("---------------------------------\n");

    for (int i = 0; i < count; i++)
    {
        printf("%s\t%s\t%s\n",
               table[i].name,
               table[i].type,
               table[i].value);
    }
}

/* Search a symbol */
void search()
{
    char name[50];

    printf("Enter symbol to search: ");
    scanf("%s", name);

    for (int i = 0; i < count; i++)
    {
        if (strcmp(table[i].name, name) == 0)
        {
            printf("Symbol found!\n");
            printf("Name  : %s\n", table[i].name);
            printf("Type  : %s\n", table[i].type);
            printf("Value : %s\n", table[i].value);
            return;
        }
    }

    printf("Symbol not found.\n");
}

/* Delete a symbol */
void deleteSymbol()
{
    char name[50];

    printf("Enter symbol to delete: ");
    scanf("%s", name);

    for (int i = 0; i < count; i++)
    {
        if (strcmp(table[i].name, name) == 0)
        {
            for (int j = i; j < count - 1; j++)
            {
                table[j] = table[j + 1];
            }

            count--;

            printf("Symbol deleted successfully.\n");
            return;
        }
    }

    printf("Symbol not found.\n");
}

int main()
{
    int choice;

    while (1)
    {
        printf("\n--- SYMBOL TABLE ---\n");
        printf("1. Insert\n");
        printf("2. Display\n");
        printf("3. Search\n");
        printf("4. Delete\n");
        printf("5. Exit\n");

        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
            case 1:
                insert();
                break;

            case 2:
                display();
                break;

            case 3:
                search();
                break;

            case 4:
                deleteSymbol();
                break;

            case 5:
                return 0;

            default:
                printf("Invalid choice!\n");
        }
    }
}