import db.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import searchPackage.Search;
import vehiclePackage.Vehicle;
import vehiclePackage.Accessory;
import vehiclePackage.Insurance;
import vehiclePackage.VehicleInfo;
import reservationPackage.BookingDetail;


public class VehicleSelect extends HttpServlet {

        /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

   //Session and request variables
    HttpSession session = request.getSession(true);
    String vin = request.getParameter("vin");
    String vid = request.getParameter("vid");

    RequestDispatcher rd;
    ServletContext sc = getServletContext();
    BookingDetail bookingDetail;
    Integer bookingId = MySQLDataStoreUtilities.BookingCount() + 1;
    synchronized (session){
        bookingDetail= (BookingDetail)session.getAttribute("bookingDetail");
      if(bookingDetail == null){
        bookingDetail = new BookingDetail();
        session.setAttribute("bookingDetail",bookingDetail);
      }
        bookingDetail.setVehicleId(vid);
        bookingDetail.setVehicleVin(vin);
        bookingDetail.setBookingId(bookingId);

    }
    // Search class carries the information about the search criteria
    // availableVehicle carries  Vehicles available as per the search criteria
    HashMap<String,Vehicle> availableVehicle = ( HashMap<String,Vehicle> )  session.getAttribute("availableVehicle");
    //Retrieving vehicles Info from vehiclesInfo table
    HashMap<String,VehicleInfo> vehiclesInfo = ( HashMap<String,VehicleInfo> )  session.getAttribute("vehiclesInfo");
    HashMap<Integer,Accessory> accessories = MySQLDataStoreUtilities.getAccessoryDetail();
    HashMap<Integer,Insurance> insurances = MySQLDataStoreUtilities.getInsuranceDetail();

    session.setAttribute("accessories",accessories);
    session.setAttribute("insurances",insurances);

    rd = sc.getRequestDispatcher("/ChooseExtras.jsp");
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
