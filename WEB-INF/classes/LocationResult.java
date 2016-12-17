import java.io.*;
import java.util.*;
import vehiclePackage.*;
import javax.servlet.*;
import javax.servlet.http.*;
import db.*;

public class LocationResult extends HttpServlet{

  public void processRequest(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException{

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    RequestDispatcher rd;
    ServletContext sc = getServletContext();

    String searchLocation = request.getParameter("locationSearchQuery");
    HttpSession session = request.getSession(true);

    HashMap<Integer, Location> location = db.MySQLDataStoreUtilities.searchLocation(searchLocation);
  //  Integer locationId = location.keySet();
    //Location loc = location.get(locationId);

    session.setAttribute("location",location);
    rd = sc.getRequestDispatcher("/LocationResults.jsp");
    rd.forward(request,response);


  }
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
  }


  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
  }

}
