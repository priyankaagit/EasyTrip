import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registerPackage.Customer;
import db.MySQLDataStoreUtilities;

public class Login extends HttpServlet{



    public void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      RequestDispatcher rd;
      ServletContext sc = getServletContext();

      String userName = request.getParameter("username");
      String password = request.getParameter("password");
      String userType = request.getParameter("usertype");
      HttpSession session = request.getSession(true);
      HashMap<String, Customer> customers = MySQLDataStoreUtilities.selectCustomer(userName);

      Customer cust = customers.get(userName);


      if(cust == null){
			rd = sc.getRequestDispatcher("/Login.jsp?action=userDoesNotExist");
			rd.forward(request,response);
			//out.println("User does not exists");
      }
      //System.out.println("The customer is"+cust.getEmailId());
	  else if(cust != null)
	  {
		  String realpassword = cust.getPassword();
		  String customerType = cust.getCustomerType();
		  System.out.println("customerType:"+customerType);
		  System.out.println("userType:"+userType);
		  if(password != null && realpassword.equals(password))
		  {
			
			if(customerType.equals("customer") && userType.equals("customer"))
			{
				session.setAttribute("customer",cust);
				rd = sc.getRequestDispatcher("/index.jsp");
				rd.forward(request,response);
			}
			else if(customerType.equals("admin") && userType.equals("admin"))
			{
				rd = sc.getRequestDispatcher("/AdminPortal.jsp");
				rd.forward(request,response);
			}
			else
			{
				rd = sc.getRequestDispatcher("/Login.jsp?action=selectCorrectUserType");
				rd.forward(request,response);
				//out.println("Select correct usertype");
			}
			  
			/*
			session.setAttribute("customer",cust);
			
			if(userType.equals("customer"))
			{
				rd = sc.getRequestDispatcher("/index.jsp");
				rd.forward(request,response);
			}
			
			
			else if(userType.equals("admin"))
			{
				rd = sc.getRequestDispatcher("/AdminPortal.jsp");
				rd.forward(request,response);
			}
			*/
	
		  }
		  else
		  {
			rd = sc.getRequestDispatcher("/Login.jsp?action=incorrectUsernamePassword");
			rd.forward(request,response);
			//out.println("Enter correct Username & Password");
		  }
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
