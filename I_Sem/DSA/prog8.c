// Write a C Program to compute the transitive closure of a given directed
// group using Warshall's Algorithm.
#include <stdio.h>
#define MAX 10
void warshall(int n, int graph[MAX][MAX])
{
 int i, j, k;
 // Apply Warshall’s Algorithm
 for (k = 0; k < n; k++) {
 for (i = 0; i < n; i++) {
 for (j = 0; j < n; j++) {
 graph[i][j] = graph[i][j] || (graph[i][k] && graph[k][j]);
 }
 }
 }
}
int main() {
 int n, i, j;
 int graph[MAX][MAX];
 printf("Enter the number of vertices: ");
 scanf("%d", &n);
 printf("Enter the adjacency matrix of the directed graph:\n");
 for (i = 0; i < n; i++) {
 for (j = 0; j < n; j++) {
 scanf("%d", &graph[i][j]);
 }
 }
 warshall(n, graph);
 printf("\nTransitive Closure of the given graph:\n");
 for (i = 0; i < n; i++) {
 for (j = 0; j < n; j++) {
 printf("%d ", graph[i][j]);
 }
 printf("\n");
 }
 getch(); //uncomment if you're executing on Turbo C
 return 0;
}
// Input:
// Enter the number of vertices: 4
// Enter the adjacency matrix:
// 0 1 0 0
// 0 0 1 0
// 0 0 0 1
// 0 0 0 0
// Output:
// Transitive Closure of the given graph:
// 0 1 1 1
// 0 0 1 1
// 0 0 0 1
// 0 0 0 0