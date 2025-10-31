<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Arithmetic Operations in JSP</title>
</head>
<body>
    <h2>Basic Arithmetic Operations</h2>

    <form method="post" action="arithmetic.jsp">
        <label>Enter First Number:</label>
        <input type="text" name="num1"><br><br>

        <label>Enter Second Number:</label>
        <input type="text" name="num2"><br><br>

        <label>Select Operation:</label>
        <select name="operation">
            <option value="add">Addition (+)</option>
            <option value="sub">Subtraction (-)</option>
            <option value="mul">Multiplication (×)</option>
            <option value="div">Division (÷)</option>
        </select><br><br>

        <input type="submit" value="Calculate">
    </form>

    <hr>

    <%
        // Fetch input values only when the form is submitted
        String n1 = request.getParameter("num1");
        String n2 = request.getParameter("num2");
        String op = request.getParameter("operation");

        if (n1 != null && n2 != null && op != null && !n1.isEmpty() && !n2.isEmpty()) {
            try {
                double num1 = Double.parseDouble(n1);
                double num2 = Double.parseDouble(n2);
                double result = 0;

                switch (op) {
                    case "add":
                        result = num1 + num2;
                        out.println("<h3>Result: " + num1 + " + " + num2 + " = " + result + "</h3>");
                        break;
                    case "sub":
                        result = num1 - num2;
                        out.println("<h3>Result: " + num1 + " - " + num2 + " = " + result + "</h3>");
                        break;
                    case "mul":
                        result = num1 * num2;
                        out.println("<h3>Result: " + num1 + " × " + num2 + " = " + result + "</h3>");
                        break;
                    case "div":
                        if (num2 != 0) {
                            result = num1 / num2;
                            out.println("<h3>Result: " + num1 + " ÷ " + num2 + " = " + result + "</h3>");
                        } else {
                            out.println("<h3 style='color:red;'>Error: Division by zero not allowed!</h3>");
                        }
                        break;
                    default:
                        out.println("<h3 style='color:red;'>Invalid Operation!</h3>");
                }
            } catch (NumberFormatException e) {
                out.println("<h3 style='color:red;'>Please enter valid numbers!</h3>");
            }
        }
    %>
</body>
</html>
