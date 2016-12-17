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


public class ViewReservation extends HttpServlet {

	List<String> custInfo = null;
	List<String> btransacInfo = null;
	List<String> bdetailInfo = null;
	List<String> btimeInfo = null;
	List<String> vInfo = null;
	List<String> iInfo = null;
	List<String> accInfo = null;
	List<String> locInfo = null;
	List<String> vehicle = null;

        /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

   //Session and request variables
    HttpSession session = request.getSession(true);
    String bId = request.getParameter("bookingId");
	String custId = request.getParameter("customerId");

    RequestDispatcher rd;
    ServletContext sc = getServletContext();

	btransacInfo = MySqlDataStoreUtilities.viewReservationFromBookingTransaction(bId);

	bdetailInfo = MySqlDataStoreUtilities.viewReservationFromBookingDetail(custId);
	String lId = bdetailInfo.get(5);
	String iId = bdetailInfo.get(6);
	String accId = bdetailInfo.get(9);  //need to add in insert query in booking detail

	btimeInfo = MySQLDataStoreUtilities.viewReservationFromBookingTime(bId);
	String vId = btimeInfo.get(2);

	vInfo = MySQLDataStoreUtilities.viewReservationFromVehicleInfo(vId);

	iInfo = MySQLDataStoreUtilities.viewReservationFromVehicleInfo(iId);

	accInfo = MySQLDataStoreUtilities.viewReservationFromAccessory(accId);

	locInfo = MySQLDataStoreUtilities.viewReservationFromLocation(lId);

	vehicle = MySQLDataStoreUtilities.viewReservationFromVehicle(vId);

    session.setAttribute("custInfo",custInfo);
    session.setAttribute("btransacInfo",btransacInfo);
	session.setAttribute("bdetailInfo",bdetailInfo);
    session.setAttribute("btimeInfo",btimeInfo);
	session.setAttribute("vInfo",vInfo);
    session.setAttribute("iInfo",iInfo);
	session.setAttribute("accInfo",accInfo);
    session.setAttribute("locInfo",locInfo);
	session.setAttribute("vehicle",vehicle);

	session.setAttribute("custId",custId);

    rd = sc.getRequestDispatcher("/ViewReservation.jsp");
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
