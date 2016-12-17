import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import registerPackage.Customer;
import db.MySQLDataStoreUtilities;

public class UpdateCustomerAdminServlet extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		// Session and request variables
		HttpSession session = request.getSession(true);

		String firstName = request.getParameter("firstName");

		String lastName = request.getParameter("lastName");
		String emailId = request.getParameter("emailId");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		String licenseNumber = request.getParameter("licenseNumber");
		int customerId = Integer.parseInt(request.getParameter("customerId"));

		Customer addCustomerAdminConstructor = new Customer(customerId, firstName, lastName, emailId, password,
				phoneNumber, licenseNumber);
		MySQLDataStoreUtilities.updateCustomerInformation(addCustomerAdminConstructor);

		RequestDispatcher rd;
		ServletContext sc = getServletContext();

		// session.setAttribute("firstName", firstName);
		// session.setAttribute("lastName", lastName);
		// Retrieving vehicles Info from vehiclesInfo table

		rd = sc.getRequestDispatcher("/AddCustomerAdminMessage.jsp?action=update");
		rd.forward(request, response);

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
