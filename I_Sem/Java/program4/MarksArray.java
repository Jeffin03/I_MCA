/* Write a Java program to read 20 marks and store them in an array. 
Define your own expection name Wrong Mark Exception Throw 
and catch this type of exception when a mark is <0 and mark is > 100.  */

import java.util.Scanner;

// Custom Exception Class
class WrongMarkException extends Exception 
{
	public WrongMarkException(String message)
	{
		super(message);
	}
}

public class MarksArray
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		int[] marks = new int[20];

		System.out.println("Enter 20 marks(each between 0 and 100):");
		
		for(int i = 0; i < 10; i++)
		{
			try
			{
				System.out.println("Enter mark" + (i+1) + ": ");
				int mark = sc.nextInt();

				// Validate mark
				if(mark < 0 || mark > 100)
				{
					throw new WrongMarkException("Invalid mark:"+mark+".Marks must be between 0 and 100.");
	
				}

				marks[i] = mark; //store valid mark
			} catch (WrongMarkException e)
			{
				System.out.println("Error:"+e.getMessage());
				i--; //retry same index
			} catch (Exception e)
			{
				System.out.println("Invalid input!Please enter an integer.");
				sc.next(); //clear invalid input
				i--; //retry same index
			}
		}

		// Print stored marks
		System.out.println("\n Marks entered:");
		for(int i = 0; i < 10; i++)
		{
			System.out.println(marks[i] + " ");
		}

		sc.close();
	}
}
