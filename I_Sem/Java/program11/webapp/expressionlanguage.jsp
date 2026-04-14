<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Expression Language (EL) in JSP</title>
</head>
<body>
    <h2>Expression Language (EL) Example</h2>

    <!-- Form to send data -->
    <form action="expressionlanguage.jsp" method="post">
        <label>Enter Your Name:</label>
        <input type="text" name="username"><br><br>

        <label>Enter First Number:</label>
        <input type="text" name="num1"><br><br>

        <label>Enter Second Number:</label>
        <input type="text" name="num2"><br><br>

        <input type="submit" value="Submit">
    </form>

    <hr>

    <h3>Output using JSP Expression Language (EL):</h3>

    <p><b>Name:</b> ${param.username}</p>

    <p><b>First Number:</b> ${param.num1}</p>
    <p><b>Second Number:</b> ${param.num2}</p>

    <h4>Arithmetic using EL:</h4>
    <ul>
        <li>Addition: ${param.num1 + param.num2}</li>
        <li>Subtraction: ${param.num1 - param.num2}</li>
        <li>Multiplication: ${param.num1 * param.num2}</li>
        <li>Division: ${param.num1 / param.num2}</li>
    </ul>

    <h4>Conditional Check using EL:</h4>
    <p>
        Is First Number greater than Second Number?
        ${param.num1 > param.num2}
    </p>

    <p>
        Are both numbers equal?
        ${param.num1 == param.num2}
    </p>

</body>
</html>
