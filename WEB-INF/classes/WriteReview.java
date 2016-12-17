import db.*;
import java.io.*;
import java.util.*;
import com.mongodb.*;
import javax.servlet.*;
import javax.servlet.http.*;
import reviewPackage.ReviewVehicle;

public class WriteReview extends HttpServlet{

  public void processRequest(HttpServletRequest request, HttpServletResponse response)
  throws ServletException,IOException{

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    RequestDispatcher rd;
    ServletContext sc = getServletContext();

    String vehicleType = request.getParameter("vehicleType");
    String vehicleMake = request.getParameter("vehicleMake");
    String vehicleModel = request.getParameter("vehicleModel");
    String vehicleId = request.getParameter("vehicleId");
    String locationName = request.getParameter("locationName");
    String locationZip = request.getParameter("locationZip");
    String locationCity = request.getParameter("locationCity");
    String locationState = request.getParameter("locationState");
    String locationCountry = request.getParameter("locationCountry");
    String userEmailId = request.getParameter("userEmailId");
    String userAge = request.getParameter("userAge");
    String userGender = request.getParameter("userGender");
    String userOccupation = request.getParameter("userOccupation");
    String reviewRating1 = request.getParameter("reviewRating");
    Integer reviewRating = Integer.parseInt(reviewRating1);
    String reviewText = request.getParameter("reviewText");
    HttpSession session = request.getSession(true);

    ReviewVehicle review = new ReviewVehicle(vehicleType, vehicleMake,vehicleModel,vehicleId,locationName,locationZip,locationCity,locationState,locationCountry,userEmailId,userAge,userGender,userOccupation,reviewRating,reviewText);

    db.MongoDBDataStoreUtilities.insertVehicleReview(review);

    rd = sc.getRequestDispatcher("/Vehicles.jsp?selectedCarType=all");
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

public static void main(String[] args){



}


}
