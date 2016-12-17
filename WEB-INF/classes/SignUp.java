import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registerPackage.Customer;
import db.MySQLDataStoreUtilities;


public class SignUp extends HttpServlet{


  public void init(){

  }


  public void processRequest(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException{

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    RequestDispatcher rd;
    ServletContext sc = getServletContext();

    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String emailId = request.getParameter("emailId");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String licenseNo = request.getParameter("licenseNo");
    boolean status = db.MySQLDataStoreUtilities.checkCustomer(emailId);
    String customerType = "customer";

    if (status){
      rd = sc.getRequestDispatcher("/SignUp.jsp?action=usernameAlreadyExists");
      rd.forward(request,response);

    }
    else if (!firstName.equals("") || !lastName.equals("") || !emailId.equals("") || !phone.equals("") || !password.equals("") || !licenseNo.equals(""))
	{
      Customer customer = new Customer(firstName,lastName,emailId,password,phone,licenseNo,customerType);
      MySQLDataStoreUtilities.insertCustomer(customer);
      rd = sc.getRequestDispatcher("/Login.jsp?action=signUpSuccessful");
      rd.forward(request,response);
    }
	else
	{
		rd = sc.getRequestDispatcher("/SignUp.jsp?action=blankFields");
		rd.forward(request,response);
	}


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
