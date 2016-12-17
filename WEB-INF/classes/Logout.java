import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Logout extends HttpServlet{

  public void processRequest(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException{
    HttpSession session = request.getSession(true);
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    session.invalidate();
    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
    rd.forward(request,response);
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException{
    processRequest(request,response);

  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException{
    processRequest(request,response);

  }
}
