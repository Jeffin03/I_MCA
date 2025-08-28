/* Write a Java Program to create a swing program for student
registration containing all the fields Name,Age, Contact,
Father's Name, Annual Income, and submit button.
Perform field validations. */

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

public class StudentRegistration{
	public static void main(String []args)
		{
			final JFrame frame = new JFrame("Student Registration Form");
			frame.setLayout(new GridLayout(6,2,2,0));
			JTextField nameField = new JTextField(10);
			JTextField ageField = new JTextField(10);
			JTextField contactField = new JTextField(10);
			JTextField fatherNameField = new JTextField(10);
			JTextField incomeField = new JTextField(10);
			
			

			JButton submitButton = new JButton("Submit");
			// set button action

			submitButton.addActionListener(new ActionListener()
			{
				public void actionPerformed(ActionEvent e)
				{
					JOptionPane.showMessageDialog(frame, "Button Clicked!");
				}
			});
		
		frame.add(new JLabel("Name:"));
		frame.add(nameField);
		frame.add(new JLabel("Age:"));
		frame.add(ageField);
		frame.add(new JLabel("Contact:"));
		frame.add(contactField);
		frame.add(new JLabel("Father's Name:"));
		frame.add(fatherNameField);
		frame.add(new JLabel("Annual Income:"));
		frame.add(incomeField);


		frame.add(submitButton);

		
		frame.setSize(500,600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);


	}

}