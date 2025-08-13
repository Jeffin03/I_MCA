#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

void linear();
void binary();

int main() 
{
    int choice;
    do {
        printf("In 1.Search the element using linear search");
        printf("\nIn 2.Search the element using Binary search");
        printf("\nIn 3.Exit");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);
        
        switch(choice) {
            case 1:
                linear();
                break;
            case 2:
                binary();
                break;
            case 3:
                exit(0);
                break;
        }
    }
    while((choice >= 1) && (choice <= 2));
return 0;
}

void linear()
{
    int n, c , array[100],search;
    printf("\nEnter the number of elements in an array: ");
    scanf("%d", &n);
    printf("\nEnter the array elements:");
    for(c = 0; c < n;c++) {
        if(array[c] == search) {
            printf("\nElement found at position %d", c + 1);
            break;
        }
}
if (c == n)
{
    printf("\n%d is not present in the array", search);
}
}

void binary()
{
    int array[100], i,j,n,mid,temp,flag = 0, low = 0, high,item,c;
    printf("\nEnter the number of elements in an array: ");
    scanf("%d", &n);
    printf("\nEnter the array elements in ascending order:");
    for(c = 0; c < n; c++) {
        scanf("%d", &array[c]);
    }
    printf("\nEnter the element to be searched: ");
    scanf("%d", &item);
    
    high = n - 1;
    while(low <= high) {
        mid = (low + high) / 2; 
        if(array[mid] == item) {
            printf("\nElement found at position %d", mid + 1);
            flag = 1;
            break;
        }
        else if(array[mid] < item) {
            low = mid + 1;
        }
        else {
            high = mid - 1;
        }   
    }
    if(flag == 0) {
        printf("\n%d is not found.", item);
    }
}