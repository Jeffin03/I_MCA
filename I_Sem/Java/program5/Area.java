/* Write a Java program to create an interface named Shape2d that contains
the declaration of a method double getArea(); define a subclass named Square 
implements the interface Shape2d with data member side and methods 
Constructor() and getArea(). Create an object for the class square and 
find the area.
*/

interface Shape2d
{
	double getArea();
}

class Square implements Shape2d
{
	int side;
	
	Square(int side)
	{
		this.side = side;
	}
	
	@Override
	public double getArea()
	{
		return this.side * this.side;	
	}

}

public class Area
{
	public static void main(String[] args)
	{
		Shape2d square = new Square(5);
	
		System.out.println("The Area is " + square.getArea());
		
	}
}