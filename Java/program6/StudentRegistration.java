/* Program 6 - Write a Java program to create a swing program for Student
Registration containing all the fields Name, Age, Contact, Father's Name,
Annual Income and submit button. Perform field validations.
*/

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class StudentRegistration extends JFrame implements ActionListener
{
	// Form fields
	private JTextField nameField, ageField, contactField, fatherNameField, incomeField;
	private JButton submitButton;

	public StudentRegistration()
	{
		setTitle("Student Registration");
		setSize(400, 350);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);

		// Create form layout
		setLayout(new GridLayout(7, 2, 10, 10));

		// Labels and text fields
		add(new JLabel("Name:"));
		nameField = new JTextField();
		add(nameField);

		add(new JLabel("Age:"));
		ageField = new JTextField();
		add(ageField);

		add(new JLabel("Contact:"));
		contactField = new JTextField();
		add(contactField);

		add(new JLabel("Father's Name:"));
		fatherNameField = new JTextField();
		add(fatherNameField);

		add(new JLabel("Income:"));
		incomeField = new JTextField();
		add(incomeField);

		add(new JLabel(" ")); // Empty cell

		// Submit button
		submitButton = new JButton("Submit");
		submitButton.addActionListener(this);
		add(submitButton);
	}

	@Override
	public void actionPerformed(ActionEvent e)
	{
		// Get input values
		String name = nameField.getText().trim();
		String ageText = ageField.getText().trim();
		String contact = contactField.getText().trim();
		String fatherName = fatherNameField.getText().trim();
		String incomeText = incomeField.getText().trim();

		// Validation
		if (name.isEmpty() || fatherName.isEmpty() || ageText.isEmpty()
				|| contact.isEmpty() || incomeText.isEmpty())
		{
			JOptionPane.showMessageDialog(this, "All fields must be filled!",
					"Error", JOptionPane.ERROR_MESSAGE);
			return;
		}

		int age;
		try
		{
			age = Integer.parseInt(ageText);
			if (age <= 0 || age > 120)
			{
				JOptionPane.showMessageDialog(this, "Age must be between 1 and 120!",
						"Error", JOptionPane.ERROR_MESSAGE);
				return;
			}
		}
		catch (NumberFormatException ex)
		{
			JOptionPane.showMessageDialog(this, "Age must be a valid number!",
					"Error", JOptionPane.ERROR_MESSAGE);
			return;
		}

		if (!contact.matches("\\d{10}"))
		{
			JOptionPane.showMessageDialog(this, "Contact must be a 10-digit number!",
					"Error", JOptionPane.ERROR_MESSAGE);
			return;
		}

		double income;
		try
		{
			income = Double.parseDouble(incomeText);
			if (income < 0)
			{
				JOptionPane.showMessageDialog(this, "Income cannot be negative!",
						"Error", JOptionPane.ERROR_MESSAGE);
				return;
			}
		}
		catch (NumberFormatException ex)
		{
			JOptionPane.showMessageDialog(this, "Income must be a valid number!",
					"Error", JOptionPane.ERROR_MESSAGE);
			return;
		}

		// If all validations pass
		JOptionPane.showMessageDialog(this,
				"Registration Successful!\n\n"
						+ "Name: " + name + "\n"
						+ "Age: " + age + "\n"
						+ "Contact: " + contact + "\n"
						+ "Father's Name: " + fatherName + "\n"
						+ "Annual Income: " + income,
				"Success", JOptionPane.INFORMATION_MESSAGE);
	}

	
	public static void main(String[] args)
	{
		SwingUtilities.invokeLater(new Runnable()
		{
			public void run() 
			{
				new StudentRegistration().setVisible(true);
		        }
	});

}
}
