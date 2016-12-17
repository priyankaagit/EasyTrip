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

public class ModifyReservation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

		HttpSession session = request.getSession(true);

		String bId = request.getParameter("bookingId");
		String cname = request.getParameter("customerName");
        String phno = request.getParameter("phNumber");
		String dlno = request.getParameter("dlNumber");
		String cardtype = request.getParameter("cardType");
        String cardnum = request.getParameter("ccnum");
        String emon = request.getParameter("ccExpirationMonth");
		String eyr = request.getParameter("ccExpirationYear");
		String cvv = request.getParameter("cvv");
        String add1 = request.getParameter("address1");
        String add2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
        String zip = request.getParameter("zip");
        String phnum = request.getParameter("billingPhNum");

		RequestDispatcher rd;
		ServletContext sc = getServletContext();

		MySQLDataStoreUtilities.modifyReservation(bId,cname,phno,dlno,cardtype,cardnum,emon,eyr,cvv,add1,add2,city,country,zip,phnum);

		session.setAttribute("bId",bId);

		rd = sc.getRequestDispatcher("/ModifyReservationStatus.jsp");
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
