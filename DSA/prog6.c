// Write a menu driven program to perform operations on a stack (linked list
// implementation) (push,pop).
#include <stdio.h>
#include <stdlib.h>
// Define a node
struct Node {
 int data;
 struct Node *next;
};

struct Node *top = NULL; // Top of the stack


// Function to push an element into the stack
void push(int value) {
 struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));
 if (newNode == NULL) {
 printf("Stack Overflow! Memory not available.\n");
 return;
 }
 newNode->data = value;
 newNode->next = top;
 top = newNode;
 printf("Pushed %d into the stack.\n", value);
}
// Function to pop an element from the stack
void pop() {
 struct Node *temp = top;
 if (top == NULL) {
 printf("Stack Underflow! No elements to pop.\n");
 return;
 }

 printf("Popped element: %d\n", top->data);
 top = top->next;
 free(temp);
}
// Function to display the stack
void display() {
  struct Node *temp = top;
 if (top == NULL) {
 printf("Stack is empty.\n");
 return;
 }

 printf("Stack elements: ");
 while (temp != NULL) {
 printf("%d ", temp->data);
 temp = temp->next;
 }
 printf("\n");
}
// Main function with menu
int main() {
 int choice, value;
 while (1) {
 printf("\n----- Stack Menu (Linked List Implementation) -----\n");
 printf("1. Push\n");
 printf("2. Pop\n");
 printf("3. Display\n");
 printf("4. Exit\n");
 printf("--------------------------------------------------\n");
 printf("Enter your choice: ");
 scanf("%d", &choice);
 switch (choice) {
 case 1:
 printf("Enter value to push: ");
 scanf("%d", &value);
 push(value);
 break;
 case 2:
 pop();
 break;
 case 3:
 display();
 break;
 case 4:
 printf("Exiting program.\n");
 exit(0);
 default:
 printf("Invalid choice! Try again.\n");
 }
 }
 return 0;
}
