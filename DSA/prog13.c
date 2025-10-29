// PROGRAM: 13
// Write a C Program to find a subset of a given set of n
// positive integers whose sum is equal to a given positive
// integer d. A suitable message is to be displayed if the given
// problem instance doesn't have a solution and prove it s
// efficiency.
#include<stdio.h>

int s[10], d, n, set[10], count = 0, flag = 0;

void display(int);
void subset(int, int);

int main()
{
    int i;
    printf("Enter the number of elements in the set\n");
    scanf("%d", &n);
    
    printf("Enter the set values\n");
    for (i = 0; i < n; ++i)
        scanf("%d", &s[i]);
    
    printf("Enter the sum\n");
    scanf("%d", &d);
    
    printf("The program output is:\n");
    subset(0, 0);
    
    if (flag == 0)
        printf("There is no solution\n");

    getch();
    return 0;
}

void subset(int sum, int i)
{
    if (sum == d)
    {
        flag = 1;
        display(count);
        return;
    }
    if (sum > d || i >= n)
        return;
    else
    {
        set[count] = s[i];
        count++;
        subset(sum + s[i], i + 1);
        count--;
        subset(sum, i + 1);
    }
}

void display(int count)
{
    int i;
    printf("{");
    for (i = 0; i < count; i++)
        printf("%d ", set[i]);
    printf("}\n");
}

/* 
output:

Enter the number of elements in the set
4
Enter the set values
2
3
4
5
Enter the sum
7
The program output is:
{2 5 }
{3 4 }
*/
