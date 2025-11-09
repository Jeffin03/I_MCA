// Write a Java Servlet Program for HTTP Status
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/HttpStatusServlet")
public class HttpStatusServer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	
    	String codeParam = request.getParameter("code");
    	
    	// Get parameter "code"
    	if(codeParam == null) {
    		// if no status code is provided -> return 200 OK
    		response.setStatus(HttpServletResponse.SC_OK);
    		out.println("<h2>HTTP Status: 200 OK</h2>");
    		out.println("<p>No status code provided, showing default OK response.</p>");
    		  		
    	} else {
    		int code = Integer.parseInt(codeParam);
    		
    		
    		switch(code){
    		case 200:
    			response.setStatus(HttpServletResponse.SC_OK);
    			out.println("<h2>HTTP Status: 200 (OK)</h2>");
    			out.println("<p>Request processed successfully</p>");
    			break;
    			
    		case 404:
    			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
    			out.println("<h2>HTTP Status: 404 (Not Found)</h2>");
    			out.println("<p>The requested resource was not found on the server.</p>");
    			break;
    			
    		case 500:
    			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    			out.println("<h2>HTTP Status: 500 (Internal Server Error)</h2>");
    			out.println("<p>Something went wrong on the server.</p>");
    			break;
    			
    		case 403:
    			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
    			out.println("<h2>HTTP Status: 403 (Forbidden)</h2>");
    			out.println("<p>You don't have permission to access this resource.</p>");
    			break;
    			
    		default:
    			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    			out.println("<h2>HTTP Status: 400 (Bad Request)</h2>");
    			out.println("<p>Invalid status code provided: "+ code + "</p>");
    			break;
    			
    		}
    	}
    }
	
}
