#include <stdio.h>
#include <string.h>

#define MAX 10

char productions[MAX][MAX];
int n;

int isAmbiguous()
{
    int i;

    for(i = 0; i < n; i++)
    {
        if(strstr(productions[i], "E+E") ||
           strstr(productions[i], "E*E"))
        {
            return 1;
        }
    }

    return 0;
}

void removeAmbiguity()
{
    printf("\nEquivalent Non-Ambiguous Grammar:\n");

    printf("E -> E + T | T\n");
    printf("T -> T * F | F\n");
    printf("F -> id\n");
}

int main()
{
    int i;

    printf("Enter number of productions: ");
    scanf("%d", &n);

    printf("Enter productions:\n");
    for(i = 0; i < n; i++)
    {
        scanf("%s", productions[i]);
    }

    if(isAmbiguous())
    {
        printf("\nGrammar is Ambiguous.\n");
        removeAmbiguity();
    }
    else
    {
        printf("\nGrammar is NOT Ambiguous (heuristic check).\n");
    }

    return 0;
}
