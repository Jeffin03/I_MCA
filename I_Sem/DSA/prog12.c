// PROGRAM: 12
// Write a C Program to implement NQueen's problem using
// Backtracking and prove its efficiency.
// The N-Queens problem is to place N queens on an N×N chessboard such that no two
// queens attack each other — i.e., no two queens share the same row, column, or
// diagonal.We solve it using backtracking, which tries to build the solution step-by-step
// and backtracks as soon as it determines that the current path cannot lead to a solution.
#include <stdio.h>
#define N 4
// You can change N to any value (e.g., 4, 8, etc.)

// Function to print the board
void printSolution(int board[N][N]) {
    int i, j;
    for (i = 0; i < N; i++) {
	for (j = 0; j < N; j++) {
	    printf("%d ", board[i][j]);
	}
	printf("\n");
    }
    printf("\n");
}

// Function to check if a queen can be placed on board[row][col]
int isSafe(int board[N][N], int row, int col) {
    int i, j;
    // Check this column on upper side
    for (i = 0; i < row; i++) {
	if (board[i][col]) {
	    return 0; // false
	}
    }
    // Check upper left diagonal
    for (i = row, j = col; i >= 0 && j >= 0; i--, j--) {
	if (board[i][j]) {
	    return 0; // false
	}
    }
    // Check upper right diagonal
    for (i = row, j = col; i >= 0 && j < N; i--, j++) {
	if (board[i][j]) {
	    return 0; // false
	}
    }
    return 1; // true
}

// Recursive function to solve N-Queen problem
int solveNQUtil(int board[N][N], int row) {
    int col;
    // If all queens are placed
    if (row >= N) {
	return 1; // solution found
    }
    // Try placing queen in all columns one by one
    for (col = 0; col < N; col++) {
	if (isSafe(board, row, col)) {
	    board[row][col] = 1; // Place queen
	    // Recur to place rest of the queens
	    if (solveNQUtil(board, row + 1)) {
		return 1; // solution found
	    }
	    // If placing queen here doesn't lead to solution, backtrack
	    board[row][col] = 0;
	}
    }
    // If the queen cannot be placed in any column
    return 0; // no solution
}

// Function to solve the N Queen problem
void solveNQ() {
    int board[N][N] = {0};
    if (solveNQUtil(board, 0) == 0) {
	printf("Solution does not exist\n");
	return;
    }
    printSolution(board);
}

int main() {
    printf("N-Queens Problem Solution (for N = %d):\n\n", N);
    solveNQ();
    // getch(); // Uncomment this for Turbo C
    return 0;
}

// Output
// N-Queens Problem Solution (for N = 4):
// 0 1 0 0
// 0 0 0 1
// 1 0 0 0
// 0 0 1 0
// Each “1” represents a queen placed safely on the board.