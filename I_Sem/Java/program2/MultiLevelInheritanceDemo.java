class Grandparent {
    private String familySecret = "Hidden treasure locations";
    protected String familyName = "Smith";
    public int familyGeneration = 1;

    private void showSecret() {
        System.out.println("Grandparent's Secret: " + familySecret);
    }

    protected void displayFamilyName() {
        System.out.println("Family Name: " + familyName);
    }

    public void showGeneration() {
        System.out.println("Family Generation: " + familyGeneration);
    }

    public void revealSecret() {
        showSecret(); 
    }
}

class Parent extends Grandparent {
    protected String parentRole = "Guiding the next generation";

    public void showParentRole() {
        System.out.println("Parent Role: "+ parentRole);
        System.out.println("Family Name from Grandparent: "+ familyName);
        showGeneration();
        revealSecret();
    }
}

class Child extends Parent {
    public String childName = "John";

    public void showChildDetails() {
        System.out.println("Child Name: " + childName);
        System.out.println("Parent Role: " + parentRole);
        System.out.println("Family Name: " + familyName);
        showGeneration();
        revealSecret(); 
    }
}

public class MultiLevelInheritanceDemo {
    public static void main(String[] args) {
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