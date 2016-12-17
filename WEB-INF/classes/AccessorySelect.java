import db.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import searchPackage.Search;
import vehiclePackage.Vehicle;
import vehiclePackage.VehicleInfo;
import vehiclePackage.Accessory;
import reservationPackage.BookingTime;
import reservationPackage.BookingPlace;
import reservationPackage.BookingDetail;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class AccessorySelect extends HttpServlet {

        /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

   //Session and request variables
    HttpSession session = request.getSession(true);
    Integer insuranceNumber = Integer.parseInt(request.getParameter("insurance"));
    String[] accessoriesList =  request.getParameterValues("accessory");

    BookingDetail bookingDetail = (BookingDetail) session.getAttribute("bookingDetail");
    RequestDispatcher rd;
    ServletContext sc = getServletContext();
    HashMap<Integer,Accessory> accessories = ( HashMap<Integer,Accessory> )  session.getAttribute("accessories");
    Search search =  (Search)session.getAttribute("search");


   //Updating bookingDetail with insurance and accessories seleceted
    bookingDetail.setInsuranceId(insuranceNumber);
    //bookingDetail.setAccessory(accessoriesList1);
    //  bookingDetail.setAccessory(accessoriesList1);
   ArrayList<Accessory> accList = new ArrayList<Accessory>();
    if(accessoriesList !=null)
    for(String key:accessoriesList){
       accList.add(accessories.get(Integer.parseInt(key)));
    //  System.out.println(key);
    }
    bookingDetail.setAccessory(accList);


    //Setting time and place for reservation

    String pickUpDate = search.getPickUpDate();
    String pickUpTime = search.getPickUpTime();
    String returnDate = search.getReturnDate();
    String returnTime = search.getReturnTime();


   java.sql.Timestamp startTimestamp = MySQLDataStoreUtilities.getTimeStamp(pickUpDate,pickUpTime);
   java.sql.Timestamp endTimestamp = MySQLDataStoreUtilities.getTimeStamp(returnDate,returnTime);
    String startTime = startTimestamp.toString();
    String endTime = endTimestamp.toString();
  // long c = (endTimestamp.getTime() - sratTimestamp.getTime());
  
		HashMap<String,Vehicle> availableVehicle = (HashMap<String,Vehicle>)session.getAttribute("availableVehicle");
		
		Vehicle myVehicle = availableVehicle.get(bookingDetail.getVehicleVin());

//System.out.println("end_time"+endTimestamp.getTime() );
  Integer dayDiff = MySQLDataStoreUtilities.getHourDiff(startTimestamp,endTimestamp);
  BookingTime bookingTime = new BookingTime(0,bookingDetail.getVehicleVin(),bookingDetail.getVehicleId(),myVehicle.getVehicleType(),startTimestamp,endTimestamp,dayDiff);
  BookingPlace bookingPlace = new BookingPlace(0,search.getPickUpLocation(),search.getReturnLocation());
  session.setAttribute("bookingTime",bookingTime);
  session.setAttribute("bookingPlace",bookingPlace);
  System.out.println("dayDiff is "+dayDiff);

    rd = sc.getRequestDispatcher("/ReviewBooking.jsp");
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
