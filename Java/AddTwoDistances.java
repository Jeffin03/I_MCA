/*
1.Write a JAVA program to implement passing objects as parameters 
Stream-based approach to adding two distances.

2.Write a java program to implement program executor service for 
producer consumer problem.

3.Write a java program to implememt producer consumer problem using
 thread constructor.
*/

import java.util.Scanner;

class Distance
{
	private int feet;
	private int inches;
	//Constructor
	public Distance(int feet, int inches) 
	{
		this.feet = feet;
		this.inches = inches;
		normalize();
	}
	//Normalize: converts inches >= 12 feet
	public void normalize()
	{
		if(inches >= 12)
		{
			feet+= inches / 12;
			inches = inches % 12;
		}
	}
	// Add two Distance objects by passing them as parameters
	public void add(Distance d1, Distance d2)
	{
		this.feet = d1.feet + d2.feet;
		this.inches = d1.inches + d2.inches;
		normalize();
	}

	// Display method
	public void display()
	{
		System.out.println("Total Distance = "+feet + "feet" + inches +"inches");
	}
}

public class AddTwoDistances
{
	public static void main(String [] args)
	{
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter first distance");
		System.out.print("Feet: ");
		int f1 = sc.nextInt();
		System.out.print("Inches: ");
		int i1 = sc.nextInt();
		System.out.println("Enter second distance:");
		System.out.print("Feet:");
		int f2 = sc.nextInt();
		System.out.print("Inches: ");
		int i2 = sc.nextInt();
		Distance d1 = new Distance(f1,i1);
		Distance d2 = new Distance(f2,i2);
		Distance result = new Distance(0,0);
		result.add(d1,d2);
		result.display();
		sc.close();
	}
}
		
