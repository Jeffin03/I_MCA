#include <stdio.h>
#include <stdlib.h>

// Function declarations
void quick_sort(int[], int, int);
int partition(int[], int, int);
void mergesort(int[], int, int);
void merge(int[], int, int, int, int);

// Quick Sort implementation
void quick_sort(int a[], int l, int u) {
    int j;
    if (l < u) {
        j = partition(a, l, u);
        quick_sort(a, l, j - 1);
        quick_sort(a, j + 1, u);
    }
}

int partition(int a[], int l, int u) {
    int v, i, j, temp;
    v = a[l];
    i = l;
    j = u + 1;
    do {
        do { i++; } while (a[i] < v && i <= u);
        do { j--; } while (v < a[j]);
        if (i < j) {
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
    } while (i < j);

    a[l] = a[j];
    a[j] = v;
    return j;
}

// Merge Sort implementation
void mergesort(int a[], int i, int j) {
    int mid;
    if (i < j) {
        mid = (i + j) / 2;
        mergesort(a, i, mid);
        mergesort(a, mid + 1, j);
        merge(a, i, mid, mid + 1, j);
    }
}

void merge(int a[], int i1, int j1, int i2, int j2) {
    int temp[100];
    int i = i1, j = i2, k = 0;

    while (i <= j1 && j <= j2) {
        if (a[i] < a[j])
            temp[k++] = a[i++];
        else
            temp[k++] = a[j++];
    }
    while (i <= j1)
        temp[k++] = a[i++];
    while (j <= j2)
        temp[k++] = a[j++];

    for (i = i1, j = 0; i <= j2; i++, j++)
        a[i] = temp[j];
}

// Main function
int main() {
    int a[100], n, i, op;
    // clrscr(); 

    while (1) {
        printf("\nMenu:\n1. Quick Sort\n2. Merge Sort\n3. Exit\nEnter your choice: ");
        scanf("%d", &op);

        if (op == 3)
            break;

        printf("Enter the number of elements: ");
        scanf("%d", &n);

        printf("Enter the elements:\n");
        for (i = 0; i < n; i++)
            scanf("%d", &a[i]);

        switch (op) {
            case 1:
                printf("Quick Sort\n");
                quick_sort(a, 0, n - 1);
                break;
            case 2:
                printf("Merge Sort\n");
                mergesort(a, 0, n - 1);
                break;
            default:
                printf("Invalid choice\n");
                continue;
        }

        printf("Sorted array in ascending order:\n");
        for (i = 0; i < n; i++)
            printf("%d ", a[i]);

        printf("\nSorted array in descending order:\n");
        for (i = n - 1; i >= 0; i--)
            printf("%d ", a[i]);

        printf("\n");
    }

    return 0;
}
