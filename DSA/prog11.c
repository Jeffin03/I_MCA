// PROGRAM: 11
// Write a C Program to find shortest paths to other vertices using Dijkstra's
// algorithm from a given vertex in a weighted connected graph.
#include <stdio.h>
#include <limits.h>
#define V 10 // Maximum number of vertices
int minDistance(int dist[], int sptSet[], int n) {
 int min = INT_MAX, min_index;
 for (int v = 0; v < n; v++)
 if (sptSet[v] == 0 && dist[v] <= min)
 min = dist[v], min_index = v;
 return min_index;
}
void printSolution(int dist[], int n, int src) {
 printf("\nVertex \t\t Distance from Source %d\n", src);
 for (int i = 0; i < n; i++)
 printf("%d \t\t %d\n", i, dist[i]);
}
void dijkstra(int graph[V][V], int src, int n) {
 int dist[V]; // Output array: dist[i] holds shortest distance from src to i
 int sptSet[V]; // sptSet[i] is 1 if vertex i is included in shortest path tree
 // Initialize all distances as INFINITE and sptSet[] as false
 for (int i = 0; i < n; i++) {
 dist[i] = INT_MAX;
 sptSet[i] = 0;
 }
 // Distance of source vertex from itself is always 0
 dist[src] = 0;
 // Find shortest path for all vertices
 for (int count = 0; count < n - 1; count++) {
 int u = minDistance(dist, sptSet, n);
 sptSet[u] = 1;
 // Update dist[v] only if not in sptSet, there is an edge from u to v,
 // and total weight of path from src to v through u is smaller
 for (int v = 0; v < n; v++)
 if (!sptSet[v] && graph[u][v] && dist[u] != INT_MAX
 && dist[u] + graph[u][v] < dist[v])
 dist[v] = dist[u] + graph[u][v];
 }
 // Print the constructed distance array
 printSolution(dist, n, src);
}
int main() {
 int n, graph[V][V];
 int src;
 printf("Enter number of vertices: ");
 scanf("%d", &n);
 printf("Enter the adjacency matrix (0 if no edge):\n");
 for (int i = 0; i < n; i++)
 for (int j = 0; j < n; j++)
 scanf("%d", &graph[i][j]);
 printf("Enter the source vertex: ");
 scanf("%d", &src);
 dijkstra(graph, src, n);
 return 0;
}
// Input:
// Enter number of vertices: 5
// Enter the adjacency matrix (0 if no edge):
// 0 10 0 5 0
// 0 0 1 2 0
// 0 0 0 0 4
// 0 3 9 0 2
// 7 0 6 0 0
// Enter the source vertex: 0
// Output:
// Vertex Distance from Source 0
// 0 0
// 1 8
// 2 9
// 3 5
// 4 7