// Write a menu driven program to perform insert and delete
// operations in a circular linked list.
#include <stdio.h>
#include <stdlib.h>
// Node structure
struct Node {
 int data;
 struct Node *next;
};
struct Node *last = NULL;
// Function to create a new node
struct Node* createNode(int data) {
 struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));
 newNode->data = data;
 newNode->next = NULL;
 return newNode;
}
// Function to insert at the beginning
void insertAtBeginning(int data) {
 struct Node *newNode = createNode(data);
 if (last == NULL) {
 last = newNode;
 last->next = last;
 } else {
 newNode->next = last->next;
 last->next = newNode;
 }
 printf("Node inserted at beginning.\n");
}
// Function to insert at the end
void insertAtEnd(int data) {
 struct Node *newNode = createNode(data);
 if (last == NULL) {
 last = newNode;
 last->next = last;
 } else {
 newNode->next = last->next;
 last->next = newNode;
 last = newNode;
 }
 printf("Node inserted at end.\n");
}
// Function to delete from the beginning
void deleteFromBeginning() {
 if (last == NULL) {
 printf("List is empty. Cannot delete.\n");
 return;
 }
 struct Node *temp = last->next;
 if (last->next == last) {
 last = NULL;
 } else {
 last->next = temp->next;
 }
 printf("Deleted element: %d\n", temp->data);
 free(temp);
}
// Function to delete from the end
void deleteFromEnd() {
 if (last == NULL) {
 printf("List is empty. Cannot delete.\n");
 return;
 }
 struct Node *temp = last->next;
 if (last->next == last) {
 printf("Deleted element: %d\n", last->data);
 free(last);
 last = NULL;
 } else {
 while (temp->next != last)
 temp = temp->next;
 temp->next = last->next;
 printf("Deleted element: %d\n", last->data);
 free(last);
 last = temp;
 }
}
// Function to display the list
void display() {
 if (last == NULL) {
 printf("List is empty.\n");
 return;
 }
 struct Node *temp = last->next;
 printf("Circular Linked List: ");
 do {
 printf("%d ", temp->data);
 temp = temp->next;
 } while (temp != last->next);
 printf("\n");
}
// Main function
int main() {
 int choice, data;
 while (1) {
 printf("\n----- Circular Linked List Menu -----\n");
 printf("1. Insert at Beginning\n");
 printf("2. Insert at End\n");
 printf("3. Delete from Beginning\n");
 printf("4. Delete from End\n");
 printf("5. Display\n");
 printf("6. Exit\n");
 printf("-------------------------------------\n");
 printf("Enter your choice: ");
 scanf("%d", &choice);
 switch (choice) {
 case 1:
 printf("Enter data to insert: ");
 scanf("%d", &data);
 insertAtBeginning(data);
 break;
 case 2:
 printf("Enter data to insert: ");
 scanf("%d", &data);
 insertAtEnd(data);
 break;
 case 3:
 deleteFromBeginning();
 break;
 case 4:
 deleteFromEnd();
 break;
 case 5:
 display();
 break;
 case 6:
 printf("Exiting program.\n");
 exit(0);
 default:
 printf("Invalid choice! Try again.\n");
 }
 }
 return 0;
}