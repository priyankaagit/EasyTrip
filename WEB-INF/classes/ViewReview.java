
import db.*;
import java.io.*;
import java.util.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import reviewPackage.ReviewVehicle;

public class ViewReview extends HttpServlet {

	ArrayList<ReviewVehicle> listReview = new ArrayList<ReviewVehicle>();

	public void processRequest(HttpServletRequest request,HttpServletResponse response)
	throws ServletException, IOException {

	//Session and request variables
    HttpSession session = request.getSession(true);
    RequestDispatcher rd;
    ServletContext sc = getServletContext();

	  String vehicleID = request.getParameter("vehicleId");

  	listReview = MongoDBDataStoreUtilities.searchVehicleReview(vehicleID);

  	session.setAttribute("reviewList",listReview);

    rd = sc.getRequestDispatcher("/ViewReviewsVehicle.jsp");
    rd.forward(request,response);

    }

    /** Handles the HTTP <code>GET</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
}
