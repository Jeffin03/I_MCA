// Write a C Program to find Minimum Cost Spanning Tree of an undirected
// graph using Prim's Algorithm.
#include <stdio.h>
#define INF 9999
#define MAX 10
int main() {
 int cost[MAX][MAX];
 int visited[MAX] = {0};
 int n, i, j, ne = 1;
 int min, a, b, u, v;
 int total_cost = 0;
 printf("Enter the number of vertices: ");
 scanf("%d", &n);
 printf("Enter the cost adjacency matrix:\n");
 for (i = 0; i < n; i++) {
 for (j = 0; j < n; j++) {
 scanf("%d", &cost[i][j]);
 if (cost[i][j] == 0)
 cost[i][j] = INF; // No direct edge
 }
 }
 visited[0] = 1; // Start from the first vertex
 printf("\nEdges in the Minimum Cost Spanning Tree:\n");
 while (ne < n) {
 min = INF;
 // Find the minimum cost edge among visited and unvisited vertices
 for (i = 0; i < n; i++) {
 if (visited[i]) {
 for (j = 0; j < n; j++) {
 if (!visited[j] && cost[i][j] < min) {
 min = cost[i][j];
 a = u = i;
 b = v = j;
 }
 }
 }
 }
 // Include this edge in the MST
 if (!visited[v]) {
 printf("Edge %d: (%d -> %d) cost: %d\n", ne++, a + 1, b + 1, min);
 total_cost += min;
 visited[v] = 1;
 }
 cost[a][b] = cost[b][a] = INF; // Mark edge as used
 }
 printf("\nMinimum cost of the spanning tree = %d\n", total_cost);
//  getch(); // uncomment this for Turbo C
 return 0;
}
// Input:
// Enter the number of vertices: 5
// Enter the cost adjacency matrix:
// 0 2 0 6 0
// 2 0 3 8 5
// 0 3 0 0 7
// 6 8 0 0 9
// 0 5 7 9 0
// Output:
// Edges in the Minimum Cost Spanning Tree:
// Edge 1: (1 -> 2) cost: 2
// Edge 2: (2 -> 3) cost: 3
// Edge 3: (2 -> 5) cost: 5
// Edge 4: (1 -> 4) cost: 6
// Minimum cost of the spanning tree = 16