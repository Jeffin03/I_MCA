<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Marks</title>
</head>
<body>
    <h1>Student Marks System</h1>
    <%
        Connection con = null;
        String message = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "root");
            String action = request.getParameter("action");
            if ("add".equals(action)) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO students VALUES (?, ?, ?)"); 
                ps.setString(1, request.getParameter("roll_number"));
                ps.setString(2, request.getParameter("name"));
                ps.setInt(3, Integer.parseInt(request.getParameter("percentage")));
                ps.executeUpdate();
                message = "Student added!";
                ps.close();
            }
            if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement("UPDATE students SET name=?, percentage=? WHERE roll_number=?");
                ps.setString(1, request.getParameter("name"));
                ps.setInt(2, Integer.parseInt(request.getParameter("percentage")));
                ps.setString(3, request.getParameter("roll_number"));
                ps.executeUpdate();
                message = "Student updated!";
                ps.close();
            }
            if ("delete".equals(action)) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM students WHERE roll_number=?");
                ps.setString(1, request.getParameter("roll_number"));
                ps.executeUpdate();
                message = "Student deleted!";
                ps.close();
            }

        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
 
        if (!message.isEmpty()) out.println("<h3>" + message + "</h3>");
    %>
    <h2>Manage Students</h2>
    <form method="post">
        Roll Number: <input type="text" name="roll_number"><br><br>
        Name: <input type="text" name="name"><br><br>
        Percentage: <input type="number" name="percentage"><br><br>
        <button type="submit" name="action" value="add">Add</button>
        <button type="submit" name="action" value="update">Update</button>
        <button type="submit" name="action" value="delete">Delete</button>
    </form>
    <hr>
    <h2>Student List</h2>
    <table border="1">
        <tr>
  <th>Roll Number</th>
            <th>Name</th>
            <th>Percentage</th>
        </tr>
        <%
            try {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM students");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("roll_number") + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getInt("percentage") + "%</td>");
                    out.println("</tr>");
                }
                rs.close();
                st.close();
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
