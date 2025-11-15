import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/ExceptionDemoServlet")
public class ExceptionDemoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        String inputValue = request.getParameter("inputValue");
        response.setContentType("text/html");
        try {
            if (type == null || type.isEmpty()) throw new IllegalArgumentException("No exception type provided!");
            switch (type) {
                case "arithmetic":
                    int divisor = Integer.parseInt(inputValue);
                    int result = 100 / divisor;
                    response.getWriter().println("<h3>Result of 100 / " + divisor + " = " + result + "</h3>");
                    break;
                case "numberformat":
                    int number = Integer.parseInt(inputValue);
                    response.getWriter().println("<h3>Parsed number: " + number + "</h3>");
                    break;
                case "nullpointer":
                    String str = inputValue.isEmpty() ? null : inputValue;
                    int len = str.length();
                    response.getWriter().println("<h3>Length of input: " + len + "</h3>");
                    break;
                case "arrayindex":
                    int[] arr = {10, 20, 30};
                    int idx = Integer.parseInt(inputValue);
                    int val = arr[idx];
 response.getWriter().println("<h3>Value at index " + idx + " is " + val + "</h3>");
                    break;
                case "classnotfound":
                    Class.forName("com.unknown." + inputValue);
                    response.getWriter().println("<h3>Class found (unexpected)</h3>");
                    break;
                default:
                    response.getWriter().println("<h3>No valid exception type selected.</h3>");
                    break;
            }
        } catch (ArithmeticException e) {
            response.getWriter().println("<h3>Caught ArithmeticException: " + e.getMessage() + "</h3>");
        } catch (NumberFormatException e) {
            response.getWriter().println("<h3>Caught NumberFormatException: " + e.getMessage() + "</h3>");
        } catch (NullPointerException e) {
            response.getWriter().println("<h3>Caught NullPointerException: " + e.getMessage() + "</h3>");
        } catch (ArrayIndexOutOfBoundsException e) {
            response.getWriter().println("<h3>Caught ArrayIndexOutOfBoundsException: " + e.getMessage() + "</h3>");
        } catch (ClassNotFoundException e) {
            response.getWriter().println("<h3>Caught ClassNotFoundException: " + e.getMessage() + "</h3>");
        } catch (Exception e) {
            response.getWriter().println("<h3>Some other exception caught: " + e.getMessage() + "</h3>");
        }
    }
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.getWriter().println("<h3>Please send a POST request with a 'type' and 'inputValue' parameter.</h3>");
    }
}
