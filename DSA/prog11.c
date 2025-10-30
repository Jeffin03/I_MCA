// PROGRAM: 11
// Write a C Program to find shortest paths to other vertices using Dijkstra's
// algorithm from a given vertex in a weighted connected graph.
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main() {
    int n, i, j, count, u, v, min, exitDigit, src;
    int **graph, *dist, *visited;

    printf("Enter number of vertices: ");
    scanf("%d",&n);

    // Dynamic allocation
    graph = (int**)malloc(n*sizeof(int*));
    dist = (int*)malloc(n*sizeof(int));
    visited = (int*)malloc(n*sizeof(int));
    for(i=0;i<n;i++){
        graph[i]=(int*)malloc(n*sizeof(int));
        dist[i]=INT_MAX;
        visited[i]=0;
    }

    printf("Enter adjacency matrix (0 if no edge):\n");
    for(i=0;i<n;i++)
        for(j=0;j<n;j++){
            scanf("%d",&graph[i][j]);
            if(graph[i][j]==0) graph[i][j]=INT_MAX;
        }

    printf("Enter source vertex (0 to n-1): ");
    scanf("%d",&src);
    dist[src]=0;

    for(count=0;count<n-1;count++){
        // Find min dist vertex
        min=INT_MAX;
        for(i=0;i<n;i++)
            if(!visited[i] && dist[i]<=min){
                min=dist[i];
                u=i;
            }
        visited[u]=1;

        for(v=0;v<n;v++)
            if(!visited[v] && graph[u][v]!=INT_MAX && dist[u]!=INT_MAX && dist[u]+graph[u][v]<dist[v])
                dist[v]=dist[u]+graph[u][v];
    }

    printf("Vertex\tDistance from source %d\n", src);
    for(i=0;i<n;i++)
        printf("%d\t%d\n", i, dist[i]);

    printf("Press any digit to exit: ");
    scanf("%d",&exitDigit);

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