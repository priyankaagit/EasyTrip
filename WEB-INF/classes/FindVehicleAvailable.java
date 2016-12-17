import db.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import searchPackage.Search;
import vehiclePackage.Vehicle;
import vehiclePackage.VehicleInfo;


public class FindVehicleAvailable extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
		
	RequestDispatcher rd;
	ServletContext sc = getServletContext();

   //Session and request variables
    HttpSession session = request.getSession(true);
    String pickUpLocation = request.getParameter("pickUpLocation");
    String returnLocation = request.getParameter("returnLocation");
    String pickUpDate = request.getParameter("pickUpDate");
    String returnDate = request.getParameter("returnDate");
    String pickUpTime = request.getParameter("pickUpTime")+":00";
    String returnTime = request.getParameter("returnTime")+":00";
    Integer customerAge = Integer.parseInt(request.getParameter("customerAge"));
    String vehicleType = request.getParameter("vehicleType");
	
	String getLocationIdForPickUpLocation="";
	if( !pickUpLocation.equals("") ||  !returnLocation.equals("") ||  !pickUpDate.equals("") || !returnDate.equals(""))
	{
		getLocationIdForPickUpLocation = MySQLDataStoreUtilities.getLocationIdForPickUpLocation(pickUpLocation);
		
		Search search;
		
		// Search class carries the information about the search criteria
		synchronized (session){
		  search = (Search)session.getAttribute("search");
		  if(search == null){
			search = new Search();
			session.setAttribute("search",search);
		  }
		  search.setPickUpLocation("LO"+getLocationIdForPickUpLocation);
		  search.setReturnLocation(returnLocation);
		  search.setPickUpDate(pickUpDate);
		  search.setPickUpTime(pickUpTime);
		  search.setReturnDate(returnDate);
		  search.setReturnTime(returnTime);
		  search.setCustomerAge(customerAge);
		  search.setVehicleType(vehicleType);

		}


		// availableVehicle carries  Vehicles available as per the search criteria
		HashMap<String,Vehicle> availableVehicle = MySQLDataStoreUtilities.getVehicleAvailable(search);
		session.setAttribute("availableVehicle",availableVehicle);
		if(availableVehicle.isEmpty())
		System.out.println("no vehicle available");
		for(String key:availableVehicle.keySet()){
		  Vehicle ve = availableVehicle.get(key);
		  String vin = ve.getVehicleId();
	  
		}
		//Retrieving vehicles Info from vehiclesInfo table
		HashMap<String,VehicleInfo> vehiclesInfo = MySQLDataStoreUtilities.getVehicleInfo();
		session.setAttribute("vehiclesInfo",vehiclesInfo);

		rd = sc.getRequestDispatcher("/VehiclesAvailable.jsp");
		rd.forward(request,response);
	}
	else
	{
		rd = sc.getRequestDispatcher("/index.jsp?action=emptyFields");
		rd.forward(request,response);
	}
		
	
    

    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
}
