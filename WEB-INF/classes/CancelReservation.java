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


public class CancelReservation extends HttpServlet {

        /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

   //Session and request variables
    HttpSession session = request.getSession(true);
    String bId = request.getParameter("bookingId");

    RequestDispatcher rd;
    ServletContext sc = getServletContext();

	MySQLDataStoreUtilities.cancelReservation(bId);

	session.setAttribute("bId",bId);

    rd = sc.getRequestDispatcher("/CancelReservation.jsp");
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
