//  Program to perform operations on a circular queue (enqueue, dequeue and peek)
#include <stdio.h>
#include <stdlib.h>
#define SIZE 5
int queue[SIZE];
int front = -1, rear = -1;
// Check if the queue is full
int isFull() {
 return (front == (rear + 1) % SIZE);
}
// Check if the queue is empty
int isEmpty() {
 return (front == -1);
}
// Enqueue operation
void enqueue(int value) {
 if (isFull()) {
 printf("Queue is full. Cannot enqueue %d\n", value);
 return;
 }
 if (isEmpty()) {
 front = rear = 0;
 } else {
 rear = (rear + 1) % SIZE;
 }
 queue[rear] = value;
 printf("Enqueued: %d\n", value);
}
// Dequeue operation
int dequeue() {
 int value = queue[front];
 if (isEmpty()) {
 printf("Queue is empty. Cannot dequeue.\n");
 return -1;
 }

 if (front == rear) {
 // Queue has only one element
 front = rear = -1;
 } else {
 front = (front + 1) % SIZE;
 }
 return value;
}
// Peek operation
int peek() {
 if (isEmpty()) {
 printf("Queue is empty.\n");
 return -1;
 }
 return queue[front];
}
// Display queue
void display() {
 int i = front;
 if (isEmpty()) {
 printf("Queue is empty.\n");
 return;
 }
 printf("Queue elements: ");

 while (1) {
 printf("%d ", queue[i]);
 if (i == rear)
 break;
 i = (i + 1) % SIZE;
 }
 printf("\n");
}
// Main function
int main() {
 int choice, value;
 while (1) {
 printf("\n--- Circular Queue Operations ---\n");
 printf("1. Enqueue\n2. Dequeue\n3. Peek\n4. Display\n5. Exit\n");
 printf("Enter your choice: ");
 scanf("%d", &choice);
 switch (choice) {
 case 1:
 printf("Enter value to enqueue: ");
 scanf("%d", &value);
 enqueue(value);
 break;
 case 2:
 value = dequeue();
 if (value != -1)
 printf("Dequeued: %d\n", value);
 break;
 case 3:
 value = peek();
 if (value != -1)
 printf("Front element: %d\n", value);
 break;
 case 4:
 display();
 break;
 case 5:
 exit(0);
 default:
 printf("Invalid choice. Try again.\n");
 }
 }
 return 0;
}
