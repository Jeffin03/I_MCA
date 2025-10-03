// Base class
class Grandparent 
{
	// Private member: accessible only within the class
	private String familySecret = "Hidden treaure locations";

	// Protected member: accessinle in subclass and same package
	protected String familyName = "Smith";

	// Public member
	public int familyGeneration = 1;

	// Private Method
	private void showSecret()
	{
		System.out.println("Grandparent's Secret: " + familySecret);
	}

	// Protected Method
	protected void displayFamilyName()
	{
		System.out.println("Family Name: " + familyName);
	}

	//Public Method
	public void showGeneration()
	{
		System.out.println("Family Generation: " + familyGeneration);
	}


	// Public method to access private data
	public void revealSecret()
	{
		showSecret(); 
	}

}

// Intermediate class (Parent)
class Parent extends Grandparent
{
	// Protected Member
	protected String parentRole = "Guiding the next generation";

	// Public method
	public void showParentRole()
	{
		System.out.println("Parent Role: "+ parentRole);

		// Accessing protected member of grandparent
		System.out.println("Family Name from Grandparent: "+ familyName);

		showGeneration();

		// Cannot access private or method of Grandparent directly
		// System.out.println(familySecret); // X Error
		// showSecret(); // X error

		// Didn't write the comment 		
		revealSecret();

	}

}

//Sub Class(Child)
class Child extends Parent
{
	// public member
	public String childName = "John";

	public void showChildDetails()
	{
		System.out.println("Child Name: " + childName);

		//accessing protected member of Parent
		System.out.println("Parent Role: " + parentRole);

		// accessing protected member of Grandparent
		System.out.println("Family Name: " + familyName);

		// accessing public method of Grandparent
		showGeneration();

		//accessing private member of Grandparent is not allowed directly
		revealSecret(); 
		
	}

}

public class MultiLevelInheritanceDemo
{
	public static void main(String[] args)
	{
		Child child = new Child();

		System.out.println("----Child Details----");
		child.showChildDetails();

		System.out.println("\n ---Parent Details ---");
		Parent parent = new Parent();
		parent.showParentRole();

		System.out.println("\naccessing public member directly");
		System.out.println("Child Generation: " + child.familyGeneration);

	}

}