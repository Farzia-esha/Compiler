#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAX 10

char production[10][10];
char first[10], follow[10];
int n;

void findFirst(char, int, int);
void findFollow(char c);

int main()
{
    int i;
    char c;

    printf("Enter number of productions: ");
    scanf("%d", &n);

    printf("Enter productions (A=...):\n");
    for(i = 0; i < n; i++)
        scanf("%s", production[i]);

    printf("\nEnter non-terminal to find FIRST and FOLLOW: ");
    scanf(" %c", &c);

    printf("\nFIRST(%c) = { ", c);
    findFirst(c, 0, 0);
    printf(" }\n");

    printf("FOLLOW(%c) = { ", c);
    findFollow(c);
    printf(" }\n");

    return 0;
}

void findFirst(char c, int q1, int q2)
{
    int j;

    if(!(isupper(c))) {
        printf("%c ", c);
        return;
    }

    for(j = 0; j < n; j++) {
        if(production[j][0] == c) {
            if(production[j][2] == '#')
                printf("# ");
            else if(!isupper(production[j][2]))
                printf("%c ", production[j][2]);
            else
                findFirst(production[j][2], 0, 0);
        }
    }
}

void findFollow(char c)
{
    int i, j;

    if(production[0][0] == c)
        printf("$ ");

    for(i = 0; i < n; i++) {
        for(j = 2; j < strlen(production[i]); j++) {
            if(production[i][j] == c) {
                if(production[i][j+1] != '\0')
                    findFirst(production[i][j+1], 0, 0);
                if(production[i][j+1] == '\0' && c != production[i][0])
                    findFollow(production[i][0]);
            }
        }
    }
}
