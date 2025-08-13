// Write a program to reverse a three digit number.
import java.util.Scanner;

public class program5
{
	public static void main(String []args)
	{
		System.out.println("Program to reverse a three digit number");
		int a , first_digit,middle_digit,last_digit;
		Scanner sc = new Scanner(System.in);

    System.out.println("Enter the value");
    a = sc.nextInt();

		last_digit = a % 10; // extract the last number
		middle_digit = (a / 10) % 10; 
		first_digit = a / 100;

		int reversed = (last_digit * 100) + (middle_digit * 10) + first_digit;
		System.out.println(reversed);
			
		
	}
}
