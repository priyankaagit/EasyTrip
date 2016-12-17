import db.*;
import java.util.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;
import searchPackage.Search;
import java.text.DateFormat;
import vehiclePackage.Vehicle;
import vehiclePackage.Insurance;
import vehiclePackage.Accessory;
import java.text.SimpleDateFormat;
import vehiclePackage.VehicleInfo;
import reservationPackage.Account;
import reservationPackage.BookingTime;
import reservationPackage.BookingPlace;
import reservationPackage.BookingDetail;
import registerPackage.Customer;


public class BookingConfirm extends HttpServlet {

        /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

   //Session and request variables
    HttpSession session = request.getSession(true);
    RequestDispatcher rd;
    ServletContext sc = getServletContext();

    //Collecting user information
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String emailId = request.getParameter("emailId");
    String phoneNumber = request.getParameter("phoneNumber");
    String licenseNumber = request.getParameter("licenseNumber");
	
	Customer cust = (Customer)session.getAttribute("customer");


    //Collecting payment detail
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String country = request.getParameter("country");
    String zip = request.getParameter("zip");
    String billingPhoneNumber = request.getParameter("billingPhoneNumber");



    //Collecting billing information
    String cardName = request.getParameter("cardName");
    String cardType = request.getParameter("cardType");
    String cardNum = request.getParameter("cardNum");
    String ccExpirationYear = request.getParameter("ccExpirationYear");
    String ccExpirationMonth = request.getParameter("ccExpirationMonth");
    String cvv = request.getParameter("cvv");



   //Collecting search result, insurance detail, vehicle detail befor inserting them to database
    Search search =  (Search)session.getAttribute("search");
    BookingDetail bookingDetail = (BookingDetail) session.getAttribute("bookingDetail");
    HashMap<String,VehicleInfo> vehiclesInfo = (HashMap<String,VehicleInfo>)session.getAttribute("vehiclesInfo");
    HashMap<Integer,Insurance> insurances = (HashMap<Integer,Insurance>) session.getAttribute("insurances");
    HashMap<String,Vehicle> vehicles  = (HashMap<String,Vehicle>)session.getAttribute("availableVehicle");
	

    //Collecting vehicle information

    String vid = bookingDetail.getVehicleId();
    String vin = bookingDetail.getVehicleVin();
    Vehicle vehicle = vehicles.get(vin);
    VehicleInfo vehicleInfo = vehiclesInfo.get(vid);


    //Collecting insurance and accessories
    Integer insuranceId = bookingDetail.getInsuranceId();
    ArrayList<Accessory> accessories = bookingDetail.getAccessory();
    Insurance insurance = insurances.get(insuranceId);

   //Collecting reservation date and time
  // String bookingId = "ETC12345678";


  //   bookingDetail.setBookingId(bookingId);
  // System.out.println("Vehicle is inside BookingConfirm is "+bookingDetail.getBookingId());
  
	//updating bookingTime
    BookingTime bookingTime = (BookingTime) session.getAttribute("bookingTime");
    bookingTime.setBookingId(bookingDetail.getBookingId());

    //Price calculation
	Integer dayDiff = bookingTime.getDayDiff();
    double vehiclePrice = vehicleInfo.getVehiclePrice();
    double insurancePrice = insurance.getInsurancePrice();
    double accessoryPrice = 0.0;
    for(Accessory ac:accessories)
    accessoryPrice += ac.getHourPrice();
    double totalPrice = (vehiclePrice + insurancePrice + accessoryPrice)*dayDiff;
    double tax = totalPrice * (10.0/100.0);
    totalPrice += tax;

    //updating bookingDetail
    bookingDetail.setLocationId(search.getPickUpLocation());

    bookingDetail.setCustomerAge(search.getCustomerAge());
    bookingDetail.setCustomerName(firstName+" "+lastName);
    bookingDetail.setCustomerPhone(phoneNumber);
    bookingDetail.setTotalPrice(totalPrice);
    bookingDetail.setDrivingLicense(licenseNumber);
    bookingDetail.setEmailId(emailId);
  



  //  System.out.println("booking  place is"+bookingPlace.getPickUpLocation());
  //  System.out.println("booking place is"+bookingPlace.getReturnLocation());
   // Capturing booking time
   try{
          DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
          Date dateobj = new Date();
          String bookingDate1 = df.format(dateobj);
          DateFormat df1 = new SimpleDateFormat("hh:mm:ss");
          String bookingTime1 = df1.format(dateobj);
          bookingDetail.setBookingDate(bookingDate1);
          bookingDetail.setBookingTime(bookingTime1);
   }catch(Exception e){

   }


   //Creating billing information
   Account account = new Account(bookingDetail.getBookingId(),cardName,cardNum,cardType,ccExpirationMonth,ccExpirationYear,
   cvv,address1,address2,city,country,zip,billingPhoneNumber);
  MySQLDataStoreUtilities.insertPaymentTransaction(account);
//  bookingTime.setBookingId(5);
  MySQLDataStoreUtilities.insertBookingTime(bookingTime);
  System.out.println("Customer is id"+cust.getCustomerId());
  Integer custId = cust.getCustomerId();
  if(custId!=null)
  bookingDetail.setCustomerId(cust.getCustomerId());
	else
	System.out.println("Customer is null");
  
  MySQLDataStoreUtilities.insertBookingDetail(bookingDetail);

   session.setAttribute("account",account);

   //

   ArrayList<Accessory> accList = bookingDetail.getAccessory();
   if(accList !=null){
     for(Accessory acc : accList){
       MySQLDataStoreUtilities.insertAccessory(bookingDetail.getBookingId(),acc.getAccId(),acc.getHourPrice());
     }

   }

    rd = sc.getRequestDispatcher("/BookingConfirmation.jsp");
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
