// Write a program to swap values without using temporary variable.

public class program4
{
	public static void main(String []args)
	{
		int a,b;
		a = 10;
		b = 30;

		System.out.println("A is " + a + "B is " + b);
		a = a + b;
		b = a - b;
		a = a - b;
		System.out.println("A :"+a);
		System.out.println("B :"+b);
	}
}