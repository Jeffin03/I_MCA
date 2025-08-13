// Write a program to find sum of two numbers.
// Write a program to find the highest among two numbers.
// Write a program to find the highest among three numbers.
// Write a program to swap values without using temporary variable.
// Write a program to reverse a three digit number.
import java.util.Scanner;

public class Program1
{
    public static void main(String []args)
    {
        int a ,b,c;
        

        System.out.println("Enter a value for a");
        Scanner sc = new Scanner(System.in);
	a=sc.nextInt();
	System.out.println("Enter a value for b");
	b = sc.nextInt();

	c = a + b;
	System.out.println("Sum of A and B is "+c);


    }
}